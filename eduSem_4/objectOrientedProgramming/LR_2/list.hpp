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

// memory alloc
template <typename C> void Vector<C>::allocateMemory(size_t vectorDim) {
  time_t currentTime = time(NULL);

  try {
    this->coordinates.reset(new C[vectorDim]);
  } catch (std::bad_alloc &exception) {
    throw memoryException(__FILE__, typeid(*this).name(), __LINE__,
                          ctime(&currentTime));
  }
}
// Iterator
template <typename C> Iterator<C> Vector<C>::begin() noexcept {
  Iterator<C> iterator(*this);
  return iterator;
}

template <typename C> Iterator<C> Vector<C>::end() noexcept {
  Iterator<C> iterator(*this);
  return iterator + this->dimension;
}

template <typename C>
IteratorConst<C> Vector<C>::begin() const noexcept {
  IteratorConst<C> iterator(*this);
  return iterator;
}

template <typename C>
IteratorConst<C> Vector<C>::end() const noexcept {
  IteratorConst<C> iterator(*this);
  return iterator + this->dimension;
}

template <typename C>
IteratorConst<C> Vector<C>::cBegin() const noexcept {
  IteratorConst<C> iterator(*this);
  return iterator;
}

template <typename C>
IteratorConst<C> Vector<C>::cEnd() const noexcept {
  IteratorConst<C> iterator(*this);
  return iterator + this->dimension;
}

// Constructors
template <typename C> Vector<C>::Vector() {
  this->dimension = 0;
  this->allocateMemory(dimension);
}

template <typename C> Vector<C>::Vector(size_t dimension) {
  time_t currentTime = time(NULL);

  this->allocateMemory(dimension);
  if (!this->coordinates)
    throw memoryException(__FILE__, typeid(*this).name(), __LINE__,
                          ctime(&currentTime));
  this->dimension = dimension;

  Iterator<C> iterator = this->begin();
  for (; iterator; iterator++)
    *iterator = 0;
}

template <typename C>
Vector<C>::Vector(size_t dimension, const C *valueArray) {
  if (dimension == 0) {
    time_t currentTime = time(NULL);
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));
  }
  if (!valueArray) {
    time_t currentTime = time(NULL);
    throw InvalidSrcArrayPointerException(__FILE__, typeid(*this).name(),
                                          __LINE__, ctime(&currentTime));
  }
  this->allocateMemory(dimension);
  this->dimension = dimension;
  Iterator<C> iterator = this->begin();
  for (size_t i = 0; iterator; iterator++, i++) {
    *iterator = valueArray[i];
  }
}
template <typename C>
Vector<C>::Vector(std::initializer_list<C> valueList) {
  this->dimension = valueList.size();
  this->allocateMemory(dimension);

  Iterator<C> iterator = this->begin();
  for (auto &currItem : valueList) {
    *iterator = currItem;
    iterator++;
  }
}

template <typename C>
template <typename _C>
Vector<C>::Vector(_C start, _C end) {
  _C slice = start;
  size_t dimension = 0;
  for (auto iter = start; iter != end; ++iter, ++dimension)
    ;
  this->dimension = dimension;
  this->allocateMemory(dimension);

  size_t i = 0;
  for (auto iter = slice; iter != end; ++iter, ++i) {
    this->coordinates[i] = *iter;
  }
};

template <typename C>
Vector<C>::Vector(const Vector<C> &srcVector)
    : baseVector(srcVector.dimension) {
  *this = srcVector;
}

template <typename C>
Vector<C>::Vector(Vector<C> &&srcVector) noexcept
    : baseVector(srcVector.dimension) {
  this->coordinates = srcVector.coordinates;
  srcVector.coordinates = nullptr;
}

// bool functions
template <typename C> bool Vector<C>::isZeroVector() const noexcept {
  bool ret = false;
  if (this->getMagnitude<C>() < __FLT_EPSILON__)
    ret = true;
  return ret;
}

