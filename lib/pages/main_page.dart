import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projek_akhir/models/database.dart';
import 'package:projek_akhir/pages/home_page.dart';
import 'package:projek_akhir/pages/kategori_page.dart';
import 'package:projek_akhir/pages/transaction_page.dart';

class HalamanMain extends StatefulWidget {
  const HalamanMain({super.key});

  @override
  State<HalamanMain> createState() => _HalamanMainState();
}

class _HalamanMainState extends State<HalamanMain> {
  late DateTime selectedDate;
  late List<Widget> _children;
  late int currentIndex; // index 0 berarti halaman pertama membuka halaman home

  final database = AppDatabase();

  @override
  void initState(){
    updateView(0, DateTime.now());

    super.initState();
  }

  Future<List<Category>> getAllCategory() {
    return database.select(database.categories).get();
  }

  void showAwe() async{
    List<Category> al = await getAllCategory();
    print('Panjang : ' +al.length.toString());
  }

  void showSuccess(BuildContext context){
    //set up the button
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed: (){},);


      //set up the alert dialog
      AlertDialog alert = AlertDialog(
    title : Text("My Title"),
    content:  Text("This is my message"),
    actions: [
      okButton,
    ],
  );

  //show the dialog
  showDialog(
    context: context,
    builder : (BuildContext context){
      return alert;
    }
  );
  }
  
  
  void updateView(int index, DateTime? date){
    setState(() {
      if (date != null) {
        selectedDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(date));
      }

      currentIndex = index;
      _children = [
        HalamanHome(selectedDate: selectedDate,),
        HalamanKategori()
      ];
    });
  }

  void onTabTapped(int index){
    setState((){
      selectedDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
      currentIndex = index;
      _children = [
        HalamanHome(selectedDate: selectedDate,),
        HalamanKategori()
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
            .push(MaterialPageRoute(
              builder: (context) => TransactionPage(transactionWithCategory: null,),
              ))
              .then((value){
                setState((){
                  updateView(0, DateTime.now());
                });
              });
          },
          backgroundColor: Color.fromARGB(255, 241, 155, 210),
          child: Icon(Icons.add)
          ),
      ),
          floatingActionButtonLocation: 
          FloatingActionButtonLocation.centerDocked, //button tambah langsung bisa ditaruh dibagian bawah


      //Membuat list navigasi
      bottomNavigationBar: BottomAppBar(
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {
              updateView(0, DateTime.now());
            }, icon: Icon(CupertinoIcons.home)),

            IconButton(onPressed: () {
              updateView(1, null);
            }, icon: Icon(CupertinoIcons.list_bullet)),

            SizedBox(
              width: 20,
            ),
            IconButton(onPressed: () {
              
            }, icon: Icon(CupertinoIcons.heart)),

            IconButton(onPressed: () {
              
            }, icon: Icon(CupertinoIcons.person)),
            ],
        ),
      ),

      body: _children[currentIndex], //memanggil array

      //Memanggil kalender
      appBar: (currentIndex == 1) ? //jika index 0 maka akan menampilkan kalender

      PreferredSize(
        child: Container(
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 36, horizontal: 16),
                  child: Text('Kategori',
              style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
                    ),
              ),
                ),
              // mainAxisAlignment: MainAxisAlignment.center,
              // padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 140),
              
            ),
          ),
        ),
        preferredSize: Size.fromHeight(100),)
        : CalendarAppBar(
        // onDateChanged: (value) => print(value),
        backButton: false,
        accent: Color.fromARGB(255, 241, 155, 210),
        
        locale: 'id', //bahasa
        onDateChanged: (value){
          setState(() {
            selectedDate = value;
            updateView(0, selectedDate);
          });
        },
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      )
    );
  }
}
