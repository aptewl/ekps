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
    QStringList ListClass;
    while (query.next()) {
             QString one_class = query.value(0).toString() + " " + query.value(1).toString();
             ListClass.append(one_class);
    }
    return ListClass;
}

QList<QPair<QString, int> > Database::GetAllDataPair()
{
    QSqlQuery query("SELECT KL.kl_kod  AS kod, KL.kl_name as name, KL.is_like as is_like FROM KL");
    QList<QPair<QString, int> > ListPairClass;
    QPair<QString, int> PairClass;
    while (query.next()) {
             PairClass.first = query.value(0).toString() + " " + query.value(1).toString();
             PairClass.second = query.value(2).toInt();
             ListPairClass.append(PairClass);
    }
    return ListPairClass;
}

QList<QPair<QString, int> > Database::GetAllDataPairLiked()
{
    QSqlQuery query("SELECT KL.kl_kod  AS kod, KL.kl_name as name, KL.is_like as is_like FROM KL where KL.is_like = 1 ");
    QList<QPair<QString, int> > ListPairClass;
    QPair<QString, int> PairClass;
    while (query.next()) {
             PairClass.first = query.value(0).toString() + " " + query.value(1).toString();
             PairClass.second = query.value(2).toInt();
             ListPairClass.append(PairClass);
    }
    return ListPairClass;
}