template <typename C> bool Vector<C>::isUnitVector() const noexcept {
  bool ret = false;
  if (this->getMagnitude<C>() - 1 < __FLT_EPSILON__)
    ret = true;
  return ret;
}

template <typename C>
IteratorConst<C> &IteratorConst<C>::operator=(
    const IteratorConst<C> &srcIterConst) noexcept {
  weakPointer = srcIterConst.weakPointer;

  return *this;
}

// equ
template <typename C>
Vector<C> &Vector<C>::operator=(const Vector<C> &srcVector) {
  this->dimension = srcVector.dimension;
  this->allocateMemory(dimension);

  Iterator<C> iteratorTo(*this);
  Iterator<C> iteratorFrom(srcVector);
  for (; iteratorTo; iteratorTo++, iteratorFrom++)
    *iteratorTo = *iteratorFrom;
  return *this;
}

template <typename C>
Vector<C> &Vector<C>::operator=(std::initializer_list<C> valueList) {
  this->dimension = valueList.size();
  this->allocateMemory(dimension);
  Iterator<C> iterator = this->begin();
  for (auto &currentItem : valueList) {
    *iterator = currentItem;
    iterator++;
  }
  return *this;
}

template <typename C>
Vector<C> &Vector<C>::operator=(Vector<C> &&srcVector) {
  this->dimension = srcVector.dimension;
  this->allocateMemory(dimension);
  this->coordinates = srcVector.coordinates;
  srcVector.coordinates.reset();

  return *this;
}

// single vector methods
template <typename C>
template <typename rC>
rC Vector<C>::getMagnitude() const {
  if (dimension == 0) {
    time_t currentTime = time(NULL);
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));
  }
  IteratorConst<C> iterator = this->begin();
  C sum = 0;
  for (; iterator; iterator++) {
    sum += *iterator * *iterator;
  }
  return sqrt(sum);
}

template <typename C>
template <typename rC>
Vector<rC> Vector<C>::getUnitVector() const {
  Vector<rC> unitVector(this->dimension);
  C magnitude = this->getMagnitude<C>();

  IteratorConst<C> iterSrc = this->begin();
  Iterator<rC> iterDst = unitVector.begin();

  for (; iterSrc; iterSrc++, iterDst++)
    *iterDst = *iterSrc / magnitude;

  return unitVector;
}

// two vectors
template <typename C>
double Vector<C>::getAngle(const Vector<C> &vector) const {
  time_t currentTime = time(NULL);
  if (!this->getMagnitude<C>() || !vector.getMagnitude<C>())
    throw ZeroDivisionException(__FILE__, typeid(*this).name(), __LINE__,
                                ctime(&currentTime));
  double angle = (*this & vector) /
                 (this->getMagnitude<C>() * vector.getMagnitude<C>());

  return acos(angle);
}

// bool functions
template <typename C>
bool Vector<C>::areCollinear(const Vector<C> &vector) const {
  if (this->getAngle(vector) < __FLT_EPSILON__)
    return true;
  return false;
}

template <typename C>
bool Vector<C>::areOrthogonal(const Vector<C> &vector) const {
  if (this->getAngle(vector) - 90 < __FLT_EPSILON__)
    return true;
  return false;
}

template <typename C> C &Vector<C>::at(size_t inx) {
  if (inx <= this->dimension) {
    time_t currentTime = time(NULL);
    throw IndexException(__FILE__, typeid(*this).name(), __LINE__,
                         ctime(&currentTime));
  }
  Iterator<C> iterator = this->begin();
  for (size_t i = 0; i < inx; i++, iterator++)
    ;
  return *iterator;
}

template <typename C> const C &Vector<C>::at(size_t inx) const {
  if (inx >= this->dimension) {
    time_t currentTime = time(NULL);
    throw IndexException(__FILE__, typeid(*this).name(), __LINE__,
                         ctime(&currentTime));
  }
  IteratorConst<C> iterator = this->begin();
  for (size_t i = 0; i < inx; i++, iterator++)
    ;
  return *iterator;
}

