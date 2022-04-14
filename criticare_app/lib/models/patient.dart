// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

List<Patient> patientFromJson(String str) => List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {

    Patient({
        required this.patientId,
        required this.ssn,
        required this.firstName,
        required this.middleName,
        required this.lastName,
        required this.dateOfBirth,
        required this.height,
        required this.weight,
        required this.nextOfKin,
        required this.homePhone,
        required this.workPhone,
        required this.healthInsurance,
        required this.vaccination,
        required this.vaccinationDate,
        required this.drugsAlchohol,
        required this.sexuallyActive,
        required this.allergies,
        required this.bloodType,
        required this.notes,
    });

    int? patientId;
    String? ssn;
    String? firstName;
    String? middleName;
    String? lastName;
    String? dateOfBirth;
    String? height;
    String? weight;
    String? nextOfKin;
    String? homePhone;
    String? workPhone;
    String? healthInsurance;
    String? vaccination;
    String? vaccinationDate;
    String? drugsAlchohol;
    String? sexuallyActive;
    String? allergies;
    String? bloodType;
    String? notes;

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patientId: json["patient_id"],
        ssn: json["ssn"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        dateOfBirth: json["date_of_birth"],
        height: json["height"],
        weight: json["weight"],
        nextOfKin: json["next_of_kin"],
        homePhone: json["home_phone"],
        workPhone: json["work_phone"],
        healthInsurance: json["health_insurance"],
        vaccination: json["vaccination"],
        vaccinationDate: json["vaccination_date"],
        drugsAlchohol: json["drugs_alchohol"],
        sexuallyActive: json["sexually_active"],
        allergies: json["allergies"],
        bloodType: json["blood_type"],
        notes: json["notes"],
    );

    Map<String, dynamic> toJson() => {
        "patient_id": patientId,
        "ssn": ssn,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "date_of_birth": dateOfBirth,
        "height": height,
        "weight": weight,
        "next_of_kin": nextOfKin,
        "home_phone": homePhone,
        "work_phone": workPhone,
        "health_insurance": healthInsurance,
        "vaccination": vaccination,
        "vaccination_date": vaccinationDate,
        "drugs_alchohol": drugsAlchohol,
        "sexually_active": sexuallyActive,
        "allergies": allergies,
        "blood_type": bloodType,
        "notes": notes,
    };
}
