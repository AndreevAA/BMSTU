#ifndef ITERATORLIST_H
#define ITERATORLIST_H
#include "_iteratorlist.h"

// Constructors
template <typename C>
IteratorConst<C>::IteratorConst(const IteratorConst<C> &srcIterConst) {
  this->weakPointer = srcIterConst.weakPointer;
  this->currentInx = srcIterConst.currentInx;
  this->vectorDimension = srcIterConst.vectorDimension;
}

template <typename C>
IteratorConst<C>::IteratorConst(const Vector<C> &srcVector) noexcept {
  this->weakPointer = srcVector.coordinates;
  this->currentInx = 0;
  this->vectorDimension = srcVector.getDimention();
}

template <typename C> C *IteratorConst<C>::getCurrPointer() const {
  std::shared_ptr<C[]> copy = this->weakPointer.lock();
  return copy.get() + currentInx;
}

// Checks related methods
template <typename C>
void IteratorConst<C>::isPointerExpired(size_t currentLine) const {
  if (weakPointer.expired()) {
    time_t timeOccured = time(NULL);
    throw deletedObjectException(__FILE__, typeid(*this).name(), currentLine,
                                 ctime(&timeOccured));
  }
}

template <typename C>
void IteratorConst<C>::isIteratorValid(size_t currentLine) const {
  if (this->currentInx >= this->vectorDimension) {
    time_t timeOccured = time(NULL);
    throw InvalidIteratorException(__FILE__, typeid(*this).name(), currentLine,
                                   ctime(&timeOccured));
  }
}

// Overloads
template <typename C> IteratorConst<C>::operator bool() const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  if (vectorDimension == 0 || currentInx >= vectorDimension)
    return false;
  else
    return true;
}

template <typename C>
const C &IteratorConst<C>::operator[](const size_t inx) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  time_t timeOccured = time(NULL);
  if (inx + this->currentInx >= this->vectorDimension)
    throw(IndexException(__FILE__, typeid(*this).name(), currentLine,
                         ctime(&timeOccured)));
  return *(this + inx);
}

template <typename C> const C &IteratorConst<C>::operator*() const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);
  isIteratorValid(currentLine);

  return *getCurrPointer();
}

template <typename C> const C *IteratorConst<C>::operator->() const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);
  isIteratorValid(currentLine);

  return getCurrPointer();
}

// Increment
template <typename C>
IteratorConst<C> &IteratorConst<C>::operator+=(size_t value) {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  currentInx += value;
  return *this;
}

template <typename C>
IteratorConst<C> &IteratorConst<C>::operator+(size_t value) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  IteratorConst<C> dstIter(*this);
  dstIter += value;

  return dstIter;
}

template <typename C>
IteratorConst<C> &IteratorConst<C>::operator++() {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  ++currentInx;
  return (*this);
}

template <typename C>
IteratorConst<C> &IteratorConst<C>::operator++(int) {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  ++(*this);
  return (*this);
}

// Decrement
template <typename C>
IteratorConst<C> &IteratorConst<C>::operator-=(size_t value) {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  currentInx -= value;
  return *this;
}

template <typename C>
IteratorConst<C> &IteratorConst<C>::operator-(size_t value) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  IteratorConst<C> dstIter(*this);
  dstIter -= value;

  return dstIter;
}

template <typename C>
IteratorConst<C> &IteratorConst<C>::operator--() {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  --currentInx;
  return (*this);
}

template <typename C>
IteratorConst<C> &IteratorConst<C>::operator--(int) {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  --(*this);
  return (*this);
}

// Compare
template <typename C>
bool IteratorConst<C>::operator>=(
    const IteratorConst<C> &srcIterConst) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  return this->currentInx >= srcIterConst.currentInx;
}

template <typename C>
bool IteratorConst<C>::operator>(
    const IteratorConst<C> &srcIterConst) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  return this->currentInx > srcIterConst.currentInx;
}

template <typename C>
bool IteratorConst<C>::operator<=(
    const IteratorConst<C> &srcIterConst) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  return this->currentInx <= srcIterConst.currentInx;
}

template <typename C>
bool IteratorConst<C>::operator<(
    const IteratorConst<C> &srcIterConst) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  return this->currentInx < srcIterConst.currentInx;
}

template <typename C>
bool IteratorConst<C>::operator==(
    const IteratorConst<C> &srcIterConst) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  return this->currentInx == srcIterConst.currentInx;
}

template <typename C>
bool IteratorConst<C>::operator!=(
    const IteratorConst<C> &srcIterConst) const {
  size_t currentLine = __LINE__;
  isPointerExpired(currentLine);

  return this->currentInx != srcIterConst.currentInx;
}

#endif // ITERATORLIST_H
