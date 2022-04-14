class Medication: 

   def __init__(self, attribute_dict):
		"""
			Attributes are in alphabetical order because dict type
			automatically sorts key values
		"""	
			
		self.code = attribute_dict["code"]	
        self.med_id = attribute_dict["med_id"]	
        self.name = attribute_dict["name"]
        self.price = attribute_dict["price"]	
	
    # example methods
	def check_name(self):
		pass

    def check_price(self):
        pass
    
     def test_print(self):
		print("============================")	
        print("Code: {}".format(self.code))
        print("Medicine ID: {}".format(self.med_id))
        print("Name: {}".format(self.name))
        print("Price: {}".format(self.price))
		print("============================")