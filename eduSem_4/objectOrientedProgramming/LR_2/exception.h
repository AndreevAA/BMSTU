#ifndef EXCEPTION_H
#define EXCEPTION_H

#include "base_exception.h"

class memoryException : public baseException {
public:
  memoryException(std::string moduleName, std::string className,
                  size_t lineOccured, const char *timeOccured,
                  std::string logInfo = "Unable to allocate memory.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

class deletedObjectException : public baseException {
public:
  deletedObjectException(
      std::string moduleName, std::string className, size_t lineOccured,
      const char *timeOccured,
      std::string logInfo = "Unable to use an object that does not exsist.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

class emptyVectorException : public baseException {
public:
  emptyVectorException(std::string moduleName, std::string className,
                       size_t lineOccured, const char *timeOccured,
                       std::string logInfo = "Vector is empty.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

class IndexException : public baseException {
public:
  IndexException(std::string moduleName, std::string className,
                 size_t lineOccured, const char *timeOccured,
                 std::string logInfo = "Vector index is out of range.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

class ZeroDivisionException : public baseException {
public:
  ZeroDivisionException(std::string moduleName, std::string className,
                        size_t lineOccured, const char *timeOccured,
                        std::string logInfo = "Division by zero.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

class InvalidSrcArrayPointerException : public baseException {
public:
  InvalidSrcArrayPointerException(
      std::string moduleName, std::string className, size_t lineOccured,
      const char *timeOccured,
      std::string logInfo = "Invalid copy array pointer.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

class InvalidVectorDimensionException : public baseException {
public:
  InvalidVectorDimensionException(
      std::string moduleName, std::string className, size_t lineOccured,
      const char *timeOccured,
      std::string logInfo = "Vector dimensions are not equal.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

class CrossProductUndefinedException : public baseException {
public:
  CrossProductUndefinedException(
      std::string moduleName, std::string className, size_t lineOccured,
      const char *timeOccured,
      std::string logInfo =
          "Cross product is undefined for non 3 - dimentional vectors.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

class InvalidIteratorException : public baseException {
public:
  InvalidIteratorException(std::string moduleName, std::string className,
                           size_t lineOccured, const char *timeOccured,
                           std::string logInfo = "Invalid iterator.")
      : baseException(moduleName, className, lineOccured, timeOccured,
                      logInfo){};
  virtual const char *what() const noexcept { return logInfo.c_str(); }
};

#endif // EXCEPTION_H
