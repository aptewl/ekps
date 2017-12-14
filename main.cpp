#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QtQuick/QQuickView>
#include "model_ekps.h"
#include "db.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    QFile dfile("./ekps_db.sqlite");
    if (!dfile.exists())
    {
         QFile::copy(":/ekps_db", "./ekps_db.sqlite");
         QFile::setPermissions("./ekps_db.sqlite",QFile::WriteOwner | QFile::ReadOwner);
    }

    Database* db= new Database("./ekps_db.sqlite");
    //Model_EKPS*  model = new Model_EKPS(db.GetAllData());
    //Model_EKPS*  model = new Model_EKPS(db.GetAllDataPair());
    Model_EKPS*  model = new Model_EKPS(db);
    //model->modelReset();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("classListmodel", model);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
