#ifndef LISTITEM_H
#define LISTITEM_H
#include "_listitem.h"

template <typename C>
listItem<C>::~listItem()
{
#ifdef DEBUG
    std::cout << "Деструктор класса ListItem!\n";
#endif
    this->next = nullptr;
}

// Старт списка
template <typename C>
listItem<C>::listItem()
{
    this->next = nullptr;
}

// Добавление элемента в список, который никуда не указывает
template <typename C>
listItem<C>::listItem(C data)
{
    this->data = data;
    this->next = nullptr;
}

// Добавление элемента, который куда-то уже указывает
template<typename C>
listItem<C>::listItem(listItem<C> &elem)
{
    this->data = elem.data;
    this->next = elem.next;
}

// Установка указания на ненулевой элемент
template <typename C>
void listItem<C>::set_next(listItem<C> &elem)
{
    this->next = &elem;
}

// Установка указания на нулевой элемент
template <typename C>
void listItem<C>::destroy_next()
{
    this->next = nullptr;
}

// Получение значения элемента списка
template <typename C>
C listItem<C>::get_data() const
{
    return this->data;
}

// Установка значения элемента списка
template <typename C>
void listItem<C>::set(C data)
{
    this->data = data;
}

// Вставка элемента в начало списка
template <typename C>
list<C>& listItem<C>::operator +(list<C>& l)
{
    l.insert_front(*this);
    return l;

}

// Сверка значений элементов ==
template <typename C>
bool listItem<C>::operator ==(const listItem<C>& elem) const
{
    if(this->data == elem.data)
        return true;
    else
        return false;
}

// Сверка значений элементов >= 
template <typename C>
bool listItem<C>::operator >=(const listItem<C>& elem) const
{
    if(this->data >= elem.data)
        return true;
    else
        return false;
}

// Сверка значений элементов <=
template <typename C>
bool listItem<C>::operator <=(const listItem<C>& elem) const
{
    if(this->data <= elem.data)
        return true;
    else
        return false;
}

// Сверка значений элементов != 
template <typename C>
bool listItem<C>::operator !=(const listItem<C>& elem) const
{
    if(this->data != elem.data)
        return true;
    else
        return false;
}

// Сверка значений элементов >
template <typename C>
bool listItem<C>::operator >(const listItem<C>& elem) const
{
    if(this->data > elem.data)
        return true;
    else
        return false;
}

// Сверка значений элементов <
template <typename C>
bool listItem<C>::operator <(const listItem<C>& elem) const
{
    if(this->data < elem.data)
        return true;
    else
        return false;
}

template <typename C>
std::ostream& operator<<(std::ostream& os, listItem<C>& elem)
{
    os << "listItem with data: " << elem.get_data() << "\n";
    os << "Next item at "<< elem.get_next();

    if (elem.get_next() != nullptr)
        os << " with data: "<< elem.get_next()->get_data() << "\n";
    else
        os << "\n";
    
    return os;
}

#endif // LISTITEM_H
