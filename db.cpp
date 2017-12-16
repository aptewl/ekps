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

QList<QPair<QString, int> > Database::GetContextDataPair(QString s1, QString s2, QString s3)
{
    QSqlQuery query;
    query.prepare("select KL.kl_kod AS kod, KL.kl_name as name, KL.is_like as is_like "
                  " from KL where "
                  " (KL.kl_kod like  :s1  AND KL.kl_kod like :s2 AND KL.kl_kod like :s3) "
                  " OR ( KL.kl_name like :s1 AND KL.kl_name like :s2 AND KL.kl_name like :s3) "
                  " OR ( KL.kl_prim like :s1 AND KL.kl_prim like :s2 AND KL.kl_prim like :s3) ");
    query.bindValue(":s1", "%"+s1+"%");
    query.bindValue(":s2", "%"+s2+"%");
    query.bindValue(":s3", "%"+s3+"%");
    query.exec();
    QList<QPair<QString, int> > ListPairClass;
    QPair<QString, int> PairClass;
    while (query.next()) {
        PairClass.first = query.value(0).toString() + " " + query.value(1).toString();
        PairClass.second = query.value(2).toInt();
        ListPairClass.append(PairClass);
    }
    return ListPairClass;
}
