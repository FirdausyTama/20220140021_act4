import 'package:flutter/material.dart';

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

  void calculateTotalPrice(){
    int jumlahMakanan = int.tryParse(jualMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jualMinumanController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 5000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}