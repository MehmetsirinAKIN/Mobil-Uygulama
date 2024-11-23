class Student{
  int id=0;
  String firstName="";
  String lastName="";
  int grade=0 ;
  String _status="";

  Student.withId(int id,String firstName,String lastName,int grade ){
    this.id= id;
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;
  }

  Student(int id,String firstName,String lastName,int grade ){
    this.id= id;
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;
  }

  Student.withoutInfo(){

  }

  String get getStatus{
    String message = "";
    if (this.grade >= 50) {
      message = "Dersten Geçti";
    } else if (this.grade >= 40 ){
        message = "Bütünlemeye kaldı";
    }else{
      message = "Kaldınız ";
    }
    return message;
  }
}