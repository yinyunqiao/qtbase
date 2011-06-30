/****************************************************************************
**
** Copyright (C) 2009 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the plugins of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include <qgenericplugin_qpa.h>
#include "qtouchscreen.h"
#include "qtoucheventsenderqpa.h"

QT_BEGIN_NAMESPACE

class QTouchScreenPlugin : public QGenericPlugin
{
public:
    QTouchScreenPlugin();

    QStringList keys() const;
    QObject* create(const QString &key, const QString &specification);
};

QTouchScreenPlugin::QTouchScreenPlugin()
{
}

QStringList QTouchScreenPlugin::keys() const
{
    return QStringList() << "LinuxTouchScreen";
}

QObject* QTouchScreenPlugin::create(const QString &key,
                                   const QString &spec)
{
    if (!key.compare(QLatin1String("LinuxTouchScreen"), Qt::CaseInsensitive)) {
        QTouchScreenHandler *h = new QTouchScreenHandler(spec);
        h->addObserver(new QTouchEventSenderQPA);
        return h;
    }

    return 0;
    }

Q_EXPORT_PLUGIN2(qtouchscreenplugin, QTouchScreenPlugin)

QT_END_NAMESPACE