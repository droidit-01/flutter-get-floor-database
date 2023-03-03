import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('WishList')),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: Colors.blue[200],
            child: ListTile(
              title: const Text('name'),
              subtitle: const Text('sub title'),
              trailing: IconButton(
                onPressed: () async {
                  var listStudent;
                  final deleteStudent = listStudent[index];
                },
                icon: const Icon(Icons.close),
              ),
            ),
          );
        },
      ),
    );
  }
}
