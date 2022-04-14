class Med_condition:

    def __init__(self, attribute_dict):
		"""
			Attributes are in alphabetical order because dict type
			automatically sorts key values
		"""	
			
		self.code = attribute_dict["code"]	
        self.diagnosis = attribute_dict["diagnosis"]	
        self.name = attribute_dict["name"]

    # example methods
	def check_name(self):
		pass	
	
     def test_print(self):
		print("============================")	
        print("Code: {}".format(self.code))
        print("Diagnosis: {}".format(self.diagnosis))
        print("Name: {}".format(self.name))
		print("============================")