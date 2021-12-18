from random import randint, choice


class Dictionary:

    _generation_number, _type_of_contract, _data = None, None, None

    def __init__(self, _generation_number, _type_of_contract, show_generation):
        self._generation_number = _generation_number
        self._type_of_contract = _type_of_contract

        self._generate()

        if show_generation:
            print(self._data)

    @property
    def data(self):
        return self._data

    def _generate(self):
        _v_data = []

        for i in range(self._generation_number):
            record = {'number': i + 1,
                      'type': choice(self._type_of_contract)}
            _v_data.append(record)

        self._data = _v_data
