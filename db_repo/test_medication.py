import unittest
import medication as med
import procedure as proc
from pprint import pprint
from datetime import date

class TestCriticarePatientMethods(unittest.TestCase):

	def test_get_patient_medications_cost(self):
		
		# view patients medications from intake
		result = med.view_intake_medications(1)
		if result:
			print("# PASSED CREATE PATIENT: ")

		# calculate total cost of medication
		total_cost = 0
		for re in result:
			med_id = re["medication_id"]
			medication = med.view_medication_by_id(med_id)
			pprint(medication)
			total_cost += medication["price"]
			
		print(total_cost)

	
	def test_get_patient_procedures_cost(self):
		
		# view pateient's procedures from intake
		result = proc.view_intake_procedures(1)
		if result:
			print("# PASSED VIEW PROCEDURE: ")

		# calculate total cost of procedures
		total_cost = 0
		for re in result:
			procedure_id = re["procedure_id"]
			procedure = proc.view_procedure_by_id(procedure_id)
			pprint(procedure)
			total_cost += procedure["cost"]
			
		print(total_cost)

	
			


if __name__ == '__main__':
    unittest.main()

