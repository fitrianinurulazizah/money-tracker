import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projek_akhir/models/database.dart';
import 'package:projek_akhir/models/transaction_with_category.dart';

class TransactionPage extends StatefulWidget {
  final TransactionWithCategory? transactionWithCategory;
  const TransactionPage({super.key, required this.transactionWithCategory});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final AppDatabase database = AppDatabase();
  bool isExpense = true;
  late int type;
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  Category? selectedCategory;

  Future insert(
      int amount, DateTime date, String description, int categoryId) async {
    DateTime now = DateTime.now();
    await database
        .into(database.transactions)
        .insertReturning(TransactionsCompanion.insert(
          name: description,
          category_id: categoryId,
          transaction_date: date,
          amount: amount,
          createdAt: now,
          updateAt: now,
        ));
  }

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategoryRepo(type);
  }

  Future update(int transactionId, int amount, int categoryId,
      DateTime transactionDate, String nameDetail) async {
    return await database.updateTransactionRepo(
        transactionId, amount, categoryId, transactionDate, nameDetail);
  }

  @override
  void initState() {
    if (widget.transactionWithCategory != null) {
      updateTransactionView(widget.transactionWithCategory!);
    } else {
      type = 2;
      dateController.text = "";
    }
    super.initState();
  }

  void updateTransactionView(TransactionWithCategory transactionWithCategory) {
    amountController.text = transactionWithCategory.transaction.amount.toString();
    detailController.text = transactionWithCategory.transaction.name;
    dateController.text = DateFormat("yyyy-MM-dd")
        .format(transactionWithCategory.transaction.transaction_date);
    type = transactionWithCategory.category.type;
    isExpense = (type == 2);
    selectedCategory = transactionWithCategory.category;
  }

  void saveTransaction() async {
    if (widget.transactionWithCategory == null) {
      // Insert new transaction
      await insert(
        int.parse(amountController.text),
        DateTime.parse(dateController.text),
        detailController.text,
        selectedCategory!.id,
      );
    } else {
      // Update existing transaction
      await update(
        widget.transactionWithCategory!.transaction.id,
        int.parse(amountController.text),
        selectedCategory!.id,
        DateTime.parse(dateController.text),
        detailController.text,
      );
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Transaction",
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
        backgroundColor: Color.fromARGB(255, 241, 155, 210),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isExpense ? 'Expense' : 'Income',
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                    Switch(
                      value: isExpense,
                      onChanged: (bool value) {
                        setState(() {
                          isExpense = value;
                          type = (isExpense) ? 2 : 1;
                          selectedCategory = null;
                        });
                      },
                      inactiveTrackColor: Color.fromARGB(255, 188, 145, 160),
                      inactiveThumbColor: Colors.pink,
                      activeColor: Colors.pink,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Jumlah",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Kategori',
                    style: GoogleFonts.montserrat(fontSize: 16),
                  ),
                ),
                FutureBuilder<List<Category>>(
                  future: getAllCategory(type),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton<Category>(
                          value: selectedCategory ?? snapshot.data!.first,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_downward),
                          elevation: 16,
                          onChanged: (Category? newValue) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                          },
                          items: snapshot.data!.map((Category value) {
                            return DropdownMenuItem<Category>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return Center(child: Text("Belum ada data kategori"));
                    }
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    readOnly: true,
                    controller: dateController,
                    decoration: InputDecoration(labelText: "Tanggal"),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2099),
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      } else {
                        print("Tanggal Tidak Dipilih");
                      }
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextFormField(
                    controller: detailController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Detail",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: saveTransaction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 241, 155, 210),
                    ),
                    child: Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
