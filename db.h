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
    QString GetIncludeByKodKl(QString kod);
    void Change_is_liked(QString kod, bool is_liked);
};

#endif // DB_H
