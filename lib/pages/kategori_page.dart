import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_akhir/models/database.dart';

class HalamanKategori extends StatefulWidget {
  const HalamanKategori({super.key});

  @override
  State<HalamanKategori> createState() => _HalamanKategoriState();
}

class _HalamanKategoriState extends State<HalamanKategori> {
  bool isExpense = true;
  int? type;
  final AppDatabase database = AppDatabase();
  TextEditingController categoryNameController = TextEditingController();

  Future insert(String name, int type) async {
    DateTime now = DateTime.now();

    final row = await database.into(database.categories).insertReturning(
        CategoriesCompanion.insert(
            name: name, Type: type, createdAt: now, updateAt: now));
    print('Masuk : ' + row.toString()); // dikembalikan ke row
  }

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  Future update(int categoryId, String newName) async {
    return await database.updateCategoryRepo(categoryId, newName);
  }



  void openDialog(Category? category) {
    if(category != null){
      categoryNameController.text = category.name;
    }
  
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      (isExpense) ? "Add Expense" : "Add Income",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: (isExpense)
                              ? Colors.pink
                              : Color.fromARGB(255, 188, 145, 160)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: categoryNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Nama"),
                    ),
                    SizedBox(
                      height: 10,
                    ),


                    ElevatedButton(
                      onPressed: () {
                        if (category == null) {
                          insert(categoryNameController.text, isExpense ? 2 : 1);
                        } else {
                          update(category.id, categoryNameController.text);
                        }
                        
                        //mengclose dialog
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                        setState(() {});
                        categoryNameController.clear(); //mengclaer setelah disimpan
                      },
                      child: Text(
                        "Simpan",
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: (isExpense)
                              ? Colors.pink[200]
                              : Color.fromARGB(255, 188, 145, 160),
                          foregroundColor: Colors.white),
                    ),
                  ],
                ),
              ),
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
                onChanged: (bool value) {
                  setState(() {
                    isExpense = value;
                    type = value ? 2 : 1;
                  });
                },
                inactiveTrackColor: Color.fromARGB(255, 188, 145, 160),
                inactiveThumbColor: Colors.pink,
                activeColor: Colors.pink,
              ),
              IconButton(
                  onPressed: () {
                    openDialog(null);
                  },
                  icon: Icon(Icons.add))
            ],
          ),
        ),
        FutureBuilder<List<Category>>(
          future: getAllCategory(type!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.data!.length > 0) {
                  return ListView.builder(
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
                                    onPressed: () {
                                      database.deleteCategoryRepo(snapshot.data![index].id);
                                      setState(() {
                                        
                                      });
                                    }, icon: Icon(Icons.delete)),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                     icon: Icon(Icons.edit),
                                     onPressed: () {
                                      openDialog(snapshot.data![index]);
                                     },
                                     ),
                              ],
                            ),

                            leading: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: (isExpense)
                                  ? Icon(Icons.upload,
                                      color: Colors.pink)
                                  : Icon(
                                      Icons.download,
                                      color: Color.fromARGB(255, 188, 145, 160),
                                    ),
                            ),
                            title: Text(snapshot.data![index].name),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("No has data"),
                  );
                }
              } else {
                return Center(
                  child: Text("No has data"),
                );
              }
            }
          },
        ),
      ],
    ));
  }
}
