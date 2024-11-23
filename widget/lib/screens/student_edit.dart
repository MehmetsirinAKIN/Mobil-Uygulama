import 'package:flutter/material.dart';
import 'package:widget/models/student.dart';

import '../validator/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(this.selectedStudent);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State<StudentEdit> with StudentValidationMixin{
  Student selectedStudent;

  var formKey  = GlobalKey<FormState>();
  _StudentAddState(this.selectedStudent);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child : Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            )
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(
          labelText: "Öğrenci adı",
          hintText: "Mehmet"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Lütfen bir isim giriniz";
        }
        return validateFirstName(value);
      },
      onSaved: (value) {
        if (value != null) {
          selectedStudent.firstName = value;
        }
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(
          labelText: "Öğrenci Soyadı",
          hintText: "Akın"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Lütfen bir Soyisim giriniz";
        }
        return validateFirstName(value);
      },
      onSaved: (value) {
        if (value != null) {
          selectedStudent.lastName = value;
        }
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(
          labelText: "Öğrencin Aldığı Not",
          hintText: "67"
      ),
      validator: validateGrade,
      onSaved: (value) {
        if (value != null) {
          selectedStudent.grade = int.parse(value);
        }
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("kaydet"),
      onPressed: (){
        if (formKey.currentState != null && formKey.currentState!.validate()) {
          formKey.currentState!.save();

          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);

  }
}