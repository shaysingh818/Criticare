
class Intake: 
	
	def __init__(self, attribute_dict):
		"""
			Attributes are in alphabetical order because dict type
			automatically sorts key values
		"""		
		self.admitted = attribute_dict["admitted"]	
		self.ambulance = attribute_dict["ambulance"]	
		self.blood_pressure = attribute_dict["blood_pressure"]
		self.date_discharged = attribute_dict["date_discharged"]
		self.date_posted = attribute_dict["date_posted"]
		self.diagnosis = attribute_dict["diagnosis"]	
		self.discharge = attribute_dict["discharge"]
		self.intake_id = attribute_dict["intake_id"]
		self.notes = attribute_dict["notes"]
		self.patient_id = attribute_dict["patient_id"]
		self.procedure = attribute_dict["procedure"]
		
	# example methods
	def check_intake_id(self):
		print("TEST ID", self.intake_id)

	def check_admitted(self):
		pass
		
	def test_print(self):
		print("============================")	
		print("Admitted: {}".format(self.admitted))
		print("Ambulance: {}".format(self.ambulance))
		print("Blood Pressure: {}".format(self.blood_pressure))
		print("Date Discharged: {}".format(self.date_discharged))
		print("Date Posted: {}".format(self.date_posted))
		print("Diagnosis: {}".format(self.diagnosis))
		print("Intake ID: {}".format(self.intake_id))
		print("Notes: {}".format(self.notes))
		print("Patient ID: {}".format(self.patient_id))
		print("Procedure: {}".format(self.procedure))
		print("============================")
