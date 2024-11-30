import 'package:flutter/material.dart';
import 'fourth.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FirstPage',
      initialRoute: '/',
      routes: {
        '/plus': (context) => const Add2Page(),
      },
    );
  }
}

class Add2Page extends StatefulWidget {
  const Add2Page({super.key});

  @override
  State<Add2Page> createState() => _Add2PageState();
}

class _Add2PageState extends State<Add2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Food Table'),
        actions: const [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: null,
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
                Navigator.pushNamed(context,'/plusadd');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
                textStyle: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              child: const Text('Add Data +'),
            ),
            const SizedBox(height: 16.0),
            DataTable(
              columns: const [
                DataColumn(label: Text('Foto')),
                DataColumn(label: Text('Nama Produk')),
                DataColumn(label: Text('Harga')),
                DataColumn(label: Text('Aksi')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Image.asset('assets/Burger.jpg'),
                    ),
                    const DataCell(Text('Burger King Medium')),
                    const DataCell(Text('Rp.50.000,00')),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Implement delete action
                        },
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Image.asset('assets/TehBotol.jpg'),
                    ),
                    const DataCell(Text('Teh Botol')),
                    const DataCell(Text('Rp.4.000,00')),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Implement delete action
                        },
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Image.asset('assets/Burger.jpg'),
                    ),
                    const DataCell(Text('Burger King Small')),
                    const DataCell(Text('Rp.35.000,00')),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Implement delete action
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
