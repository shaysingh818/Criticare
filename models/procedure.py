class Procedure:

    def __init__(self, attribute_dict):
		"""
			Attributes are in alphabetical order because dict type
			automatically sorts key values
		"""	
			
		self.cost = attribute_dict["cost"]	
        self.name = attribute_dict["name"]	
        self.notes = attribute_dict["notes"]
        self.procedure = attribute_dict["procedure"]
        self.results = attribute_dict["results"]
        self.staff = attribute_dict["staff"]
        self.test_type = attribute_dict["test_type"]
        
    # example methods
	def check_name(self):
		pass

    def check_cost(self):
        pass
        

     def test_print(self):
		print("============================")	
        print("Cost: {}".format(self.cost))
        print("Name: {}".format(self.name))
        print("Notes: {}".format(self.notes))
        print("Procedure: {}".format(self.procedure))
        print("Results: {}".format(self.results))
        print("Staff: {}".format(self.staff))
        print("Test Type: {}".format(self.test_type))
		print("============================")