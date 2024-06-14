// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _TypeMeta = const VerificationMeta('Type');
  @override
  late final GeneratedColumn<int> Type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateAtMeta =
      const VerificationMeta('updateAt');
  @override
  late final GeneratedColumn<DateTime> updateAt = GeneratedColumn<DateTime>(
      'update_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, Type, createdAt, updateAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _TypeMeta, Type.isAcceptableOrUnknown(data['type']!, _TypeMeta));
    } else if (isInserting) {
      context.missing(_TypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      Type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updateAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int Type;
  final DateTime createdAt;
  final DateTime updateAt;
  final DateTime? deletedAt;
  const Category(
      {required this.id,
      required this.name,
      required this.Type,
      required this.createdAt,
      required this.updateAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<int>(Type);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      Type: Value(Type),
      createdAt: Value(createdAt),
      updateAt: Value(updateAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      Type: serializer.fromJson<int>(json['Type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'Type': serializer.toJson<int>(Type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Category copyWith(
          {int? id,
          String? name,
          int? Type,
          DateTime? createdAt,
          DateTime? updateAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        Type: Type ?? this.Type,
        createdAt: createdAt ?? this.createdAt,
        updateAt: updateAt ?? this.updateAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('Type: $Type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, Type, createdAt, updateAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.Type == this.Type &&
          other.createdAt == this.createdAt &&
          other.updateAt == this.updateAt &&
          other.deletedAt == this.deletedAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> Type;
  final Value<DateTime> createdAt;
  final Value<DateTime> updateAt;
  final Value<DateTime?> deletedAt;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.Type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updateAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int Type,
    required DateTime createdAt,
    required DateTime updateAt,
    this.deletedAt = const Value.absent(),
  })  : name = Value(name),
        Type = Value(Type),
        createdAt = Value(createdAt),
        updateAt = Value(updateAt);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? Type,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updateAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (Type != null) 'type': Type,
      if (createdAt != null) 'created_at': createdAt,
      if (updateAt != null) 'update_at': updateAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? Type,
      Value<DateTime>? createdAt,
      Value<DateTime>? updateAt,
      Value<DateTime?>? deletedAt}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      Type: Type ?? this.Type,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (Type.present) {
      map['type'] = Variable<int>(Type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('Type: $Type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionTable extends Transaction
    with TableInfo<$TransactionTable, TransactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 128),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _category_idMeta =
      const VerificationMeta('category_id');
  @override
  late final GeneratedColumn<int> category_id = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _transaction_dateMeta =
      const VerificationMeta('transaction_date');
  @override
  late final GeneratedColumn<DateTime> transaction_date =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updateAtMeta =
      const VerificationMeta('updateAt');
  @override
  late final GeneratedColumn<DateTime> updateAt = GeneratedColumn<DateTime>(
      'update_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        category_id,
        transaction_date,
        amount,
        createdAt,
        updateAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _category_idMeta,
          category_id.isAcceptableOrUnknown(
              data['category_id']!, _category_idMeta));
    } else if (isInserting) {
      context.missing(_category_idMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transaction_dateMeta,
          transaction_date.isAcceptableOrUnknown(
              data['transaction_date']!, _transaction_dateMeta));
    } else if (isInserting) {
      context.missing(_transaction_dateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      transaction_date: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updateAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TransactionTable createAlias(String alias) {
    return $TransactionTable(attachedDatabase, alias);
  }
}

class TransactionData extends DataClass implements Insertable<TransactionData> {
  final int id;
  final String name;
  final int category_id;
  final DateTime transaction_date;
  final int amount;
  final DateTime createdAt;
  final DateTime updateAt;
  final DateTime? deletedAt;
  const TransactionData(
      {required this.id,
      required this.name,
      required this.category_id,
      required this.transaction_date,
      required this.amount,
      required this.createdAt,
      required this.updateAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<int>(category_id);
    map['transaction_date'] = Variable<DateTime>(transaction_date);
    map['amount'] = Variable<int>(amount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TransactionCompanion toCompanion(bool nullToAbsent) {
    return TransactionCompanion(
      id: Value(id),
      name: Value(name),
      category_id: Value(category_id),
      transaction_date: Value(transaction_date),
      amount: Value(amount),
      createdAt: Value(createdAt),
      updateAt: Value(updateAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category_id: serializer.fromJson<int>(json['category_id']),
      transaction_date: serializer.fromJson<DateTime>(json['transaction_date']),
      amount: serializer.fromJson<int>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category_id': serializer.toJson<int>(category_id),
      'transaction_date': serializer.toJson<DateTime>(transaction_date),
      'amount': serializer.toJson<int>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TransactionData copyWith(
          {int? id,
          String? name,
          int? category_id,
          DateTime? transaction_date,
          int? amount,
          DateTime? createdAt,
          DateTime? updateAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TransactionData(
        id: id ?? this.id,
        name: name ?? this.name,
        category_id: category_id ?? this.category_id,
        transaction_date: transaction_date ?? this.transaction_date,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
        updateAt: updateAt ?? this.updateAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category_id: $category_id, ')
          ..write('transaction_date: $transaction_date, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, category_id, transaction_date,
      amount, createdAt, updateAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionData &&
          other.id == this.id &&
          other.name == this.name &&
          other.category_id == this.category_id &&
          other.transaction_date == this.transaction_date &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt &&
          other.updateAt == this.updateAt &&
          other.deletedAt == this.deletedAt);
}

class TransactionCompanion extends UpdateCompanion<TransactionData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> category_id;
  final Value<DateTime> transaction_date;
  final Value<int> amount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updateAt;
  final Value<DateTime?> deletedAt;
  const TransactionCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category_id = const Value.absent(),
    this.transaction_date = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updateAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  TransactionCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int category_id,
    required DateTime transaction_date,
    required int amount,
    required DateTime createdAt,
    required DateTime updateAt,
    this.deletedAt = const Value.absent(),
  })  : name = Value(name),
        category_id = Value(category_id),
        transaction_date = Value(transaction_date),
        amount = Value(amount),
        createdAt = Value(createdAt),
        updateAt = Value(updateAt);
  static Insertable<TransactionData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? category_id,
    Expression<DateTime>? transaction_date,
    Expression<int>? amount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updateAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category_id != null) 'category_id': category_id,
      if (transaction_date != null) 'transaction_date': transaction_date,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (updateAt != null) 'update_at': updateAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  TransactionCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? category_id,
      Value<DateTime>? transaction_date,
      Value<int>? amount,
      Value<DateTime>? createdAt,
      Value<DateTime>? updateAt,
      Value<DateTime?>? deletedAt}) {
    return TransactionCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category_id: category_id ?? this.category_id,
      transaction_date: transaction_date ?? this.transaction_date,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category_id.present) {
      map['category_id'] = Variable<int>(category_id.value);
    }
    if (transaction_date.present) {
      map['transaction_date'] = Variable<DateTime>(transaction_date.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category_id: $category_id, ')
          ..write('transaction_date: $transaction_date, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TransactionTable Transaction = $TransactionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories, Transaction];
}

typedef $$CategoriesTableInsertCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  required int Type,
  required DateTime createdAt,
  required DateTime updateAt,
  Value<DateTime?> deletedAt,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> Type,
  Value<DateTime> createdAt,
  Value<DateTime> updateAt,
  Value<DateTime?> deletedAt,
});

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableProcessedTableManager,
    $$CategoriesTableInsertCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoriesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CategoriesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> Type = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updateAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            Type: Type,
            createdAt: createdAt,
            updateAt: updateAt,
            deletedAt: deletedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int Type,
            required DateTime createdAt,
            required DateTime updateAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            Type: Type,
            createdAt: createdAt,
            updateAt: updateAt,
            deletedAt: deletedAt,
          ),
        ));
}

class $$CategoriesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableProcessedTableManager,
    $$CategoriesTableInsertCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder> {
  $$CategoriesTableProcessedTableManager(super.$state);
}

class $$CategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get Type => $state.composableBuilder(
      column: $state.table.Type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updateAt => $state.composableBuilder(
      column: $state.table.updateAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deletedAt => $state.composableBuilder(
      column: $state.table.deletedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get Type => $state.composableBuilder(
      column: $state.table.Type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updateAt => $state.composableBuilder(
      column: $state.table.updateAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deletedAt => $state.composableBuilder(
      column: $state.table.deletedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TransactionTableInsertCompanionBuilder = TransactionCompanion
    Function({
  Value<int> id,
  required String name,
  required int category_id,
  required DateTime transaction_date,
  required int amount,
  required DateTime createdAt,
  required DateTime updateAt,
  Value<DateTime?> deletedAt,
});
typedef $$TransactionTableUpdateCompanionBuilder = TransactionCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> category_id,
  Value<DateTime> transaction_date,
  Value<int> amount,
  Value<DateTime> createdAt,
  Value<DateTime> updateAt,
  Value<DateTime?> deletedAt,
});

class $$TransactionTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionTable,
    TransactionData,
    $$TransactionTableFilterComposer,
    $$TransactionTableOrderingComposer,
    $$TransactionTableProcessedTableManager,
    $$TransactionTableInsertCompanionBuilder,
    $$TransactionTableUpdateCompanionBuilder> {
  $$TransactionTableTableManager(_$AppDatabase db, $TransactionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransactionTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransactionTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TransactionTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> category_id = const Value.absent(),
            Value<DateTime> transaction_date = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updateAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              TransactionCompanion(
            id: id,
            name: name,
            category_id: category_id,
            transaction_date: transaction_date,
            amount: amount,
            createdAt: createdAt,
            updateAt: updateAt,
            deletedAt: deletedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int category_id,
            required DateTime transaction_date,
            required int amount,
            required DateTime createdAt,
            required DateTime updateAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              TransactionCompanion.insert(
            id: id,
            name: name,
            category_id: category_id,
            transaction_date: transaction_date,
            amount: amount,
            createdAt: createdAt,
            updateAt: updateAt,
            deletedAt: deletedAt,
          ),
        ));
}

class $$TransactionTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TransactionTable,
    TransactionData,
    $$TransactionTableFilterComposer,
    $$TransactionTableOrderingComposer,
    $$TransactionTableProcessedTableManager,
    $$TransactionTableInsertCompanionBuilder,
    $$TransactionTableUpdateCompanionBuilder> {
  $$TransactionTableProcessedTableManager(super.$state);
}

class $$TransactionTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransactionTable> {
  $$TransactionTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get category_id => $state.composableBuilder(
      column: $state.table.category_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get transaction_date => $state.composableBuilder(
      column: $state.table.transaction_date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updateAt => $state.composableBuilder(
      column: $state.table.updateAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deletedAt => $state.composableBuilder(
      column: $state.table.deletedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TransactionTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransactionTable> {
  $$TransactionTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get category_id => $state.composableBuilder(
      column: $state.table.category_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get transaction_date => $state.composableBuilder(
      column: $state.table.transaction_date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updateAt => $state.composableBuilder(
      column: $state.table.updateAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deletedAt => $state.composableBuilder(
      column: $state.table.deletedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$TransactionTableTableManager get transaction =>
      $$TransactionTableTableManager(_db, _db.Transaction);
}
