import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_akhir/models/database.dart';
import 'package:projek_akhir/models/transaction_with_category.dart';
import 'package:projek_akhir/pages/transaction_page.dart';

class HalamanHome extends StatefulWidget {
  final DateTime selectedDate;
  const HalamanHome({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<HalamanHome> createState() => _HalamanHomeState();
}

class _HalamanHomeState extends State<HalamanHome> {
  final AppDatabase database = AppDatabase();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard total pengeluaran dan pengeluaran
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Pemasukan
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.download,
                              color: Color.fromARGB(255, 241, 155, 210)),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pemasukan",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black87, fontSize: 12),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black87, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Pengeluaran
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.upload,
                              color: Color.fromARGB(255, 241, 155, 155)),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pengeluaran",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black87, fontSize: 12),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black87, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Teks transaksi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Transaksi",
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),

            // List transaksi
            StreamBuilder<List<TransactionWithCategory>>(
              stream: database.getTransactionByDateRepo(widget.selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data!.length > 0) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Card(
                              elevation: 10,
                              child: ListTile(
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        await database.deleteTransactionRepo(snapshot.data![index].transaction.id);
                                        setState(() {});
                                      },
                                    ),
                                    SizedBox(width: 10),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => 
                                            TransactionPage(
                                              transactionWithCategory: snapshot.data![
                                                index]),
                                          ))
                                          .then((value) {});
                                      },
                                    ),
                                  ],
                                ),
                                title: Text("Rp. " + snapshot.data![index].transaction.amount.toString()),
                                subtitle: Text(snapshot.data![index].category.name),
                                leading: Container(
                                  padding: EdgeInsets.all(3),
                                  child: (snapshot.data![index].category.type == 1)
                                      ? Icon(Icons.download, color: Color.fromARGB(255, 241, 155, 210))
                                      : Icon(Icons.upload, color: Color.fromARGB(255, 241, 155, 155)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Text(
                              "Belum ada Transaksi",
                              style: GoogleFonts.montserrat(),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: Text("Belum ada transaksi"),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
