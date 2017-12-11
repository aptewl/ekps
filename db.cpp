#include "db.h"



Database::Database(QString path_db)
{
    QSqlDatabase sdb = QSqlDatabase::addDatabase("QSQLITE");
    sdb.setDatabaseName(path_db);
    if (!sdb.open()) {
          qDebug() << sdb.lastError().text()<<"**********************" ;
    }
}

QStringList Database::GetAllData()
{
    QSqlQuery query("SELECT KL.kl_kod  AS kod, KL.kl_name as name, KL.kl_prim as prim FROM KL");
    //query.exec();
    QStringList ListClass;
    while (query.next()) {
             QString one_class = query.value(0).toString() + " " + query.value(1).toString();
             ListClass.append(one_class);
    }
    return ListClass;
}
