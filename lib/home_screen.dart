import 'dart:convert';

import 'package:crud_app_using_rest_api/product.dart';
import 'package:flutter/material.dart';
import 'add_new_product_screen.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    inProgress = true;
    if(mounted) {
      setState(() {});
    }

    Response response =
        await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));

    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 && decodedResponse["status"] == "success") {
      for (var e in decodedResponse["data"]) {
        products.add(Product.toJson(e));
      }
    }
    inProgress = false;
    if(mounted) {
      setState(() {});
    }
  }

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
      body: inProgress ? const Center(child: CircularProgressIndicator(),) : ListView.separated(
        itemCount: products.length,
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
              products[index].productImage,
              width: 50,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.image,
                  size: 32,
                );
              },
            ),
            title: Text(products[index].productName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Code: ${products[index].productCode}"),
                Text("Total Price: ${products[index].totalPrice}"),
                Text("Available Unit: ${products[index].quantity}"),
              ],
            ),
            trailing: Text("${products[index].unitPrice}/p"),
          );
        },
      ),
    );
  }
}
