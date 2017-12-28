#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QtQuick/QQuickView>
#include "model_ekps.h"
#include "db.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // DataBase conection settings
    QFile dfile("./ekps_db1");
    if (!dfile.exists())
    {
        QFile::copy(":/ekps_db1", "./ekps_db1");
        QFile::setPermissions("./ekps_db1",QFile::WriteOwner | QFile::ReadOwner);
    }
    Database* db= new Database("./ekps_db1");

    // Model settings
    Model_EKPS*  model = new Model_EKPS(db);

    // QML  settings
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("classListmodel", model);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    // App start
    return app.exec();
}