template <typename C> C &Vector<C>::operator[](size_t inx) {
  return at(inx);
}

template <typename C>
const C &Vector<C>::operator[](size_t inx) const {
  return at(inx);
}

// overload + method pair
template <typename C>
Vector<C> &Vector<C>::operator+=(const Vector<C> &vector) {
  time_t currentTime = time(NULL);
  if (this->dimension == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));
  this->isDimensionEqual(vector, __LINE__);

  *this = this->vectorSum(vector);
  return *this;
}
template <typename C>
void Vector<C>::addVector(const Vector<C> &vector) {
  *this += vector;
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::operator+(const Vector<vC> &vector) const {
  time_t currentTime = time(NULL);
  if (this->getDimention() == 0 || vector.getDimention() == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));
  if (this->getDimention() != vector.getDimention())
    throw InvalidVectorDimensionException(__FILE__, typeid(*this).name(),
                                          __LINE__, ctime(&currentTime));
  return this->vectorSum(vector);
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::vectorSum(const Vector<vC> &vector) const {
  Vector<decltype(this->coordinates[0] + vector.at(0))> sum(this->dimension);

  Iterator<decltype(this->coordinates[0] + vector.at(0))> dstIter = sum.begin();
  IteratorConst<C> srcIter = this->begin();
  IteratorConst<vC> srcIter1 = vector.begin();

  for (; dstIter; dstIter++, srcIter++, srcIter1++)
    *dstIter = *srcIter + *srcIter1;

  return sum;
}

template <typename C>
void Vector<C>::subtractVector(const Vector<C> &vector) {
  *this -= vector;
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::vectorDif(const Vector<vC> &vector) const {
  Vector<decltype(this->coordinates[0] + vector.at(0))> dif(this->dimension);

  Iterator<decltype(this->coordinates[0] + vector.at(0))> dstIter = dif.begin();
  IteratorConst<C> srcIter = this->begin();
  IteratorConst<vC> srcIter1 = vector.begin();

  for (; dstIter; dstIter++, srcIter++, srcIter1++)
    *dstIter = *srcIter - *srcIter1;

  return dif;
}

template <typename C>
Vector<C> &Vector<C>::operator-=(const Vector<C> &vector) {
  time_t currentTime = time(NULL);
  if (this->dimension == 0 || vector.dimension == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));
  this->isDimensionEqual(vector, __LINE__);

  *this = this->vectorDif(vector);
  return *this;
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::operator-(const Vector<vC> &vector) const {
  time_t currentTime = time(NULL);
  if (this->getDimention() == 0 || vector.getDimention() == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));
  if (this->getDimention() != vector.getDimention())
    throw InvalidVectorDimensionException(__FILE__, typeid(*this).name(),
                                          __LINE__, ctime(&currentTime));

  return this->vectorDif(vector);
}

// Multiplication

template <typename C>
Vector<C> &Vector<C>::operator*=(const Vector<C> &vector) {
  time_t currentTime = time(NULL);
  if (this->dimension == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));
  this->isDimensionEqual(vector, __LINE__);
  Vector<C> prod(*this);

  Iterator<C> dstIter = prod.begin();
  IteratorConst<C> srcIter = vector.begin();

  for (; dstIter; dstIter++, srcIter++)
    *dstIter = *dstIter * *srcIter;

  *this = prod;
  return *this;
}

