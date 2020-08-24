import 'package:first_app/models/student.dart';
import 'package:first_app/screens/student_add.dart';
import 'package:first_app/screens/student_edit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Merhaba İlk Uygulamam!!!!";

  Student selectedStudent=Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1,"Alexandros", "Finch", 25),
    Student.withId(2,"Kacey", "Finch", 65),
    Student.withId(3,"Kayson", "Finch", 45)
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body: buildBody(context));
  }



  void puanHesapla(BuildContext context, String cevap) {
    var alert = AlertDialog(
      title: Text("İşlem  Sonucu"),
      content: Text(cevap),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("sınavda aldığı not = " +
                        students[index].grade.toString() +
                        " [ " +
                        students[index].getStatus +
                        " ] "),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                      print(selectedStudent);
                    },
                  );
                })),
        Text("Seçili öğrenci:  " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.green,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text("YENİ"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAddd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.blue,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("GÜNCELLE"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: [
                    Icon(Icons.delete_sweep),
                    SizedBox(width: 5.0),
                    Text("SİL"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var cevap = "Başarıyla Silindi " + selectedStudent.firstName;
                  puanHesapla(context, cevap);
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done_all);
    } else if (grade >= 40) {
      return Icon(Icons.access_alarms);
    } else {
      return Icon(Icons.do_not_disturb_alt);
    }
  }
}
