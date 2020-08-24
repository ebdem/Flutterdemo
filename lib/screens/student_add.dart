import 'package:first_app/models/student.dart';
import 'package:first_app/validation/student_validation.dart';
import 'package:flutter/material.dart';

class StudentAddd extends StatefulWidget{

  List<Student> students;
  StudentAddd(List<Student> students){
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddstate(students);
  }

}

class _StudentAddstate extends State with StudentValidationmixin {
  List<Student> students;
  var student =Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddstate(List<Student> students){
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeNameField(),
               buildSubmitButton()
            ],
          ),
        ),
      )
    );
  }

 Widget buildFirstNameField() {
   return TextFormField(
     decoration: InputDecoration(
         labelText: "Öğrenci Adı",hintText: "Ebubekir"
     ),
     validator: validateFirstName,
     onSaved: (String value){
       student.firstName=value;
     },
   );
 }

 Widget buildLastNameField() {
   return TextFormField(
     decoration: InputDecoration(
         labelText: "Öğrenci Soyadı",hintText: "Demiray"
     ),
     validator: validateLastName,
     onSaved: (String value){
       student.lastName=value;
     },
   );
 }

 Widget buildGradeNameField() {
   return TextFormField(
     decoration: InputDecoration(
         labelText: "Öğrenci Notu",hintText: "65"
     ),
     validator: validateGrade,
     onSaved: (String value){
       student.grade=int.parse(value);
     },
   );
 }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState.validate()){

          formKey.currentState.save();
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