import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text("Add Transaction")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [],
            )),),
    );
  }
}