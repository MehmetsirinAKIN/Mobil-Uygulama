import 'package:flutter/material.dart';
import 'package:widget/models/student.dart';

import '../validator/student_validator.dart';

class StudentAdd extends StatefulWidget {
  final List<Student> students;
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin{
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey  = GlobalKey<FormState>();
  _StudentAddState(this.students);


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
          student.firstName = value;
        }
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
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
          student.lastName = value;
        }
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrencin Aldığı Not",
          hintText: "67"
      ),
      validator: validateGrade,
      onSaved: (value) {
        if (value != null) {
          student.grade = int.parse(value);
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
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
        );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);

  }
}