import 'dart:io';

void main() {
  print("Programming Club Students");

  final List<Map<String, dynamic>> students = [];
  final Set<String> contacts = {};

  const int maxStudents = 5;

  for (int i = 0; i < maxStudents; i++) {
    print("\nStudent ${i + 1} of $maxStudents");

    Map<String, dynamic> student = {};

    print("Full Name: ");
    student['name'] = stdin.readLineSync()!;

    print("About / Details: ");
    student['details'] = stdin.readLineSync()!;

    print("Present Address: ");
    student['presentAddress'] = stdin.readLineSync()!;

    print("Permanent Address: ");
    student['permanentAddress'] = stdin.readLineSync()!;

    while (true) {
      print("Contact Number: ");
      String c = stdin.readLineSync()!;

      if (contacts.contains(c)) {
        print('Contact "$c" is already registered. Enter a different number.');
      } else {
        contacts.add(c);
        student['contact'] = c;
        break;
      }
    }

    while (true) {
      print("Age: ");
      String raw = stdin.readLineSync()!;

      int? age = int.tryParse(raw);

      if (age == null || age <= 0) {
        print('Age must be a positive whole number. Try again.');
      } else {
        student['age'] = age;
        break;
      }
    }

    students.add(student);
  }

  print("\nRegistered Students:");

  for (int i = 0; i < students.length; i++) {
    print(
      "Student ${i + 1}: ${students[i]['name']}, Age: ${students[i]['age']}, Contact: ${students[i]['contact']}",
    );
    print("  Details: ${students[i]['details']}");
    print("  Present Address: ${students[i]['presentAddress']}");
    print("  Permanent Address: ${students[i]['permanentAddress']}");
  }
}
