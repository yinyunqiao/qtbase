/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the QtGui module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** No Commercial Usage
** This file contains pre-release code and may not be distributed.
** You may use this file in accordance with the terms and conditions
** contained in the Technology Preview License Agreement accompanying
** this package.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights.  These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** If you have questions regarding the use of this file, please contact
** Nokia at qt-info@nokia.com.
**
**
**
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "qprinterinfo.h"
#include "qprinterinfo_p.h"

#include <qstringlist.h>

#include <qt_windows.h>

QT_BEGIN_NAMESPACE

#ifndef QT_NO_PRINTER

extern QPrinter::PaperSize mapDevmodePaperSize(int s);

QList<QPrinterInfo> QPrinterInfo::availablePrinters()
{
    QList<QPrinterInfo> printers;

    DWORD needed = 0;
    DWORD returned = 0;
    if (!EnumPrinters(PRINTER_ENUM_LOCAL | PRINTER_ENUM_CONNECTIONS, NULL, 4, 0, 0, &needed, &returned)) {
        LPBYTE buffer = new BYTE[needed];
        if (EnumPrinters(PRINTER_ENUM_LOCAL | PRINTER_ENUM_CONNECTIONS, NULL, 4, buffer, needed, &needed, &returned)) {
            PPRINTER_INFO_4 infoList = reinterpret_cast<PPRINTER_INFO_4>(buffer);
            QPrinterInfo defPrn = defaultPrinter();
            for (uint i = 0; i < returned; ++i) {
                QString printerName(QString::fromWCharArray(infoList[i].pPrinterName));

                QPrinterInfo printerInfo(printerName);
                if (printerInfo.printerName() == defPrn.printerName())
                    printerInfo.d_ptr->isDefault = true;
                printers.append(printerInfo);
            }
        }
        delete [] buffer;
    }

    return printers;
}

QPrinterInfo QPrinterInfo::defaultPrinter()
{
    QString noPrinters(QLatin1String("qt_no_printers"));
    wchar_t buffer[256];
    GetProfileString(L"windows", L"device", (wchar_t*)noPrinters.utf16(), buffer, 256);
    QString output = QString::fromWCharArray(buffer);
    if (output != noPrinters) {
        // Filter out the name of the printer, which should be everything before a comma.
        QString printerName = output.split(QLatin1Char(',')).value(0);
        QPrinterInfo printerInfo(printerName);
        printerInfo.d_ptr->isDefault = true;
        return printerInfo;
    }

    return QPrinterInfo();
}

QList<QPrinter::PaperSize> QPrinterInfo::supportedPaperSizes() const
{
    const Q_D(QPrinterInfo);

    QList<QPrinter::PaperSize> paperSizes;
    if (isNull())
        return paperSizes;

    DWORD size = DeviceCapabilities(reinterpret_cast<const wchar_t*>(d->name.utf16()),
                                    NULL, DC_PAPERS, NULL, NULL);
    if ((int)size != -1) {
        wchar_t *papers = new wchar_t[size];
        size = DeviceCapabilities(reinterpret_cast<const wchar_t*>(d->name.utf16()),
                                  NULL, DC_PAPERS, papers, NULL);
        for (int c = 0; c < (int)size; ++c)
            paperSizes.append(mapDevmodePaperSize(papers[c]));
        delete [] papers;
    }

    return paperSizes;
}

#endif // QT_NO_PRINTER

QT_END_NAMESPACE