class Result:

     def __init__(self, attribute_dict):
		"""
			Attributes are in alphabetical order because dict type
			automatically sorts key values
		"""	
			
		self.assigned_physician = attribute_dict["assigned_physician"]	
        self.blood_pressure = attribute_dict["blood_pressure"]	
        self.notes = attribute_dict["notes"]
        self.procedure_id = attribute_dict["procedure_id"]	
        self.result_id = attribute_dict["result_id"]
	
    # example methods
	def check_assigned_physisian(self):
		pass

    def check_blood_pressure(self):
        pass

    def test_print(self):
		print("============================")	
        print("Assigned Physician: {}".format(self.assigned_physician))
        print("Blood Pressure: {}".format(self.blood_pressure))
        print("Notes: {}".format(self.notes))
        print("Procedure ID: {}".format(self.procedure_id))
        print("Result ID: {}".format(self.result_id))
		print("============================")
