import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanKategori extends StatefulWidget {
  const HalamanKategori({super.key});

  @override
  State<HalamanKategori> createState() => _HalamanKategoriState();
}

class _HalamanKategoriState extends State<HalamanKategori> {
  bool isExpense = true;

  void openDialog(){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          content: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    (isExpense) ? "Add Expense" : "Add Income",
                    style: GoogleFonts.montserrat(fontSize: 18,
                    color: (isExpense) ? Colors.pink : Color.fromARGB(255, 188, 145, 160)),
                    ),
                    SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nama"
                      ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: (){}, 
                  child: Text(
                    "Simpan",
                  
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  (isExpense) ? Colors.pink[200] : Color.fromARGB(255, 188, 145, 160), 
                    foregroundColor: Colors.white
                  ),),
                ],),),
          ),

        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        //tombol beralih pemasukan/pengeluaran
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Switch(
                  value: isExpense,
                  onChanged: (bool value){
                    setState(() {
                      isExpense = value;
                    });
                  },
              inactiveTrackColor: Color.fromARGB(255, 188, 145, 160),
              inactiveThumbColor: Colors.pink,
              activeColor: Colors.pink,
              
              ),
              IconButton(onPressed: (){
                openDialog();
              }, 
              icon: Icon(Icons.add))
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: (isExpense) ? Icon(Icons.upload, color: Colors.pink) : Icon(Icons.download, color: Color.fromARGB(255, 188, 145, 160)),
                title: Text(
                  "Infak",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    ],
                  ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: (isExpense) ? Icon(Icons.upload, color: Colors.pink) : Icon(Icons.download, color: Color.fromARGB(255, 188, 145, 160)),
                title: Text(
                  "Infak",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    ],
                  ),
              ),
            ),
          ),

        ],
      ));
  }
}