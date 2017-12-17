#include "model_ekps.h"
#include <QDebug>

Model_EKPS::Model_EKPS(QObject *parent): QAbstractTableModel(parent)
{

}

Model_EKPS::Model_EKPS(Database *l_db, QObject *parent): QAbstractTableModel(parent)
{
    this->v_db = l_db;
    listOfPairs = this->v_db->GetAllDataPair();
}

Model_EKPS::Model_EKPS(QList<QPair<QString, int> > pairs, QObject *parent): QAbstractTableModel(parent)
{
    listOfPairs=pairs;
}

Model_EKPS::Model_EKPS(QStringList list, QObject *parent): QAbstractTableModel(parent)
{
    list_of_classes = list;
}

//int Model_EKPS::getModel()
//{
//    return var_var;
//}

//Model_EKPS::Model_EKPS(Database m_db, QObject *parent): QAbstractTableModel(parent)
//{
//    v_db = m_db;
//    listOfPairs = v_db.GetAllDataPair();
//}

int Model_EKPS::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    //return list_of_classes.size();
    return listOfPairs.size();
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

    //if (index.row() >= list_of_classes.size() || index.row() < 0)
    if (index.row() >= listOfPairs.size() || index.row() < 0)
        return QVariant();

    //show heart icon
    if (role == (Qt::UserRole + 3)) {
        return listOfPairs.value(index.row()).second;
    }

    //show blue zebra color
    if (role == (Qt::UserRole + 2)) {
        if (index.row() % 2 != 0){
            return QVariant("#2979ff");
        }
        else {
            return QVariant("#2196f3");
        }
    }


    //show data
    if (role == (Qt::UserRole + 1)) {
        //return list_of_classes.at(index.row());
        return listOfPairs.value(index.row()).first;
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

void Model_EKPS::showOnlyLiked()
{
    listOfPairs.clear();
    listOfPairs =  this->v_db->GetAllDataPairLiked();
    emit endResetModel();
}

void Model_EKPS::showAll()
{
    listOfPairs.clear();
    listOfPairs =  this->v_db->GetAllDataPair();
    emit endResetModel();
}

void Model_EKPS::searchContext(QString search_str)
{
    if(search_str.isEmpty()){
        this->showAll();
    }else{
        listOfPairs.clear();
        QList<QString> list_of_words;
        list_of_words = getWordsFromString(search_str);
        qDebug()<<list_of_words[0]<< list_of_words[1]<<list_of_words[2];
        listOfPairs =  this->v_db->GetContextDataPair(list_of_words[0], list_of_words[1],list_of_words[2]);
    }
    emit endResetModel();
}

QList<QString> Model_EKPS::getWordsFromString(QString search_str)
{
    search_str.trimmed();
    QString word("");
    QList<QString> list_of_words;
    int i = 0;
    for (int k = 0; k < search_str.length(); k++){
        if (((search_str.at(k) == " ")|| (search_str.at(k) == "\n")) && (word.length()>0)){
            if (i < 3){
                list_of_words.append(word);
                word = "";
            }
            i++;
        }else{
            if((search_str.at(k) != " ")|| (search_str.at(k) == "\n")){
                word.append(search_str.at(k));
            }
        }
    }


    if (i == 0){
        list_of_words.append(word);
        list_of_words.append("");
        list_of_words.append("");
    }
    if(i == 1){
        list_of_words.append(word);
        list_of_words.append("");
    }
    if (i == 2){
        list_of_words.append(word);
    }

    return list_of_words;





    //        search_str.trimmed();
    //        if(search_str.isEmpty()){
    //            return "";
    //        }else{
    //     //       for(int i = 1; i <= word_position; i++){
    //            int m, l;
    //               for (int k = 0; k < search_str.length(); k++){
    //    //                if(k < search_str.length()-1){
    //                        if((search_str.at(k) == " ") && (search_str.at(k+1) == " ")){
    //    //                        QString s =  search_str.remove(0, k+1);
    //    //                        if(i == word_position){
    //    //                            return s;
    //    //                        }else{
    //    //                            break;
    //    //                        }
    //    //                    }
    //    //                }else{
    //    //                    if((search_str.at(k+1) == " ")){
    //    //                        return search_str.remove(0, k);
    //    //                    }else{
    //    //                        return search_str;
    //    //                    }
    //    //                }
    //                }
    //            //}
    //        }
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


