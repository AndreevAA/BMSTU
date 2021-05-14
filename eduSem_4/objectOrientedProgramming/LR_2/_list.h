#ifndef LIST_H
#define LIST_H


#include <iostream>
#include "node.h"
#include "iterator.h"
#include "const_iterator.h"
#include "base_list.hpp"
using namespace std;


template <typename T>
class List: public BaseList
{
public:
    List() noexcept;
    explicit List(List<T> &list);
    List(List<T> &&list) noexcept;

    List(const T *array, const int size);
    List(initializer_list<T> nodes);

    template <typename Iterator>
    List(const Iterator &begin, const Iterator &end);

    ListIterator<T> begin();
    ListIterator<T> end();
    const ListIterator<T> begin() const; // add
    const ListIterator<T> end() const; // add

    ConstListIterator<T> cbegin() const;
    ConstListIterator<T> cend() const;

    ListIterator<T> add_back(const T &data);
    ListIterator<T> add_back(const List<T> &list);
    ListIterator<T> add_back(initializer_list<T> &nodes);

    ListIterator<T> add_back(const ListIterator<T> &begin, const ListIterator<T> &end);
    ListIterator<T> add_back(const ConstListIterator<T> &begin, const ConstListIterator<T> &end);
    ListIterator<T> add_back(const ListIterator<T> &begin, const int n);
    ListIterator<T> add_back(const ConstListIterator<T> &begin, const int n);

    ListIterator<T> add_front(const T &data);
    ListIterator<T> add_front(const List<T> &list);
    ListIterator<T> add_front(initializer_list<T> &nodes);

    ListIterator<T> add_front(const ListIterator<T> &begin, const ListIterator<T> &end);
    ListIterator<T> add_front(const ConstListIterator<T> &begin, const ConstListIterator<T> &end);
    ListIterator<T> add_front(const ListIterator<T> &begin, const int n);
    ListIterator<T> add_front(const ConstListIterator<T> &begin, const int n);

    // T delete_back();
    T delete_front();

    T remove(const ListIterator<T> &iterator);
    void remove(const ListIterator<T> &begin, const ListIterator<T> &end); // add
    void remove(const ListIterator<T> &begin, const int n); // add
    // T del(const size_t &index);
    // T remove(const T &data);

    ListIterator<T> insert(const ListIterator<T> &iterator, const T &data);
    ListIterator<T> insert(const ConstListIterator<T> &iterator, const T &data);
    ListIterator<T> insert(const ListIterator<T> &iterator, const List<T> &list);
    ListIterator<T> insert(const ConstListIterator<T> &iterator, const List<T> &list);

    ListIterator<T> insert(const ListIterator<T> &iterator, const ListIterator<T> &begin, const ListIterator<T> &end);
    ListIterator<T> insert(const ConstListIterator<T> &iterator, const ConstListIterator<T> &begin, const ConstListIterator<T> &end);
    ListIterator<T> insert(const ListIterator<T> &iterator, const ListIterator<T> &begin, const int n);
    ListIterator<T> insert(const ConstListIterator<T> &iterator, const ConstListIterator<T> &begin, const int n);

    ListIterator<T> insert(const ListIterator<T> &iterator, initializer_list<T> nodes);
    ListIterator<T> insert(const ConstListIterator<T> &iterator, initializer_list<T> nodes);

    /*
    ListIterator<T> insert(const size_t &index, const T &data);
    ListIterator<T> insert(const size_t &index, const List<T> &list);
    ListIterator<T> insert(const size_t &index, const ListIterator<T> &begin, const ListIterator<T> &end);
    ListIterator<T> insert(const size_t &index, const ConstListIterator<T> &begin, const ConstListIterator<T> &end);
    ListIterator<T> insert(const size_t &index, initializer_list<T> nodes);
    */

    void reverse();
    List<T> &merge(const List<T> &list);
    List<T> &merge(const T &data);
    List<T> &merge(initializer_list<T> nodes);

    List<T> &operator = (const List<T> &list);
    List<T> &operator = (const List<T> &&list);
    List<T> &operator + (const List<T> &list);
    List<T> &operator + (const T &data);
    List<T> &operator += (const List<T> &list);
    List<T> &operator += (const T &data);

    // T& operator [](size_t index);
    // const T& operator [](size_t index) const;

    bool equal(const List<T> &list) const;
    bool not_equal(const List<T> &list) const;
    bool operator == (const List<T> &list) const;
    bool operator != (const List<T> &list) const;

    bool is_correct() const;
    bool is_empty() const;

    virtual int get_size() const;
    virtual operator bool() const;
    virtual void clear();

    ~List() = default;

protected:
    shared_ptr<ListNode<T>> get_head();
    shared_ptr<ListNode<T>> get_tail();
    ListIterator<T> add_back(const shared_ptr<ListNode<T>> &node);
    ListIterator<T> add_front(const shared_ptr<ListNode<T>> &node);

private:
    int size;
    shared_ptr<ListNode<T>> head;
    shared_ptr<ListNode<T>> tail;

};


#endif
