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
        listOfPairs =  this->v_db->GetContextDataPair(list_of_words[0].toUpper(), list_of_words[1].toUpper(),list_of_words[2].toUpper());
    }
    emit endResetModel();
}

QString Model_EKPS::getCurKlInclude(QString text)
{
    if(text.at(0) != "*"){
        return this->v_db->GetIncludeByKodKl(text.remove(4,text.size()));
    }else{
        return this->v_db->GetIncludeByKodKl(text.remove(5,text.size()));
    }
}

QString Model_EKPS::getCurKlAddInclude(QString text)
{
    if(text.at(0) != "*"){
        return this->v_db->GetAddIncludeByKodKl(text.remove(4,text.size()));
    }else{
        return this->v_db->GetAddIncludeByKodKl(text.remove(5,text.size()));
    }
}

QString Model_EKPS::getCurKlNotInclude(QString text)
{
    if(text.at(0) != "*"){
        return this->v_db->GetNotIncludeByKodKl(text.remove(4,text.size()));
    }else{
        return this->v_db->GetNotIncludeByKodKl(text.remove(5,text.size()));
    }
}

QString Model_EKPS::getCurKlReplaced(QString text)
{
    if(text.at(0) != "*"){
        return this->v_db->GetReplacedByKodKl(text.remove(4,text.size()));
    }else{
        return this->v_db->GetReplacedByKodKl(text.remove(5,text.size()));
    }
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
}

void Model_EKPS::liked_to_NO_liked(QString kl_name, bool is_liked)
{

    //changing model
    QPair<QString, int> pair(kl_name,0);
    QPair<QString, int> pair2(kl_name,1);
    if(is_liked){
        listOfPairs.replace(listOfPairs.indexOf(pair),pair2 );
        emit dataChanged( index(listOfPairs.indexOf(pair2),0),index(listOfPairs.indexOf(pair2),0));
    }else{
        listOfPairs.replace(listOfPairs.indexOf(pair2),pair );
        emit dataChanged( index(listOfPairs.indexOf(pair),0),index(listOfPairs.indexOf(pair),0));
    }
    //changing db
    if(kl_name.at(0) != "*"){
        v_db->Change_is_liked(kl_name.remove(4,kl_name.size()),is_liked);
    }else{
        v_db->Change_is_liked(kl_name.remove(5,kl_name.size()),is_liked);
    }
}
