import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projek_akhir/pages/home_page.dart';
import 'package:projek_akhir/pages/kategori_page.dart';

class HalamanMain extends StatefulWidget {
  const HalamanMain({super.key});

  @override
  State<HalamanMain> createState() => _HalamanMainState();
}

class _HalamanMainState extends State<HalamanMain> {
  final List<Widget> _children = [HalamanHome(), HalamanKategori()];
  int currentIndex = 0; // index 0 berarti halaman pertama membuka halaman home

  void onTapTapped(int index){
    setState(() {
      currentIndex = index; //nilai index akan diubah"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Memanggil kalender
      appBar: (currentIndex == 0) ? //jika index 0 maka akan menampilkan kalender
      CalendarAppBar(
        onDateChanged: (value) => print(value),
        backButton: false,
        accent: Color.fromARGB(255, 241, 155, 210),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
        locale: 'id', //bahasa
      )
      :
      PreferredSize(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 140),
            child: Text('Kategori'),
          ),
        ),
        preferredSize: Size.fromHeight(100),),

      body: _children[currentIndex], //memanggil array

      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 241, 155, 210),
          child: Icon(Icons.add)
          ),
          floatingActionButtonLocation: 
          FloatingActionButtonLocation.centerDocked, //button tambah langsung bisa ditaruh dibagian bawah


      //Membuat list navigasi
      bottomNavigationBar: BottomAppBar(
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {
              onTapTapped(0);
            }, icon: Icon(CupertinoIcons.home)),

            IconButton(onPressed: () {
              onTapTapped(1);
            }, icon: Icon(CupertinoIcons.list_bullet)),

            SizedBox(
              width: 20,
            ),
            IconButton(onPressed: () {
              onTapTapped(2);
            }, icon: Icon(CupertinoIcons.heart)),

            IconButton(onPressed: () {
              onTapTapped(3);
            }, icon: Icon(CupertinoIcons.person)),
            ],
        ),
      ),
    );
  }
}
