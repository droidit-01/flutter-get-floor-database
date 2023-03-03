import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tasky/Floor/Dao/studentDao.dart';
import 'package:tasky/database/database.dart';

import 'package:tasky/screens/home_screen.dart';

import 'Floor/entity/student.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder('edmt.database.db').build();
  final dao = database.studentDao;
  runApp(MyApp(dao));
}

class MyApp extends StatelessWidget {
  final StudentDao dao;
  MyApp(this.dao);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: 'Tasky',
      home: HomeScreen(dao: dao),
    );
  }
}
