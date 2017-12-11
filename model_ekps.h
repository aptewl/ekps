#ifndef MODEL_EKPS_H
#define MODEL_EKPS_H

#include <QObject>
#include <QAbstractTableModel>

class Model_EKPS : public QAbstractTableModel
{
    Q_OBJECT
public:
    Model_EKPS(QObject *parent=0);
    Model_EKPS(QList< QPair<QString, QString> > listofPairs, QObject *parent=0);
    Model_EKPS(QStringList list, QObject *parent=0);
    int rowCount(const QModelIndex &parent) const;
    int columnCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    //QVariant headerData(int section, Qt::Orientation orientation, int role) const;
    //Qt::ItemFlags flags(const QModelIndex &index) const;
    QHash<int, QByteArray> roleNames() const ;
    bool is_liked();

private:
    QList< QPair<QString, QString> > listOfPairs;
    QStringList list_of_classes;

};

#endif // MODEL_EKPS_H
