import 'package:projek_akhir/models/database.dart';
import 'package:projek_akhir/models/transaction.dart';

class TransactionWithCategory{
  final Transaction transaction;
  final Category category;
  TransactionWithCategory(this.transaction, this.category);
}