/****************************************************************************
**
** Copyright (C) 2009 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the plugins module of the Qt Toolkit.
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

#ifndef QTOUCHSCREEN_H
#define QTOUCHSCREEN_H

#include <QObject>
#include <QString>
#include <QList>
#include <QThread>
#include <QtGui/private/qwindowsysteminterface_qpa_p.h>

QT_BEGIN_HEADER

struct mtdev;

QT_BEGIN_NAMESPACE

class QSocketNotifier;
class QTouchScreenData;

class QTouchScreenObserver
{
public:
    virtual void touch_configure(int x_min, int x_max, int y_min, int y_max) = 0;
    virtual void touch_point(QEvent::Type state, const QList<QWindowSystemInterface::TouchPoint> &points) = 0;
};

class QTouchScreenHandler : public QObject
{
    Q_OBJECT

public:
    QTouchScreenHandler(const QString &spec = QString());
    ~QTouchScreenHandler();
    void addObserver(QTouchScreenObserver *observer);

private slots:
    void readData();
    void onTimeout();

private:
    void try_udev(QString *path);

    QSocketNotifier *m_notify;
    int m_fd;
    mtdev *m_mtdev;
    QTouchScreenData *d;
};

class QTouchScreenHandlerThread : public QThread
{
public:
    QTouchScreenHandlerThread(const QString &spec, QTouchScreenObserver *observer);
    ~QTouchScreenHandlerThread();
    void run();
    QTouchScreenHandler *handler() { return m_handler; }

private:
    QString m_spec;
    QTouchScreenHandler *m_handler;
    QTouchScreenObserver *m_observer;
};

QT_END_NAMESPACE

QT_END_HEADER

#endif // QTOUCHSCREEN_H
