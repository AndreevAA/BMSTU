#ifndef LIST_HPP
#define LIST_HPP


#include <iostream>
#include <time.h>
#include <cmath>

#include "list.h"
#include "node.hpp"
#include "exception.hpp"
#include "iterator.hpp"
#include "const_iterator.hpp"


using namespace std;


template <typename T>
shared_ptr<ListNode<T>> List<T>::get_head()
{
    return head;
}


template <typename T>
shared_ptr<ListNode<T>> List<T>::get_tail()
{
    return tail;
}


template <typename T>
List<T>::List() noexcept
{
    size = 0;
    head = nullptr;
    tail = nullptr;
}


template <typename T>
List<T>::List(List<T> &list)
{
    size = 0;
    head = nullptr;
    tail = nullptr;

    for (auto node: list)
    {
        shared_ptr<ListNode<T>> tmp = nullptr;
        try
        {
           tmp = shared_ptr<ListNode<T>> (new ListNode<T>);
        }
        catch (bad_alloc &error)
        {
            time_t time_now = time(NULL);
            throw MemoryError(__FILE__, __LINE__, ctime(&time_now));
        }

        tmp->put_cur(node.get_data());
        add_back(tmp);
    }
}

template <typename T>
List<T>::List(List<T> &&list) noexcept
{
    size = list.size;
    head = list.head;
    tail = list.tail;
}


