# CritiCare Emergency Room Application

<p float="left">
  <img src="https://github.com/shaysingh818/Criticare/blob/master/screenshots/intakeDetail.png" width="400" />
  <img src="https://github.com/shaysingh818/Criticare/blob/master/screenshots/login.png" width="400" /> 
</p>


Criticare is an information management system for emergency rooms/critical care centers. The application stores information on a database and allows users to view, read, update and enter hospital related information. Some of the main features of criticare are managing patient/employee information, reserve rooms to perform procedures on patient and diagnose and provide the proper medical care in emergencies. 


## Overview

# General Description
Criticare is a information managment system for Hospital/Emergency room. The application stores information about Patients, Employees and Procedures/Medical Conditions. Employees/Users can create accounts and view their medical/work information. Overall, this application allows patients to get the correct medical diagnosis/procedure in the event of an emergency. 

## Product Perspective
It is part of a larger product. There will be many components, such as the patient intake, the procedure, diagnosis, medication, room assign, room, permission, results, patient and employee information. From an interface perspective, for example, components such as procedure, diagnosis, medication etc. will pull info from Intake. As for hardware used, the system is running on one CPU with a sqlite3 database.


## Product Functions
1. **Employee management service**
	* Manages employees (Doctors, nurses, janitorial etc. )
	* Permissions system: Employees can have access to information baseds on their role/permission assigned. 
	* Doctors/Nurses can view patient information and schedule procedures
2. **Patient Intake Service**
	* Adds patient information to the database
	* Validates intake/arrival information
	* Prescribe meidcations/assign procedures to patient
	* Diagnose patient with specific medical conditions
	* Admit patient to ER
3. **Procedure/Room Assignment Service**
	* Assign patients/employees to designated room for procedure
	* Keep track of room availability status
4. **User login/registration/authentication**
	* Users/Employees can register and account and log in with provided information
	* Account information is stored in a database


## User Characteristics
There are many types of users for this application. The user roles are defined as

| FieldName | Summary                                                 |
|-----------|---------------------------------------------------------|
| ```Admin```     | Has full access to database and application source code |
|``` Nurse```     | Nurses using the application for helping patients.      |
| ```Doctor```    | Doctors using the application for helping patients.     |
| ```Janitor```   | Cleaning/Janitor services employees.                    |
| ```Patient```   | The patient using the application.                      |


Down below, the user characterstics are divided into 5 sections, Nurse, Doctor, Janitor and Patient. These characteristics are seperated based on the role/permission usage of the application. All types of users down below can log in with their account information saved in a database. 

1. **Admin User**
	* Access to all CRUD operations for every model in the database
	* Deploy multiple instances of ER application. 
2. **Nurse**
	* Can view/admit patients to the ER
	* View/Provide information about patient procedures, medications or diagnosis
	* Check rooms that are available for procedures/overnight patient stays.
3. **Doctor**
	* Has all the same permissions that a nurse has
	* Can diagnose and prescribe medication
	* Create/Schedule procedures. 
4. **Janitor**
	* This is here to show that multiple types of employees can exist in the data model
	* Access to rooms for cleaning up after procedures. 
5. **Patient**
	* Can view schedules procedures
	* View medications/dignosis given by doctor or nurse
	* Can view financial summary/cost of visit after discharge

## General Constraints
1. **Defensive Security Constraints** 
	* Cannot provide real time user session authentication
	* SQLITE3 (Database Framework) is vunerable to injections with escaped string patterns. 
	* Application does not have brute force mitigation
	* Data is not replicated or on a distributed cluster. Architecture is monolithic. 
2. **Offensive Security Constraints** 
	* To log in, user must have account information saved in the database. 
	* Application should only be accesible through the GUI unless user has admin access. 
	* Permission hierachy for access to information. Permission hiearchy goes in order: Admin -> Doctor -> Nurse -> Janitor -> Patient
	* Admin is the only one that has access to the database file (raw). 
3. **Governmental Constraints**:
	* FERPA regulations
	* HIPPA confidentiality
4. **Hardware Constraints**::
	* System is running on one CPU with a sqlite3 database
	* 1TB hard drive space. 




## Maintainability

Down below is a list of things the developers will be responsible for fixing if bugs/issues come up. 

Database Repository: All the code responsible for interacting with the database 

Services: Employee Management Service, Patient Intake and Room assignment. All the logic and code needed to provide data to the GUI. 

GUI: PYQT user interface. Any issues that occur with the GUI and layout/style of application will be subject to review if any errors come up. 
 

**Other Requirements**: 
# Application Architecture
This is a model of how the database functions will be seperated from the buisness logic of the application. The figure shows a library designated for buisness logic and the data repository. The database repository will use sqlite3, with the ER diagram implemented. 

The object relational mapper is just a way to serialize database entites into classses/objects. 

![Buisness Logoc](./images/p1.png)

