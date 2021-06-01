#ifndef LIST_H
#define LIST_H


#include <iostream>
#include "node.h"
#include "iterator.h"
#include "const_iterator.h"
#include "base_list.hpp"
using namespace std;


template <typename C> class Vector : public baseVector {
public:
  friend Iterator<C>;
  friend IteratorConst<C>;

  // constructors
  Vector();

  explicit Vector(size_t dimension);
  Vector(std::initializer_list<C> valueList);
  Vector(size_t dimension, const C *valueArray);
  template <typename _C> Vector(_C start, _C end);

  Vector(const Vector<C> &srcVector);
  Vector(Vector<C> &&srcVector) noexcept;

  // Destructor
  virtual ~Vector() = default;

  // bool functions
  bool isZeroVector() const noexcept;
  bool isUnitVector() const noexcept;

  // single vector
  template <typename rC> rC getMagnitude() const;
  template <typename rC> Vector<rC> getUnitVector() const;

  // two vectors
  double getAngle(const Vector<C> &vector) const;

  // bool functions
  bool areCollinear(const Vector<C> &vector) const;
  bool areOrthogonal(const Vector<C> &vector) const;

  C &at(size_t inx);
  const C &at(size_t inx) const;

  C &operator[](size_t inx);
  const C &operator[](size_t index) const;

  // Iterator const

  IteratorConst<C> cBegin() const noexcept;
  IteratorConst<C> cEnd() const noexcept;

  IteratorConst<C> begin() const noexcept;
  IteratorConst<C> end() const noexcept;

  // Iterator
  Iterator<C> begin() noexcept;
  Iterator<C> end() noexcept;

  // overloads
  Vector<C> &operator=(const Vector<C> &srcVector);
  Vector<C> &operator=(Vector<C> &&srcVector);
  Vector<C> &operator=(std::initializer_list<C> valueList);

  // pair overload + method
  // Addition
  Vector<C> &operator+=(const Vector<C> &vector);
  void addVector(const Vector<C> &vector);

  template <typename vC>
  decltype(auto) operator+(const Vector<vC> &vector) const;
  template <typename vC>
  decltype(auto) vectorSum(const Vector<vC> &vector) const;

  // Subtraction
  Vector<C> &operator-=(const Vector<C> &vector);
  void subtractVector(const Vector<C> &vector);

  template <typename vC>
  decltype(auto) operator-(const Vector<vC> &vector) const;
  template <typename vC>
  decltype(auto) vectorDif(const Vector<vC> &vector) const;

  // Multiplication
  Vector<C> &operator*=(const Vector<C> &vector);

  Vector<C> &operator*=(const C &value);

  template <typename vC> decltype(auto) operator*(const vC &value) const;
  template <typename vC>
  decltype(auto) multiplyNumber(const vC &value) const;

  template <typename vC>
  decltype(auto) operator*(const Vector<vC> &vector) const;
  template <typename vC>
  decltype(auto) dotProduct(const Vector<vC> &vector) const;
  template <typename vC>
  decltype(auto) crossProduct(const Vector<vC> &vector) const;

  // Unary operators
  Vector<C> operator-();
  Vector<C> getNegative();

  // compare
  bool operator==(const Vector<C> &vector) const;
  bool areEqual(const Vector<C> &vector) const;
  bool operator!=(const Vector<C> &vector) const;
  bool areNotEqual(const Vector<C> &vector) const;

protected:
  void isDimensionEqual(const Vector<C> &vector, size_t currentLine) const;
  void allocateMemory(size_t vectorDim);

private:
  std::shared_ptr<C[]> coordinates;
};

#endif
