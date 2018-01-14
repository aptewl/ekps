#include "db.h"



Database::Database(QString path_db)
{
    //QSqlDatabase sdb = QSqlDatabase::addDatabase("QSQLITE");
    QSqlDatabase sdb = QSqlDatabase::addDatabase("SQLITECIPHER");
    sdb.setDatabaseName(path_db);
    sdb.setPassword(pswd());
    //sdb.setConnectOptions("QSQLITE_CREATE_KEY");
    //sdb.setConnectOptions("QSQLITE_UPDATE_KEY=new_pass"); // set new password
    //sdb.setConnectOptions("QSQLITE_REMOVE_KEY");
    if (!sdb.open()) {
        qDebug() << sdb.lastError().text()<<"**********************" ;
        qDebug() << "Can not open connection: " << sdb.lastError().driverText();
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
    query.prepare(" select KL.kl_kod AS kod, KL.kl_name as name, KL.is_like as is_like "
                  " from KL where "
                  " /****************************************/  "
                  "  (KL.kl_kod like  :s1  AND KL.kl_kod like :s2 AND KL.kl_kod like :s3)  "
                  " OR ( KL.d_kl_name like :s1 AND KL.d_kl_name like :s2 AND KL.d_kl_name like :s3)  "
                  " OR ( KL.d_kl_prim like :s1 AND KL.d_kl_prim like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR ( KL.d_kl_adding_includ like :s1 AND KL.d_kl_adding_includ like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR ( KL.d_kl_not like :s1 AND KL.d_kl_not like :s2 AND KL.d_kl_not like :s3)  "
                  " /****************************************/ "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  "    "
                  " OR (KL.d_kl_name like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_prim  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_not  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  "   "
                  " OR (KL.d_kl_prim like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_name  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_name  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_name  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_not  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  "   "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_name  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_name  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_name  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_prim  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_not  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_prim like :s3)  "
                  "   "
                  " OR (KL.d_kl_not like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_name  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_name  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_name  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_prim  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_prim like :s3)  "
                  " /****************************************/ "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_name like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_prim like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_adding_includ like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.kl_kod like  :s1  AND KL.d_kl_not like :s2 AND KL.kl_kod like :s3)  "
                  "   "
                  " OR (KL.d_kl_name like  :s1  AND KL.kl_kod like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_name like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_prim like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_adding_includ like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_name like  :s1  AND KL.d_kl_not like :s2 AND KL.d_kl_name like :s3)  "
                  "    "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_prim like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.kl_kod  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_prim like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_prim like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_adding_includ like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_prim like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_prim like  :s1  AND KL.d_kl_not like :s2 AND KL.d_kl_prim like :s3)  "
                  "   "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_adding_includ like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_adding_includ like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_prim like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.kl_kod  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_adding_includ like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_not  like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_adding_includ like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_adding_includ like  :s1  AND KL.d_kl_not like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  "    "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_not like :s2 AND KL.d_kl_name like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_name like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_prim  like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_not like :s2 AND KL.d_kl_prim like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_prim like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_adding_includ  like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_not like :s2 AND KL.d_kl_adding_includ like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_adding_includ like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.kl_kod  like :s2 AND KL.kl_kod like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.kl_kod like :s2 AND KL.d_kl_not like :s3)  "
                  " OR (KL.d_kl_not like  :s1  AND KL.d_kl_not like :s2 AND KL.kl_kod like :s3)  ");
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

QString Database::GetIncludeByKodKl(QString kod)
{
    QSqlQuery query;
    query.prepare("SELECT KL.kl_prim as prim FROM KL where KL.kl_kod like :kod");
    query.bindValue(":kod", kod);
    query.exec();
    query.first();
    return query.value(0).toString();
}

QString Database::GetAddIncludeByKodKl(QString kod)
{
    QSqlQuery query;
    query.prepare("SELECT KL.kl_adding_includ as prim FROM KL where KL.kl_kod like :kod");
    query.bindValue(":kod", kod);
    query.exec();
    query.first();
    return query.value(0).toString();
}

QString Database::GetNotIncludeByKodKl(QString kod)
{
    QSqlQuery query;
    query.prepare("SELECT KL.kl_not as prim FROM KL where KL.kl_kod like :kod");
    query.bindValue(":kod", kod);
    query.exec();
    query.first();
    return query.value(0).toString();
}

QString Database::GetReplacedByKodKl(QString kod)
{
    QSqlQuery query;
    query.prepare("SELECT KL.kl_replaced as prim FROM KL where KL.kl_kod like :kod");
    query.bindValue(":kod", kod);
    query.exec();
    query.first();
    return query.value(0).toString();
}

QString Database::pswd()
{
    //to obtain a password, write to me on e-mail with your name and purpose
    return "";
}

void Database::Change_is_liked(QString kod, bool is_liked)
{
    QSqlQuery query;
    int val_is_like;
    if( is_liked){
        val_is_like = 1;
    }else{
        val_is_like = 0;
    }
    query.prepare("UPDATE KL SET is_like = :val WHERE KL.kl_kod like :kod");
    query.bindValue(":val", val_is_like);
    query.bindValue(":kod", kod);
    query.exec();
}

void Database::UpperAllDB()
{
    QSqlQuery query,query2;
    query.prepare("select distinct KL.kl_kod ,KL.kl_name, KL.kl_prim, KL.kl_adding_includ, KL.kl_not from KL");
    query.exec();
    while (query.next()) {
        query2.clear();
        query2.prepare("update KL set d_kl_name = :name, d_kl_prim = :prim, d_kl_adding_includ = :incl , d_kl_not = :notk where KL.kl_kod like :kod ");
        query2.bindValue(":kod", query.value(0).toString().toUpper());
        query2.bindValue(":name", query.value(1).toString().toUpper());
        query2.bindValue(":prim", query.value(2).toString().toUpper());
        query2.bindValue(":incl", query.value(3).toString().toUpper());
        query2.bindValue(":notk", query.value(4).toString().toUpper());
        query2.exec();
    }
}





















