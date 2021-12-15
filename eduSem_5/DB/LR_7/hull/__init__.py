import config


class Hull:
    hull_id = int()
    hull_name = str()
    hull_manufacturer = str()
    hull_length = int()
    hull_width = int()
    hull_height = int()
    hull_fuel_tank = int()
    barrel_id = int()
    barrel_name = str()

    def __init__(self, hull_id, hull_name, hull_manufacturer,
                 hull_length, hull_width, hull_height, hull_fuel_tank, barrel_id, barrel_name):
        self.hull_id = hull_id
        self.hull_name = hull_name
        self.hull_manufacturer = hull_manufacturer
        self.hull_length = hull_length
        self.hull_width = hull_width
        self.hull_height = hull_height
        self.hull_fuel_tank = hull_fuel_tank
        self.barrel_id = barrel_id
        self.barrel_name = barrel_name

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
            'barrel_id': self.barrel_id,
            'barrel_name': self.barrel_name
        }

    def __str__(self):
        return f"{self.hull_id : < 10}"


def create_hulls(file_name):
    file = open(file_name)
    hulls = list()

    k = 0
    for line in file:
        if k > 0:
            arr = line.split(',')
            if int(arr[0]) < config.ID_LESS:
                arr[0] = int(arr[0])
                arr[3] = float(arr[3])
                arr[4] = float(arr[4])
                arr[5] = float(arr[5])
                arr[6] = float(arr[6])

                hulls.append(Hull(*arr).get())
        k += 1

    return hulls
