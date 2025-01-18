import 'dart:io';
class Person{
  String name="";
  String email="";

  //NAME (Setter)
  void set p_name(String name){
  this.name = name;
  }
  //NAME (Getter)
  String get p_name{
  return name;
  }
  //EMAIL (Setter)
  void set p_email(String email){
  this.email = email;
  }
  //EMAIL (Getter)
  String get p_email{
  return email;
  }
}

class Employee{
  int empnum=0;

}

class Student{
  int studnum=0;
  
}

void main(){

Person p1 = new Person();

stdout.write("Enter your name: ");
String name = stdin.readLineSync()!;
p1.p_name= name;

stdout.write("Enter your name: ");
String email = stdin.readLineSync()!;
p1.p_email= email;

stdout.write("Are you an [1]employee or [2]student?-->");
int status = int.parse(stdin.readLineSync()!);

if (status == 1){
  
}
}
