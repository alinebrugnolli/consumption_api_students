import 'dart:convert';
import 'package:consumption_api_students/models/student.dart';
import 'package:http/http.dart' as http;

class StudentRepository {

  Future<List<Student>> searchAll() async {
    final studentsResponse = await http.get(Uri.parse('http://localhost:8081/students'));

    final studentsList = jsonDecode(studentsResponse.body);

    final allStudents = studentsList.map<Student>((studentMap) {
      return Student.fromMap(studentMap);
    }).toList();

    return allStudents;
    // return studentsList;
    //     .map<Student>((studentMap) => Student.fromMap(studentMap))
    //     .toList():
  }

  Future<Student> searchForId(int id) async {
    final studentsResponse = 
       await http.get(Uri.parse('http://localhost:8081/students/$id'),);

    return Student.fromJson(studentsResponse.body);
  }
}