template <typename C>
Vector<C> &Vector<C>::operator*=(const C &value) {
  time_t currentTime = time(NULL);
  if (this->dimension == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));

  Vector<C> prod(*this);

  Iterator<C> dstIter = prod.begin();
  IteratorConst<C> srcIter = this->begin();

  for (; srcIter; srcIter++, dstIter++)
    *dstIter = *srcIter * value;

  *this = prod;
  return *this;
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::multiplyNumber(const vC &value) const {
  Vector<decltype(value + this->coordinates[0])> prod(*this);

  IteratorConst<C> srcIter = this->begin();
  Iterator<decltype(value + this->coordinates[0])> dstIter = prod.begin();

  for (; srcIter; srcIter++, dstIter++)
    *dstIter = *srcIter * value;

  return prod;
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::operator*(const vC &value) const {
  time_t currentTime = time(NULL);
  if (this->dimension == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));

  return this->multiplyNumber(value);
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::dotProduct(const Vector<vC> &vector) const {
  Vector<decltype(this->coordinates[0] + vector.at(0))> prod(this->dimension);

  Iterator<decltype(this->coordinates[0] + vector.at(0))> dstIter =
      prod.begin();
  IteratorConst<C> srcIter = this->begin();
  IteratorConst<vC> srcIter1 = vector.begin();

  for (; dstIter; dstIter++, srcIter++, srcIter1++)
    *dstIter = *srcIter * *srcIter1;

  return prod;
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::crossProduct(const Vector<vC> &vector) const {
  time_t currentTime = time(NULL);
  if (vector.getDimention() != 3 || this->getDimention() != 3)
    throw(CrossProductUndefinedException(__FILE__, typeid(*this).name(),
                                         __LINE__, ctime(&currentTime)));

  currentTime = time(NULL);
  if (this->getDimention() == 0 || vector.getDimention() == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));

  decltype(this->coordinates[0] + vector.at(0)) x =
      (this->at(1) * vector.at(2)) - (this->at(2) * vector.at(1));

  decltype(this->coordinates[0] + vector.at(0)) y =
      (this->at(2) * vector.at(0)) - (this->at(0) * vector.at(2));

  decltype(this->coordinates[0] + vector.at(0)) z =
      (this->at(0) * vector.at(1)) - (this->at(1) * vector.at(0));

  Vector<decltype(this->coordinates[0] + vector.at(0))> crossProd = {x, y, z};

  return crossProd;
}

template <typename C>
template <typename vC>
decltype(auto) Vector<C>::operator*(const Vector<vC> &vector) const {
  time_t currentTime = time(NULL);
  if (this->getDimention() == 0 || vector.getDimention() == 0)
    throw emptyVectorException(__FILE__, typeid(*this).name(), __LINE__,
                               ctime(&currentTime));
  if (this->getDimention() != vector.getDimention())
    throw InvalidVectorDimensionException(__FILE__, typeid(*this).name(),
                                          __LINE__, ctime(&currentTime));

  return this->dotProduct(vector);
}

template <typename C> Vector<C> Vector<C>::getNegative() {
  return -*this;
}

template <typename C> Vector<C> Vector<C>::operator-() {
  Vector<C> neg(*this);

  Iterator<C> iterator = neg.begin();
  for (; iterator; iterator++)
    *iterator = -*iterator;

  return neg;
}

// compare

template <typename C>
bool Vector<C>::operator==(const Vector<C> &vector) const {
  bool areEqual = false;
  if (this->dimension != vector.dimension)
    return areEqual;

  areEqual = true;
  IteratorConst<C> srcIter = this->begin();
  for (IteratorConst<C> dstIter = vector.begin(); srcIter && areEqual;
       dstIter++, srcIter++)
    if (*srcIter != *dstIter)
      areEqual = false;

  return areEqual;
}

template <> bool Vector<float>::operator==(const Vector<float> &vector) const {
  bool areEqual = false;
  if (this->dimension != vector.dimension)
    return areEqual;

  areEqual = true;
  IteratorConst<float> srcIter = this->begin();
  for (IteratorConst<float> dstIter = vector.begin(); srcIter && areEqual;
       dstIter++, srcIter++) {
    if (std::abs(*srcIter - *dstIter) > std::numeric_limits<float>::epsilon())
      areEqual = false;
  }
  return areEqual;
}

template <>
bool Vector<double>::operator==(const Vector<double> &vector) const {
  bool areEqual = false;
  if (this->dimension != vector.dimension)
    return areEqual;

  areEqual = true;
  IteratorConst<double> srcIter = this->begin();
  for (IteratorConst<double> dstIter = vector.begin(); srcIter && areEqual;
       dstIter++, srcIter++)
    if (std::abs(*srcIter - *dstIter) > std::numeric_limits<double>::epsilon())
      areEqual = false;
  return areEqual;
}

template <>
bool Vector<long double>::operator==(const Vector<long double> &vector) const {
  bool areEqual = false;
  if (this->dimension != vector.dimension)
    return areEqual;

  areEqual = true;
  IteratorConst<long double> srcIter = this->begin();
  for (IteratorConst<long double> dstIter = vector.begin(); srcIter && areEqual;
       dstIter++, srcIter++)
    if (std::abs(*srcIter - *dstIter) >
        std::numeric_limits<long double>::epsilon())
      areEqual = false;
  return areEqual;
}

template <typename C>
bool Vector<C>::areEqual(const Vector<C> &vector) const {
  return *this == vector;
}

template <typename C>
bool Vector<C>::operator!=(const Vector<C> &vector) const {
  bool areNotEqual = true;

  if (this->dimension != vector.dimension)
    return areNotEqual;

  areNotEqual = false;

  IteratorConst<C> srcIter = this->begin();

  for (IteratorConst<C> dstIter = vector.begin(); srcIter && !areNotEqual;
       dstIter++)
    if (*srcIter != *dstIter)
      areNotEqual = true;
  return areNotEqual;
}

template <> bool Vector<float>::operator!=(const Vector<float> &vector) const {
  bool areNotEqual = true;
  if (this->dimension != vector.dimension)
    return areNotEqual;

  areNotEqual = false;
  IteratorConst<float> srcIter = this->begin();
  for (IteratorConst<float> dstIter = vector.begin(); srcIter && !areNotEqual;
       dstIter++)
    if (std::abs(*srcIter - *dstIter) < std::numeric_limits<float>::epsilon())
      areNotEqual = true;
  return areNotEqual;
}

template <>
bool Vector<double>::operator!=(const Vector<double> &vector) const {
  bool areNotEqual = true;
  if (this->dimension != vector.dimension)
    return areNotEqual;

  areNotEqual = false;
  IteratorConst<double> srcIter = this->begin();
  for (IteratorConst<double> dstIter = vector.begin(); srcIter && !areNotEqual;
       dstIter++)
    if (std::abs(*srcIter - *dstIter) < std::numeric_limits<double>::epsilon())
      areNotEqual = true;
  return areNotEqual;
}

template <>
bool Vector<long double>::operator!=(const Vector<long double> &vector) const {
  bool areNotEqual = true;
  if (this->dimension != vector.dimension)
    return areNotEqual;

  areNotEqual = false;
  IteratorConst<long double> srcIter = this->begin();
  for (IteratorConst<long double> dstIter = vector.begin();
       srcIter && !areNotEqual; dstIter++)
    if (std::abs(*srcIter - *dstIter) <
        std::numeric_limits<long double>::epsilon())
      areNotEqual = true;
  return areNotEqual;
}

template <typename C>
bool Vector<C>::areNotEqual(const Vector<C> &vector) const {
  return *this != vector;
}

template <typename C>
void Vector<C>::isDimensionEqual(const Vector<C> &vector,
                                    size_t currentLine) const {
  time_t currentTime = time(NULL);
  if (this->dimension != vector.dimension)
    throw InvalidVectorDimensionException(__FILE__, typeid(*this).name(),
                                          currentLine, ctime(&currentTime));
}

template <typename C>
std::ostream &operator<<(std::ostream &os, const Vector<C> &vector) {
  IteratorConst<C> iterator = vector.begin();
  if (!iterator) {
    os << "()";
    return os;
  }

  os << "(";
  os << *iterator;
  for (iterator++; iterator; iterator++)
    os << ", " << *iterator;
  os << ")";

  return os;
}


#endif
