import 'package:flutter/material.dart';
import 'package:widget/models/student.dart';
import 'package:widget/screens/student_add.dart';
import 'package:widget/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(), // MyApp widget'ını burada kullanıyoruz
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent =Student(0,"", "", 0);

 List<Student> students =[Student.withId(1,"Büşra", "Yıldrım" , 36),
   Student.withId(2,"Hatice", "Akçay" , 95 ),
   Student.withId(3,"Zehra", "Benice" , 48)];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody( context)

      ,
    );
  }
/*
  String sinavhesapla(int puan) {
    String mesaj = "";
    if (puan <= 50) {
      mesaj = "Dersten Kaldınız";
    } else {
      if (puan > 60 && puan < 80) mesaj = "dersi BB ile geçti";

      if (puan > 80 && puan < 100) mesaj = "dersi AA ile geçti ";
    }
    ;
    return mesaj;
  }
*/
  void mesajgoster(BuildContext context,String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );

    // Bu satırda dialogu göstermek için showDialog fonksiyonunu çağırmalısınız
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2021/04/27/04/19/girl-6210483_1280.jpg"),
                    ),
                    title:Text(students[index].firstName+" "+students[index].lastName),
                    subtitle: Text("Sinavdan aldığı Not :" + students[index].grade.toString()+"["+students[index].getStatus+"]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      setState(() {
                        selectedStudent=students[index];
                      });

                      print(selectedStudent.firstName);

                    },
                  );
                })),
        Text("Seçili Öğrenci : " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent, // Butonun arka plan rengi
                  foregroundColor: Colors.white, // Buton üzerindeki yazı ve ikon rengi
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 1.0,),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentAdd(students)));
                },
              ), // ElevatedButton
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Butonun arka plan rengi
                  foregroundColor: Colors.white, // Buton üzerindeki yazı ve ikon rengi
                ),
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 2.0,),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentEdit(selectedStudent)));

                  var mesaj ="Güncellendi";
                  mesajgoster(context, mesaj);
                },
              ), // ElevatedButton
            ),Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Butonun arka plan rengi
                  foregroundColor: Colors.white, // Buton üzerindeki yazı ve ikon rengi
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 2.0,),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var mesaj ="Silindi";
                  mesajgoster(context, mesaj);
                },
              ), // ElevatedButton
            )
          ],
        )




      ],
    );

  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40 ) {
      return Icon(Icons.album);
    }
      else{
      return Icon(Icons.clear);
    };

  }
}
