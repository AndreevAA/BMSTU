import config


class Hull:
    hull_id = int()
    hull_name = str()
    hull_manufacturer = str()
    hull_length = int()
    hull_width = int()
    hull_height = int()
    hull_fuel_tank = int()

    def __init__(self, hull_id, hull_name, hull_manufacturer,
                 hull_length, hull_width, hull_height, hull_fuel_tank):
        self.hull_id = hull_id
        self.hull_name = hull_name
        self.hull_manufacturer = hull_manufacturer
        self.hull_length = hull_length
        self.hull_width = hull_width
        self.hull_height = hull_height
        self.hull_fuel_tank = hull_fuel_tank

    def get(self):
        # print({'hull_id': self.hull_id,
        #        'hull_name': self.hull_name,
        #        'hull_manufacturer': self.hull_manufacturer,
        #        'hull_length': self.hull_length,
        #        'hull_width': self.hull_width,
        #        'hull_height': self.hull_height,
        #        'hull_fuel_tank': self.hull_fuel_tank})
        return {
            'hull_id': self.hull_id,
            'hull_name': self.hull_name,
            'hull_manufacturer': self.hull_manufacturer,
            'hull_length': self.hull_length,
            'hull_width': self.hull_width,
            'hull_height': self.hull_height,
            'hull_fuel_tank': self.hull_fuel_tank,
        }

    def __str__(self):
        return f"{self.hull_id : < 10}"
