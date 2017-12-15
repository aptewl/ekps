#ifndef DB_H
#define DB_H

#include <QtSql>


class Database
{
public:
    Database(QString path_db);
    QStringList GetAllData();
    QList< QPair<QString, int> > GetAllDataPair();
    QList< QPair<QString, int> > GetAllDataPairLiked();
    QList< QPair<QString, int> > GetContextDataPair(QString s1, QString s2, QString s3);
};

#endif // DB_H
