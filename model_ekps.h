#ifndef MODEL_EKPS_H
#define MODEL_EKPS_H

#include <QAbstractTableModel>
#include "db.h"

class Model_EKPS : public QAbstractTableModel
{
    Q_OBJECT
public:
    Model_EKPS(QObject *parent=0);
    Model_EKPS(Database *l_db, QObject *parent=0);
    Model_EKPS(QList< QPair<QString, int> > listofPairs, QObject *parent=0);
    Model_EKPS(QStringList list, QObject *parent=0);
    int rowCount(const QModelIndex &parent) const;
    int columnCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    //QVariant headerData(int section, Qt::Orientation orientation, int role) const;
    //Qt::ItemFlags flags(const QModelIndex &index) const;
    //void setData(const QModelIndex &index, const QVariant &value, int role);
    QHash<int, QByteArray> roleNames() const;
    Q_INVOKABLE void showOnlyLiked();
    Q_INVOKABLE void showAll();
    Q_INVOKABLE void searchContext(QString search_str);
    Q_INVOKABLE QString getCurKlInclude(QString text);
    Q_INVOKABLE QString getCurKlAddInclude(QString text);
    Q_INVOKABLE QString getCurKlNotInclude(QString text);
    Q_INVOKABLE QString getCurKlReplaced(QString text);
    QList<QString> getWordsFromString(QString search_str);
    Q_INVOKABLE void liked_to_NO_liked(QString kl_name, bool is_liked);
private:
    QList< QPair<QString, int> > listOfPairs;
    QStringList list_of_classes;
    Database *v_db;
};

#endif // MODEL_EKPS_H
