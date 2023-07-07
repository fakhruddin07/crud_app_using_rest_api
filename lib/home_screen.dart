import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD App Using REST API"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.image,
              size: 32,
            ),
            title: Text("Product Name"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Code"),
                Text("Total Price"),
                Text("Available Unit"),
              ],
            ),
            trailing: Text("Unit Price"),
          );
        },
      ),
    );
  }
}
