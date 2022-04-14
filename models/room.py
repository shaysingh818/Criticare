class Room: 

    def __init__(self, attribute_dict):
		"""
			Attributes are in alphabetical order because dict type
			automatically sorts key values
		"""	
			
		self.availibility = attribute_dict["availibility"]	
        self.cost = attribute_dict["cost"]	
        self.room_id = attribute_dict["room_id"]
        self.room_number = attribute_dict["room_number"]	
	
    # example methods
	def check_room_id(self):
		pass

    def check_cost(self):
        pass 

    def test_print(self):
		print("============================")	
        print("Availability: {}".format(self.availibility))
        print("Cost: {}".format(self.cost))
        print("Room ID: {}".format(self.room_id))
        print("Room Number: {}".format(self.room_number))
		print("============================")