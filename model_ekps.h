#ifndef MODEL_EKPS_H
#define MODEL_EKPS_H

#include <QObject>
#include <QAbstractTableModel>
#include "db.h"

class Model_EKPS : public QAbstractTableModel
{
    Q_OBJECT
    //Q_PROPERTY (int var_var READ getModel NOTIFY modelChanged)
public:
    Model_EKPS(QObject *parent=0);
    Model_EKPS(Database *l_db, QObject *parent=0);
    Model_EKPS(QList< QPair<QString, int> > listofPairs, QObject *parent=0);
    Model_EKPS(QStringList list, QObject *parent=0);
//    int getModel();
    //Model_EKPS(Database m_db, QObject *parent=0);
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
    QString getWordFromStringByNumber(QString search_str, int word_position);
    bool is_liked();
//signals:
//    void modelChanged();

private:
    QList< QPair<QString, int> > listOfPairs;
    QStringList list_of_classes;
    Database *v_db;
//    int var_var;

};

#endif // MODEL_EKPS_H
