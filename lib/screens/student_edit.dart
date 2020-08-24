import 'package:first_app/models/student.dart';
import 'package:first_app/validation/student_validation.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget{

  Student selectedStudent;
  StudentEdit( Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentAddstate(selectedStudent);
  }

}

class _StudentAddstate extends State with StudentValidationmixin {
  Student selectedStudent;

  var formKey = GlobalKey<FormState>();

  _StudentAddstate( Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenciyi Güncelle"),
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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(
          labelText: "Öğrenci Adı",hintText: "Ebubekir"
      ),
      validator: validateFirstName,
      onSaved: (String value){
        selectedStudent.firstName=value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(
          labelText: "Öğrenci Soyadı",hintText: "Demiray"
      ),
      validator: validateLastName,
      onSaved: (String value){
        selectedStudent.lastName=value;
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(
          labelText: "Öğrenci Notu",hintText: "65"
      ),
      validator: validateGrade,
      onSaved: (String value){
        selectedStudent.grade=int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState.validate()){

          formKey.currentState.save();



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