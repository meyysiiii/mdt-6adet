import 'dart:io';
import 'dart:math';

class Person {
  String _name = "";
  String _email = "";

  Person(this._name, this._email);

  String get person_name {
    return this._name;
  }

  void set person_name(String name) {
    this._name = name;
  }

  String get person_email {
    return this._email;
  }

  void set person_email(String email) {
    this._email = email;
  }
}

class Employee extends Person {
  int _empNum;

  Employee(String name, String email, this._empNum) : super(name, email);

  int get empNum {
    return _empNum;
  }

  void set empNum(empNum) {
    this._empNum = empNum;
  }

  void display() {
    print('Your Employee number: $_empNum');
  }
}

class Student extends Person {
  int _studNum;

  Student(String name, String email, this._studNum) : super(name, email);

  int get studNum {
    return _studNum;
  }

  void set studNum(int studNum) {
    this._studNum = studNum;
  }

  void display() {
    print('Your Employee number: $_studNum');
  }
}

String passwordGenerator() {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  final random = Random();
  return List.generate(10, (index) => chars[random.nextInt(chars.length)])
      .join();
}

void loginAndChangePassword(String email) {
  String temporaryPass = passwordGenerator();
  print('--> Your temporary password is: $temporaryPass');

  print('\n==Kindly log in with your username and temporary password.==');
  while (true) {
    stdout.write('>> Enter your username: ');
    String username = stdin.readLineSync()!;

    stdout.write('>> Enter your (temporary) password: ');
    String password = stdin.readLineSync()!;

    if (username == email && password == temporaryPass) {
      print('Successfully Logged In!');

      stdout.write('>> Enter your new password: ');
      String newPassword = stdin.readLineSync()!;

      print('Password changed successfully!');
      return;
    } else {
      print('Login failed. Please try again.\n');
    }
  }
}

void main() {
  try {
    print('Enter your choice number.');
    stdout.write('Are you an [1] Employee or a [2] Student? --> ');
    int status = int.parse(stdin.readLineSync()!);

    stdout.write('Enter your name --> ');
    String name = stdin.readLineSync()!;

    stdout.write('Enter your email --> ');
    String email = stdin.readLineSync()!;

    if (status == 1) {
      stdout.write('Enter your employee number --> ');
      int empNum = int.parse(stdin.readLineSync()!);

      Employee employee = Employee(name, email, empNum);
      employee.display();
      print('\n==WELCOME, ${employee.person_name}!==');
      print('--> Your username is: ${employee.person_email}');
      loginAndChangePassword(employee.person_email);
    } else if (status == 2) {
      stdout.write('Enter your student number --> ');
      int studNum = int.parse(stdin.readLineSync()!);

      Student student = Student(name, email, studNum);
      student.display();
      print('\n==WELCOME, ${student.person_name}!==');
      print('--> Your username is: ${student.person_email}');
      loginAndChangePassword(student.person_email);
    } else {
      print('Invalid choice. Please restart the program.');
    }
  } catch (e) {
    print('Error: Invalid input. Please restart the program and try again.');
  }
}
