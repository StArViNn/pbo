import 'package:flutter/material.dart';
import 'fifth.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirstPage',
      initialRoute: '/',
      routes: {
        '/plusadd': (context) => const Add2Page(),
      },
    );
  }
}

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  List<Product> products = [
    Product(
        name: 'Burger King Medium',
        description: 'A delicious burger',
        price: 'Rp. 50.000,00',
        imagePath: 'assets/Burger.jpg'),
    Product(
        name: 'Teh Botol',
        description: 'Refreshing bottled tea',
        price: 'Rp. 4.000,00',
        imagePath: 'assets/Tehbotol.jpg'),
  ];

  void _editProduct(int index) {
    showDialog(
      context: context,
      builder: (context) {
        final nameController =
            TextEditingController(text: products[index].name);
        final descriptionController =
            TextEditingController(text: products[index].description);
        final priceController =
            TextEditingController(text: products[index].price);

        return AlertDialog(
          title: const Text('Edit Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  products[index].name = nameController.text;
                  products[index].description = descriptionController.text;
                  products[index].price = priceController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/plusadd');
              },
              child: const Text('Add Data +'),
            ),
            const SizedBox(height: 16),
            const Text('Products',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DataTable(
              columns: const [
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Deskripsi')),
                DataColumn(label: Text('Harga')),
                DataColumn(label: Text('Aksi')),
              ],
              rows: List<DataRow>.generate(products.length, (index) {
                return DataRow(
                  cells: [
                    DataCell(Text(products[index].name)),
                    DataCell(Text(products[index].description)),
                    DataCell(Text(products[index].price)),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => _editProduct(index),
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => _deleteProduct(index),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  String name;
  String description;
  String price;
  String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
