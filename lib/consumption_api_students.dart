import 'package:consumption_api_students/repositories/student_repository.dart';

Future<void> main() async {

  final studentRepository = StudentRepository();

  final students = await studentRepository.searchAll();

  print(students);

  final student = await studentRepository.searchForId(1);

  print(student.name);
  print(student.coursesName);
  print('Courses ADF:');
  for (var course in student.courses) {
    print('${course.name}: ${student.name} is student: ${(course.isStudent ? 'Yes' : 'No')}');  

  }
}
