import 'dart:convert';
import 'package:consumption_api_students/models/address.dart';
import 'package:consumption_api_students/models/course.dart';

class Student {
  int id;
  String name;
  int? age;
  List<String> coursesName;
  List<Course> courses;
  Address address;
  Student({
    required this.id,
    required this.name,
    this.age,
    required this.coursesName,
    required this.courses,
    required this.address,
  });

  // Serealização
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'coursesName': coursesName,
      'courses': courses.map((course) => course.toMap()).toList(),
      'address': address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }
    return map;
  }

  String toJson() => jsonEncode(toMap());

  // Desserealização:
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'],
      //! List<dynamic> não é uma lista de List<String>
      coursesName: List<String>.from(map['coursesName'] ?? <String> {}),
      // coursesName: map['coursesName'].cast<String>(),
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
      courses: map['courses']
          ?.map<Course>((courseMap) => Course.fromMap(courseMap))
          .toList() ?? <Course>[],
    );
  }

  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Student: $name($id)';    
  }
}
