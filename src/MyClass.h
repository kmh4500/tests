#ifndef MYCLASS_H
#define MYCLASS_H
#include <QtQml/QQmlApplicationEngine>
#include <QtGui>
#include <QObject>


class MyClass : public QObject
{
public:
    MyClass() {}
    ~MyClass() {}

    Q_OBJECT
public slots:
    void cppSlot(const QString &msg) {
        qDebug() << "Called the C++ slot with message:" << msg;
    }
};
#endif // MYCLASS_H
