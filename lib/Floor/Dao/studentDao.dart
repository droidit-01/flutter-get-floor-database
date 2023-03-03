import 'package:floor/floor.dart';
import 'package:tasky/Floor/entity/student.dart';

@dao
abstract class StudentDao {
  @Query('SELECT * FROM Student')
  Stream<List<Student>> getAllStudent();

  @Query('SELECT * FROM Student WHERE id=:id')
  Stream<Student?> getAllStudentById(int id);

  @Query('DELETE FROM Student')
  Future<void> deleteAllStudent();

  @insert
  Future<void> insertStudent(Student student);

  @update
  Future<void> updateStudent(Student student);

  @delete
  Future<void> deleteStudent(Student student);
}
