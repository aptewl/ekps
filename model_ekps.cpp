#include "model_ekps.h"
#include <QDebug>

Model_EKPS::Model_EKPS(QObject *parent): QAbstractTableModel(parent)
{

}

Model_EKPS::Model_EKPS(QList<QPair<QString, QString> > pairs, QObject *parent): QAbstractTableModel(parent)
{
    listOfPairs=pairs;
}

Model_EKPS::Model_EKPS(QStringList list, QObject *parent)
{
    list_of_classes = list;
}

int Model_EKPS::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return list_of_classes.size();
}

int Model_EKPS::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return 1;
}

QVariant Model_EKPS::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (index.row() >= list_of_classes.size() || index.row() < 0)
        return QVariant();


    if (role == (Qt::UserRole + 3)) {
        if (index.row() % 3 == 0){
            return "1";
        }
        else {
            return QVariant();
        }
    }



    if (role == (Qt::UserRole + 2)) {
        if (index.row() % 2 != 0){
            return QVariant("#2979ff");
        }
        else {
            return QVariant("#2196f3");
        }
    }

    if (role == (Qt::UserRole + 1)) {
        return list_of_classes.at(index.row());
    }
    return QVariant();
}

QHash<int, QByteArray> Model_EKPS::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Qt::UserRole + 1] = "klass_name";
    roles[Qt::UserRole + 2] = "color";
    roles[Qt::UserRole + 3] = "Is_liked_Role";
    return roles;
}

//bool Model_EKPS::is_liked()
//{

//}



//QVariant Model_EKPS::headerData(int section, Qt::Orientation orientation, int role) const
//{
//    return QVariant();
//}

//Qt::ItemFlags Model_EKPS::flags(const QModelIndex &index) const
//{

//}

