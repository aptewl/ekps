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
    QFile dfile("./ekps_db");
    if (!dfile.exists())
    {
        QFile::copy(":database/ekps_db", "./ekps_db");
        QFile::setPermissions("./ekps_db",QFile::WriteOwner | QFile::ReadOwner);
    }
    Database* db= new Database("./ekps_db");

    //upper DB, tmp function
    //db->UpperAllDB();

    // Model settings
    Model_EKPS*  model = new Model_EKPS(db);

    // QML  settings
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("classListmodel", model);
    engine.load(QUrl(QStringLiteral("qrc:/qmls/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    // App start
    return app.exec();
}
