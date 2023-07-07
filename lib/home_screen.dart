import 'package:crud_app_using_rest_api/add_new_product_screen.dart';
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewProductScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.only(left: 16),
                    contentPadding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    title: Row(
                      children: [
                        const Text("Choose an Option"),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.edit),
                          title: const Text("Edit"),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.delete),
                          title: const Text("Delete"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            leading: Image.network(
              "https://www.bhphotovideo.com/images/images2500x2500/Apple_Z0GP_0002_17_MacBook_Pro_Notebook_685887.jpg",
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.image,
                  size: 32,
                );
              },
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