template <typename T>
List<T>::List(const T *array, const int size)
{
    if (!array)
    {
        time_t time_now = time(NULL);
        throw PointerError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (size <= 0)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    this->size = 0;
    head = nullptr;
    tail = nullptr;

    for (int i = 0; i < size; i++)
        add_back(array[i]);
}


template <typename T>
List<T>::List(initializer_list<T> nodes)
{
    size = 0;
    head = nullptr;
    tail = nullptr;

    for (auto node: nodes)
        add_back(node);
}


template <typename T>
template <typename Iterator>
List<T>::List(const Iterator &begin, const Iterator &end)
{
    if (!begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    size = 0;
    head = nullptr;
    tail = nullptr;

    for (auto current = begin; current != end + 1; current++)
        add_back((*current).get_data());
}


template <typename T>
ListIterator<T> List<T>::begin()
{
    ListIterator<T> iterator(head);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::end()
{
    ListIterator<T> iterator(tail);
    return ++iterator;
}


template <typename T>
const ListIterator<T> List<T>::begin() const
{
    ListIterator<T> iterator(head);
    return iterator;
}


template <typename T>
const ListIterator<T> List<T>::end() const
{
    ListIterator<T> iterator(tail);
    return ++iterator;
}


template <typename T>
ConstListIterator<T> List<T>::cbegin() const
{
    ConstListIterator<T> iterator(head);
    return iterator;
}


template <typename T>
ConstListIterator<T> List<T>::cend() const
{
    ConstListIterator<T> iterator(tail);
    return ++iterator;
}


template <typename T>
ListIterator<T> List<T>::add_back(const shared_ptr<ListNode<T>> &node)
{
    if (!node)
    {
        time_t time_now = time(NULL);
        throw PointerError(__FILE__, __LINE__, ctime(&time_now));
    }

    shared_ptr<ListNode<T>> tmp = nullptr;
    try
    {
        tmp = shared_ptr<ListNode<T>> (new ListNode<T>);
    }
    catch (bad_alloc &error)
    {
        time_t time_now = time(NULL);
        throw MemoryError(__FILE__, __LINE__, ctime(&time_now));
    }

    tmp->put_cur(node->get_data());

    if (!size)
    {
        head = tmp;
        tail = tmp;
    }
    else
    {
        tail->put_next(tmp);
        tail = tmp;
    }

    size++;
    ListIterator<T> iterator(tail);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_back(const T &data)
{
    shared_ptr<ListNode<T>> node = nullptr;
    try
    {
        node = shared_ptr<ListNode<T>> (new ListNode<T>);
    }
    catch (bad_alloc &error)
    {
        time_t time_now = time(NULL);
        throw MemoryError(__FILE__, __LINE__, ctime(&time_now));
    }

    node->put_cur(data);
    return add_back(node);
}


template <typename T>
ListIterator<T> List<T>::add_back(const List<T> &list)
{
    for (auto node = list.cbegin(); node != list.cend(); node++)
        add_back((*node).get_data());

    ListIterator<T> iterator(tail);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_back(initializer_list<T> &nodes)
{
    for (auto node: nodes)
        add_back(node);

    ListIterator<T> iterator(tail);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_back(const ListIterator<T> &begin, const ListIterator<T> &end)
{
    if (!begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    List<T> tmp(begin, end);
    for (auto node = tmp.cbegin(); node != tmp.cend(); node++)
        add_back((*node).get_data());

    ListIterator<T> iterator(tail);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_back(const ConstListIterator<T> &begin, const ConstListIterator<T> &end)
{
    if (!begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    List<T> tmp(begin, end);
    for (auto node = tmp.cbegin(); node != tmp.cend(); node++)
        add_back((*node).get_data());

    ListIterator<T> iterator(tail);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_back(const ListIterator<T> &begin, const int n)
{
    if (!begin)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }
    if (n < 0)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    List<T> tmp(begin, begin + (n - 1));
    for (auto node = tmp.cbegin(); node != tmp.cend(); node++)
        add_back((*node).get_data());

    ListIterator<T> iterator(tail);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_back(const ConstListIterator<T> &begin, const int n)
{
    if (!begin)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }
    if (n < 0)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    List<T> tmp(begin, begin + (n - 1));
    for (auto node = tmp.cbegin(); node != tmp.cend(); node++)
        add_back((*node).get_data());

    ListIterator<T> iterator(tail);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_front(const shared_ptr<ListNode<T>> &node)
{
    if (!node)
    {
        time_t time_now = time(NULL);
        throw PointerError(__FILE__, __LINE__, ctime(&time_now));
    }

    node->put_next(head);
    head = node;

    if (!size)
        tail = head;

    size++;

    ListIterator<T> iterator(node);
    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_front(const T &data)
{
    shared_ptr<ListNode<T>> tmp = nullptr;
    try
    {
        tmp = shared_ptr<ListNode<T>> (new ListNode<T>);
    }
    catch (bad_alloc &error)
    {
        time_t time_now = time(NULL);
        throw MemoryError(__FILE__, __LINE__, ctime(&time_now));
    }

    tmp->put_cur(data);
    return add_front(tmp);
}


template <typename T>
ListIterator<T> List<T>::add_front(const List<T> &list)
{
    ListIterator<T> iterator;
    int list_size = list.size;

    for (int i = 0; i < list_size; i++)
        iterator = insert(begin() + i, (*(list.cbegin() + i)).get_data());

    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_front(const ListIterator<T> &begin, const ListIterator<T> &end)
{
    if (!begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> iterator;
    List<T> tmp(begin, end);
    int list_size = tmp.size;

    for (int i = 0; i < list_size; i++)
        iterator = insert((this->begin()) + i, (*(tmp.cbegin() + i)).get_data());

    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_front(const ConstListIterator<T> &begin, const ConstListIterator<T> &end)
{
    if (!begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> iterator;
    List<T> tmp(begin, end);
    int list_size = tmp.size;

    for (int i = 0; i < list_size; i++)
        iterator = insert((this->begin()) + i, (*(tmp.cbegin() + i)).get_data());

    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_front(const ListIterator<T> &begin, const int n)
{
    if (!begin)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }
    if (n < 0)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> iterator;
    List<T> tmp(begin, begin + (n - 1));
    int list_size = tmp.size;

    for (int i = 0; i < list_size; i++)
        iterator = insert((this->begin()) + i, (*(tmp.cbegin() + i)).get_data());

    return iterator;
}


template <typename T>
ListIterator<T> List<T>::add_front(const ConstListIterator<T> &begin, const int n)
{
    if (!begin)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }
    if (n < 0)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> iterator;
    List<T> tmp(begin, begin + (n - 1));
    int list_size = tmp.size;

    for (int i = 0; i < list_size; i++)
        iterator = insert((this->begin()) + i, (*(tmp.cbegin() + i)).get_data());

    return iterator;
}


/*
template <typename T>
T List<T>::delete_back()
{
    if (!size)
    {
        time_t time_now = time(NULL);
        throw EmptyError(__FILE__, __LINE__, ctime(&time_now));
    }

    T data = tail.get();

    if (size == 1)
    {
        head = nullptr;
        tail = nullptr;
    }
    else
    {
        shared_ptr<ListNode<T>> tmp = head;
        for (; tmp->next() != tail; tmp = tmp->next());

        tmp->put_null;
        tail = tmp;
        tail->put_null;
    }

    size--;
    return data;
}
*/


template <typename T>
T List<T>::delete_front()
{
    if (!size)
    {
        time_t time_now = time(NULL);
        throw EmptyError(__FILE__, __LINE__, ctime(&time_now));
    }

    T data = head->get_data();

    if (size != 1)
        head = head->get_next();
    else
    {
        head = nullptr;
        tail = nullptr;
    }

    size--;
    return data;
}


template <typename T>
T List<T>::remove(const ListIterator<T> &iterator)
{
    if (!iterator)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (!size)
    {
        time_t time_now = time(NULL);
        throw EmptyError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (iterator == begin())
        return delete_front();

    ListIterator<T> tmp_iterator = begin();
    for (; tmp_iterator + 1 != iterator; tmp_iterator++);

    T data = tmp_iterator->get_next()->get_data();
    tmp_iterator->put_next(tmp_iterator->get_next()->get_next());

    size--;
    return data;
}


template <typename T>
void List<T>::remove(const ListIterator<T> &begin, const ListIterator<T> &end)
{
    if (!begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (!size)
    {
        time_t time_now = time(NULL);
        throw EmptyError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> tmp_iterator = begin;
    int n = 0;

    for (; tmp_iterator != end; tmp_iterator++)
        n++;

    remove(begin, n + 1);
}


template <typename T>
void List<T>::remove(const ListIterator<T> &begin, const int n)
{
    if (!begin)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (size < 0)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (!size)
    {
        time_t time_now = time(NULL);
        throw EmptyError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> tmp_iterator = this->begin();
    int begin_i = 0;
    for (; tmp_iterator != begin; tmp_iterator++, begin_i++);

    if (begin_i + n > size)
    {
        time_t time_now = time(NULL);
        throw IndexError(__FILE__, __LINE__, ctime(&time_now));
    }

    int cur;
    for (int i = 0; i < n; i++)
    {
        tmp_iterator = this->begin();
        for (cur = 0; cur != begin_i; tmp_iterator++, cur++);
        remove(tmp_iterator);
    }
}

/*
template <typename T>
T List<T>::del(const size_t &index)
{
    if (index > size)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (!size)
    {
        time_t time_now = time(NULL);
        throw EmptyError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (index == 0)
        return delete_front();

    ListIterator<T> tmp_iterator = begin();
    size_t i = 0;
    for (; i + 1 != index; tmp_iterator++, i++);

    T data = tmp_iterator->get_data();
    tmp_iterator->put_next(tmp_iterator->get_next()->get_next());

    size--;
    return data;
}


template <typename T>
T List<T>::remove(const T &data)
{
    if (!size)
    {
        time_t time_now = time(NULL);
        throw EmptyError(__FILE__, __LINE__, ctime(&time_now));
    }

    if (data == head->get_data())
        return delete_front();

    ListIterator<T> tmp_iterator = begin();
    size_t i = 0;
    for (; tmp_iterator->get_data() != data && i < size; tmp_iterator++, i++);

    if (i == size)
    {
        time_t time_now = time(NULL);
        throw RemoveError(__FILE__, __LINE__, ctime(&time_now));
    }

    return del(tmp_iterator);
}
*/


template <typename T>
ListIterator<T> List<T>::insert(const ListIterator<T> &iterator, const T &data)
{
    if (!iterator)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    shared_ptr<ListNode<T>> tmp_node = nullptr;
    try
    {
        tmp_node = shared_ptr<ListNode<T>> (new ListNode<T>);
    }
    catch (bad_alloc &error)
    {
        time_t time_now = time(NULL);
        throw MemoryError(__FILE__, __LINE__, ctime(&time_now));
    }

    tmp_node->put_cur(data);

    if (iterator == begin())
        return add_front(tmp_node);

    if (iterator == end())
        return add_back(tmp_node);

    ListIterator<T> tmp_iterator = begin();
    for (; tmp_iterator + 1 != iterator; tmp_iterator++){}

    tmp_node->put_next(tmp_iterator->get_next());
    tmp_iterator->put_next(tmp_node);
    size++;

    ListIterator<T> new_iterator(tmp_node);
    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ConstListIterator<T> &iterator, const T &data)

{
    if (!iterator)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    shared_ptr<ListNode<T>> tmp_node = nullptr;
    try
    {
        tmp_node = shared_ptr<ListNode<T>> (new ListNode<T>);
    }
    catch (bad_alloc &error)
    {
        time_t time_now = time(NULL);
        throw MemoryError(__FILE__, __LINE__, ctime(&time_now));
    }

    tmp_node->put_cur(data);

    if (iterator == begin())
        return add_front(tmp_node);

    if (iterator == end())
        return add_back(tmp_node);

    ListIterator<T> tmp_iterator = begin();
    for (; tmp_iterator + 1 != iterator; tmp_iterator++) {}

    tmp_node->put_next(tmp_iterator->get_next());
    tmp_iterator->put_next(tmp_node);
    size++;

    ListIterator<T> new_iterator(tmp_node);
    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ListIterator<T> &iterator, const List<T> &list)
{
    if (!iterator)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    int list_size = list.size;
    for (int i = 0; i < list_size; i++)
        new_iterator = insert(iterator, (*(list.cbegin() + i)).get_data());

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ConstListIterator<T> &iterator, const List<T> &list)
{
    if (!iterator)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    int list_size = list.size;
    for (int i = 0; i < list_size; i++)
        new_iterator = insert(iterator, (*(list.cbegin() + i)).get_data());

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ListIterator<T> &iterator, const ListIterator<T> &begin, const ListIterator<T> &end)
{
    if (!iterator || !begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    List<T> tmp = List(begin, end);

    new_iterator = insert(iterator, tmp);

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ConstListIterator<T> &iterator, const ConstListIterator<T> &begin, const ConstListIterator<T> &end)
{
    if (!iterator || !begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    List<T> tmp = List(begin, end);

    new_iterator = insert(iterator, tmp);

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ListIterator<T> &iterator, const ListIterator<T> &begin, const int n)
{
    if (!iterator || !begin)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }
    if (n < 0)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    ListIterator<T> end = begin + (n - 1);
    List<T> tmp = List(begin, end);

    new_iterator = insert(iterator, tmp);

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ConstListIterator<T> &iterator, const ConstListIterator<T> &begin, const int n)
{
    if (!iterator || !begin)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }
    if (n < 0)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    ListIterator<T> end = begin + (n - 1);
    List<T> tmp = List(begin, end);

    new_iterator = insert(iterator, tmp);

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ListIterator<T> &iterator, initializer_list<T> nodes)
{
    if (!iterator)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    List<T> tmp = List(nodes);

    new_iterator = insert(iterator, tmp);

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const ConstListIterator<T> &iterator, initializer_list<T> nodes)
{
    if (!iterator)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    List<T> tmp = List(nodes);

    new_iterator = insert(iterator, tmp);

    return new_iterator;
}


/*
template <typename T>
ListIterator<T> List<T>::insert(const size_t &index, const T &data)
{
    if (index > size)
    {
        time_t time_now = time(NULL);
        throw IndexError(__FILE__, __LINE__, ctime(&time_now));
    }

    shared_ptr<ListNode<T>> tmp_node = nullptr;
    try
    {
        tmp_node = shared_ptr<ListNode<T>> (new ListNode<T>);
    }
    catch (bad_alloc &error)
    {
        time_t time_now = time(NULL);
        throw MemoryError(__FILE__, __LINE__, ctime(&time_now));
    }

    tmp_node->put_cur(data);

    if (index == 0)
        return add_front(tmp_node);

    if (index == size)
        return add_back(tmp_node);

    ListIterator<T> tmp_iterator = begin();
    size_t cur_index = 0;
    for (; cur_index != index - 1; tmp_iterator++, cur_index++){}

    tmp_node->put_next(tmp_iterator->get_next());
    tmp_iterator->put_next(tmp_node);
    size++;

    ListIterator<T> new_iterator(tmp_node);
    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const size_t &index, const List<T> &list)
{
    if (index > size)
    {
        time_t time_now = time(NULL);
        throw IndexError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    size_t list_size = list.size;
    for (int i = 0; static_cast<size_t>(i) < list_size; i++)
        new_iterator = insert(index + i, (*(list.cbegin() + i)).get_data());

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const size_t &index, const ListIterator<T> &begin, const ListIterator<T> &end)
{
    if (!begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }
    if (index > size)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    List<T> tmp = List(begin, end);

    new_iterator = insert(index, tmp);

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const size_t &index, const ConstListIterator<T> &begin, const ConstListIterator<T> &end)
{
    if (!begin || !end)
    {
        time_t time_now = time(NULL);
        throw IteratorError(__FILE__, __LINE__, ctime(&time_now));
    }
    if (index < 0 || index > size)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    List<T> tmp = List(begin, end);

    new_iterator = insert(index, tmp);

    return new_iterator;
}


template <typename T>
ListIterator<T> List<T>::insert(const size_t &index, initializer_list<T> nodes)
{
    if (index > size)
    {
        time_t time_now = time(NULL);
        throw SizeError(__FILE__, __LINE__, ctime(&time_now));
    }

    ListIterator<T> new_iterator;
    List<T> tmp = List(nodes);

    new_iterator = insert(index, tmp);

    return new_iterator;
}
*/


template <typename T>
void List<T>::reverse(void)
{
    shared_ptr<ListNode<T>> cur(head);
    shared_ptr<ListNode<T>> next(nullptr);
    shared_ptr<ListNode<T>> previous(nullptr);

    while (cur)
    {
        next = cur->get_next();
        cur->put_next(previous);
        previous = cur;
        cur = next;
    }

    previous = head;
    head = tail;
    tail = previous;

    tail->put_null();
}


template <typename T>
List<T> &List<T>::merge(const List<T> &list)
{
    this->push_back(list);
    return *this;
}


template <typename T>
List<T> &List<T>::merge(const T &data)
{
    this->push_back(data);
    return *this;
}


template <typename T>
List<T> &List<T>::merge(initializer_list<T> nodes)
{
    this->add_back(nodes);
    return *this;
}


template<typename T>
List<T> &List<T>::operator = (const List<T> &list)
{
    clear();
    size = 0;
    head = nullptr;
    tail = nullptr;

    add_back(list);
    return *this;
}


template <typename T>
List<T> &List<T>::operator = (const List<T> &&list)
{
    size = list.size;
    head = list.head;
    tail = list.tail;
}


template <typename T>
List<T> &List<T>::operator + (const List<T> &list)
{
    add_back(list);
    return *this;
}


template <typename T>
List<T> &List<T>::operator + (const T &data)
{
    add_back(data);
    return *this;
}


template <typename T>
List<T> &List<T>::operator += (const List<T> &list)
{
    add_back(list);
    return *this;
}


template <typename T>
List<T> &List<T>::operator += (const T &data)
{
    add_back(data);
    return *this;
}


/*
template <typename T>
T& List<T>::operator [](size_t index)
{
    if (index > size)
    {
        time_t time_now = time(NULL);
        throw IndexError(__FILE__, __LINE__, ctime(&time_now));
    }


    ListIterator<T> tmp_iterator = begin();

    for (size_t cur_index = 0; cur_index != index; tmp_iterator++, cur_index++){}

    return tmp_iterator->get_data();
}


template <typename T>
const T& List<T>::operator [](size_t index) const
{
    if (index < 0 || index > size)
    {
        time_t time_now = time(NULL);
        throw IndexError(__FILE__, __LINE__, ctime(&time_now));
    }


    ListIterator<T> tmp_iterator = begin();

    for (size_t cur_index = 0; cur_index != index - 1; tmp_iterator++, cur_index++){}

    return tmp_iterator->get_data();
}
*/


template <typename T>
bool List<T>::equal(const List<T> &list) const
{
    auto first = cbegin(),
         second = list.cbegin();

    for (; first != cend() && second != list.cend(); ++first, ++second)
    {
        if (first->get_data() != second->get_data())
            return false;
    }

    return size == list.size;
}


template <typename T>
bool List<T>::not_equal (const List<T> &list) const
{
    return !(*this == list);
}


template <typename T>
bool List<T>::operator == (const List<T> &list) const
{
    auto first = cbegin(),
         second = list.cbegin();

    for (; first != cend() && second != list.cend(); ++first, ++second)
    {
        if (first->get_data() != second->get_data())
            return false;
    }

    return size == list.size;
}


template <typename T>
bool List<T>::operator != (const List<T> &list) const
{
    return !(*this == list);
}


template <typename T>
bool List<T>::is_correct() const
{
    return size != 0;
}


template <typename T>
bool List<T>::is_empty() const
{
    return size == 0;
}


template <typename T>
int List<T>::get_size() const
{
    return size;
}


template <typename T>
List<T>::operator bool() const
{
    return size == 0;
}


template <typename T>
void List<T>::clear()
{
    while (size)
        delete_front();
}


#endif
