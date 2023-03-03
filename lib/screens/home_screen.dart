import 'dart:math';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasky/Floor/Dao/studentDao.dart';
import 'package:tasky/Floor/entity/student.dart';
import 'package:tasky/screens/wish_list_screen.dart';
import 'package:faker/faker.dart';

class HomeScreen extends StatefulWidget {
  final StudentDao dao;

  const HomeScreen({super.key, required this.dao});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Center(child: Text('Tasky')),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF171717),
              ),
              height: 80,
              width: 300,
              alignment: Alignment.center,
              child: const Text(
                'Wish List',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WishListScreen())),
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(
              onPressed: () async {
                final student = Student(
                  id: faker.randomGenerator.integer(100),
                  name: faker.person.name(),
                  email: faker.internet.email(),
                  percentge: faker.randomGenerator.integer(100, min: 30),
                );
                await widget.dao.insertStudent(student);
              },
              icon: Icon(Icons.add_circle_sharp)),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Obx(
                  () => Text('${snapshot.error}'),
                ),
              );
            } else if (snapshot.hasData) {
              var listStudent = snapshot.data.obs as List<Student>;
              return Expanded(
                child: ListView.builder(
                    itemCount: listStudent != null ? listStudent.length : 0,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        color: Colors.blueGrey,
                        child: ListTile(
                          title: Obx(() => Text(
                                '${listStudent[index].name}, ${listStudent[index].email}',
                                style: TextStyle(color: Colors.white),
                              )),
                          subtitle: Obx(
                            () => Text(
                              '${listStudent[index].percentge}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ],
      ),
    );
  }
}
