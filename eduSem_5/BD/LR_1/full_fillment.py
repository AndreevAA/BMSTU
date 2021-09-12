from random import *
import config


def get_rand_manufacturer():
    return config.COUNTRIES[randint(0, len(config.COUNTRIES) - 1)]


def _get_rand_name(prefix):
    result_rand_name = prefix + "_"

    for i in range(randint(3, 10)):
        result_rand_name += chr(randint(ord('A'), ord('Z') - 1))

    result_rand_name += "_"

    for i in range(randint(3, 10)):
        result_rand_name += chr(randint(ord('1'), ord('9') - 1))

    return result_rand_name


class HULL:
    _id = None
    _name = None
    _manufacturer = None

    def __init__(self, temp_id):
        self._id = temp_id
        self._name = _get_rand_name("HULL")
        self._manufacturer = get_rand_manufacturer()

    def get_id(self):
        return self._id

    def get_name(self):
        return self._name

    def get_manufacturer(self):
        return self._manufacturer


class TOWER:
    _id = None
    _name = None
    _manufacturer = None

    def __init__(self, temp_id):
        self._id = temp_id
        self._name = _get_rand_name("TOWER")
        self._manufacturer = get_rand_manufacturer()

    def get_id(self):
        return self._id

    def get_name(self):
        return self._name

    def get_manufacturer(self):
        return self._manufacturer


class BARREL:
    _id = None
    _name = None
    _manufacturer = None

    def __init__(self, temp_id):
        self._id = temp_id
        self._name = _get_rand_name("BARREL")
        self._manufacturer = get_rand_manufacturer()

    def get_id(self):
        return self._id

    def get_name(self):
        return self._name

    def get_manufacturer(self):
        return self._manufacturer
