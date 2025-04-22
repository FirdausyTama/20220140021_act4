import 'package:flutter/material.dart';
import 'package:play_navigation/presentation/detail_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jualMakananController = TextEditingController();
  final TextEditingController jualMinumanController = TextEditingController();
  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jualMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jualMinumanController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 5000);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text('Order Page')),
      body: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          children: [
            TextFormField(
              controller: makananController,
              decoration: const InputDecoration(labelText: 'Food Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your food order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: minumanController,
              decoration: const InputDecoration(labelText: 'Drink Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your drink order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: jualMakananController,
              decoration: const InputDecoration(labelText: 'Food QYT Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your qyt of food order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: jualMinumanController,
              decoration: const InputDecoration(labelText: 'Drink QYT Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your qyt of drink order';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  calculateTotalPrice();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DetailOrderPage(
                            jumlahMakanan: jualMakananController.text,
                            jumlahMinuman: jualMinumanController.text,
                            makanan: makananController.text,
                            minuman: minumanController.text,
                            totalHarga: totalHarga,
                          ),
                    ),
                  );
                }
              },
              child: Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}
