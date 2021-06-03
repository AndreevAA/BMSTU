#ifndef BASEEXCEPTION_H
#define BASEEXCEPTION_H

#include <exception>
#include <iostream>

class baseException : public std::exception {
public:
  baseException(std::string moduleName, std::string className,
                size_t lineOccured, const char *timeOccured,
                std::string logInfo);
  virtual const char *what() const noexcept override;
  virtual ~baseException(){};

protected:
  std::string logInfo;
};

#include "baseException.hpp"

#endif // BASEEXCEPTION_H
