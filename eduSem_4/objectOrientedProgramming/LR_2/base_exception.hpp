#ifndef BASEEXCEPTION_HPP
#define BASEEXCEPTION_HPP

#include "baseException.h"

baseException::baseException(std::string moduleName, std::string className,
                             size_t lineOccured, const char *timeOccured,
                             std::string logInfo = "Traceback : \n") {
  logInfo = "Module : " + moduleName + "\nClass " + className + " ,line " +
            std::to_string(lineOccured) + " " + timeOccured +
            "\nException occured : ";
}
const char *baseException::what() const noexcept { return logInfo.c_str(); }

#endif // BASEEXCEPTION_HPP
