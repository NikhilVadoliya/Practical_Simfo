// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_table.dart';

// ignore_for_file: type=lint
class $UserLocalTable extends UserLocal
    with TableInfo<$UserLocalTable, UserLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [gender, email, phone, name];
  @override
  String get aliasedName => _alias ?? 'user_local';
  @override
  String get actualTableName => 'user_local';
  @override
  VerificationContext validateIntegrity(Insertable<UserLocalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLocalData(
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $UserLocalTable createAlias(String alias) {
    return $UserLocalTable(attachedDatabase, alias);
  }
}

class UserLocalData extends DataClass implements Insertable<UserLocalData> {
  final String gender;
  final String email;
  final String phone;
  final String name;
  const UserLocalData(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['gender'] = Variable<String>(gender);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['name'] = Variable<String>(name);
    return map;
  }

  UserLocalCompanion toCompanion(bool nullToAbsent) {
    return UserLocalCompanion(
      gender: Value(gender),
      email: Value(email),
      phone: Value(phone),
      name: Value(name),
    );
  }

  factory UserLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserLocalData(
      gender: serializer.fromJson<String>(json['gender']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gender': serializer.toJson<String>(gender),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'name': serializer.toJson<String>(name),
    };
  }

  UserLocalData copyWith(
          {String? gender, String? email, String? phone, String? name}) =>
      UserLocalData(
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('UserLocalData(')
          ..write('gender: $gender, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(gender, email, phone, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserLocalData &&
          other.gender == this.gender &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.name == this.name);
}

class UserLocalCompanion extends UpdateCompanion<UserLocalData> {
  final Value<String> gender;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> name;
  final Value<int> rowid;
  const UserLocalCompanion({
    this.gender = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserLocalCompanion.insert({
    required String gender,
    required String email,
    required String phone,
    required String name,
    this.rowid = const Value.absent(),
  })  : gender = Value(gender),
        email = Value(email),
        phone = Value(phone),
        name = Value(name);
  static Insertable<UserLocalData> custom({
    Expression<String>? gender,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (gender != null) 'gender': gender,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserLocalCompanion copyWith(
      {Value<String>? gender,
      Value<String>? email,
      Value<String>? phone,
      Value<String>? name,
      Value<int>? rowid}) {
    return UserLocalCompanion(
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLocalCompanion(')
          ..write('gender: $gender, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UserLocalTable userLocal = $UserLocalTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userLocal];
}
