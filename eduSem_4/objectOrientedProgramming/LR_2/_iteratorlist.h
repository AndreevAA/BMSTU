#ifndef _ITERATORLIST_H
#define _ITERATORLIST_H

#include "_errors.h"
#include "_list.h"
#include "_listitem.h"


template <typename C>
class IteratorConst
    : public std::iterator<std::random_access_iterator_tag,
                           int> { // перегрузка -[=] не нужна если наследоваться
                                  // от forward
public:
  IteratorConst(const IteratorConst<C> &srcIterConst);
  IteratorConst(const Vector<C> &srcVector) noexcept;

  IteratorConst<C> &
  operator=(const IteratorConst<C> &srcIterConst) noexcept;

  const C &operator*() const;
  const C *operator->() const;
  operator bool() const;

  // Increment
  IteratorConst<C> &operator+=(size_t value);
  IteratorConst<C> &operator+(size_t value) const;
  IteratorConst<C> &operator++();
  IteratorConst<C> &operator++(int);

  // Decrement
  IteratorConst<C> &operator-=(size_t value);
  IteratorConst<C> &operator-(size_t value) const;
  IteratorConst<C> &operator--();
  IteratorConst<C> &operator--(int);

  // Compare
  bool operator>=(const IteratorConst<C> &srcIterConst) const;
  bool operator>(const IteratorConst<C> &srcIterConst) const;
  bool operator<=(const IteratorConst<C> &srcIterConst) const;
  bool operator<(const IteratorConst<C> &srcIterConst) const;
  bool operator==(const IteratorConst<C> &srcIterConst) const;
  bool operator!=(const IteratorConst<C> &srcIterConst) const;

  const C &operator[](const size_t inx) const;

protected:
  C *getCurrPointer() const;
  void isPointerExpired(size_t currentLine) const;
  void isIteratorValid(size_t currentLine) const;
  size_t currentInx = 0;
  size_t vectorDimension = 0;

private:
  std::weak_ptr<C[]> weakPointer;
};

#endif // _ITERATORLIST_H