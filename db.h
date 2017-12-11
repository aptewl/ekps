#ifndef DB_H
#define DB_H

#include <QtSql>


class Database
{
public:
    Database(QString path_db);
    QStringList GetAllData();
};

#endif // DB_H
