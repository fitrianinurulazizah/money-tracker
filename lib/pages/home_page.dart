import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanHome extends StatefulWidget {
  const HalamanHome({super.key});

  @override
  State<HalamanHome> createState() => _HalamanHomeState();
}

class _HalamanHomeState extends State<HalamanHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //bisa di scroll
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //dashboard total pengeluaran dan pengeluaran
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.download,
                                color: Color.fromARGB(255, 241, 155, 210)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, //biar mulai di seblah kiri
                            children: [
                              Text(
                                "Pemasukan",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black87, fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Rp. 3.800.000",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black87, fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.upload,
                                color: Color.fromARGB(255, 241, 155, 155)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, //biar mulai di seblah kiri
                            children: [
                              Text(
                                "Pengeluaran",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black87, fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Rp. 3.800.000",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black87, fontSize: 14),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(15))),
            ),

            //teks transaksi
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Transaksi",
                style: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),

            //list transaksi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 5,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, //posisi gara di sebelah kiri
                    children: [
                      Icon(Icons.upload),
                      SizedBox(width: 10),
                      Icon(Icons.edit)
                    ],
                  ),
                  title: Text("Rp. 20.000"),
                  subtitle: Text("Makan Sore"),
                  leading: Container(
                    child: Icon(Icons.download,
                        color: Color.fromARGB(255, 241, 155, 210)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 5,
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, //posisi gara di sebelah kiri
                    children: [
                      Icon(Icons.upload),
                      SizedBox(width: 10),
                      Icon(Icons.edit)
                    ],
                  ),
                  title: Text("Rp. 20.000"),
                  subtitle: Text("Gaji Bulanan"),
                  leading: Container(
                    child: Icon(Icons.download,
                        color: Color.fromARGB(255, 241, 155, 210)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
