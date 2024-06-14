import 'package:drift/drift.dart';

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 128)();
  IntColumn get Type => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updateAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}