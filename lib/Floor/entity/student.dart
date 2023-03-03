import 'package:flutter/material.dart';
import 'package:floor/floor.dart';
import 'package:get/get.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  final int id;
  String name, email;
  int percentge;

  Student(
      {required this.id,
      required this.name,
      required this.email,
      required this.percentge});
}
