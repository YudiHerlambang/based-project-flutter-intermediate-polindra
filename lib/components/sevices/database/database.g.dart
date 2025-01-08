// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoriteClubsTable extends FavoriteClubs
    with TableInfo<$FavoriteClubsTable, FavoriteClub> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteClubsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idTeamMeta = const VerificationMeta('idTeam');
  @override
  late final GeneratedColumn<String> idTeam = GeneratedColumn<String>(
      'id_team', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strTeamMeta =
      const VerificationMeta('strTeam');
  @override
  late final GeneratedColumn<String> strTeam = GeneratedColumn<String>(
      'str_team', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strDescriptionENMeta =
      const VerificationMeta('strDescriptionEN');
  @override
  late final GeneratedColumn<String> strDescriptionEN = GeneratedColumn<String>(
      'str_description_e_n', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strBadgeMeta =
      const VerificationMeta('strBadge');
  @override
  late final GeneratedColumn<String> strBadge = GeneratedColumn<String>(
      'str_badge', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _strStadiumMeta =
      const VerificationMeta('strStadium');
  @override
  late final GeneratedColumn<String> strStadium = GeneratedColumn<String>(
      'str_stadium', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idTeam, strTeam, strDescriptionEN, strBadge, strStadium, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_clubs';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteClub> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_team')) {
      context.handle(_idTeamMeta,
          idTeam.isAcceptableOrUnknown(data['id_team']!, _idTeamMeta));
    } else if (isInserting) {
      context.missing(_idTeamMeta);
    }
    if (data.containsKey('str_team')) {
      context.handle(_strTeamMeta,
          strTeam.isAcceptableOrUnknown(data['str_team']!, _strTeamMeta));
    } else if (isInserting) {
      context.missing(_strTeamMeta);
    }
    if (data.containsKey('str_description_e_n')) {
      context.handle(
          _strDescriptionENMeta,
          strDescriptionEN.isAcceptableOrUnknown(
              data['str_description_e_n']!, _strDescriptionENMeta));
    } else if (isInserting) {
      context.missing(_strDescriptionENMeta);
    }
    if (data.containsKey('str_badge')) {
      context.handle(_strBadgeMeta,
          strBadge.isAcceptableOrUnknown(data['str_badge']!, _strBadgeMeta));
    } else if (isInserting) {
      context.missing(_strBadgeMeta);
    }
    if (data.containsKey('str_stadium')) {
      context.handle(
          _strStadiumMeta,
          strStadium.isAcceptableOrUnknown(
              data['str_stadium']!, _strStadiumMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteClub map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteClub(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idTeam: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_team'])!,
      strTeam: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_team'])!,
      strDescriptionEN: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}str_description_e_n'])!,
      strBadge: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_badge'])!,
      strStadium: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}str_stadium']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $FavoriteClubsTable createAlias(String alias) {
    return $FavoriteClubsTable(attachedDatabase, alias);
  }
}

class FavoriteClub extends DataClass implements Insertable<FavoriteClub> {
  final int id;
  final String idTeam;
  final String strTeam;
  final String strDescriptionEN;
  final String strBadge;
  final String? strStadium;
  final DateTime? createdAt;
  const FavoriteClub(
      {required this.id,
      required this.idTeam,
      required this.strTeam,
      required this.strDescriptionEN,
      required this.strBadge,
      this.strStadium,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_team'] = Variable<String>(idTeam);
    map['str_team'] = Variable<String>(strTeam);
    map['str_description_e_n'] = Variable<String>(strDescriptionEN);
    map['str_badge'] = Variable<String>(strBadge);
    if (!nullToAbsent || strStadium != null) {
      map['str_stadium'] = Variable<String>(strStadium);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  FavoriteClubsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteClubsCompanion(
      id: Value(id),
      idTeam: Value(idTeam),
      strTeam: Value(strTeam),
      strDescriptionEN: Value(strDescriptionEN),
      strBadge: Value(strBadge),
      strStadium: strStadium == null && nullToAbsent
          ? const Value.absent()
          : Value(strStadium),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory FavoriteClub.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteClub(
      id: serializer.fromJson<int>(json['id']),
      idTeam: serializer.fromJson<String>(json['idTeam']),
      strTeam: serializer.fromJson<String>(json['strTeam']),
      strDescriptionEN: serializer.fromJson<String>(json['strDescriptionEN']),
      strBadge: serializer.fromJson<String>(json['strBadge']),
      strStadium: serializer.fromJson<String?>(json['strStadium']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idTeam': serializer.toJson<String>(idTeam),
      'strTeam': serializer.toJson<String>(strTeam),
      'strDescriptionEN': serializer.toJson<String>(strDescriptionEN),
      'strBadge': serializer.toJson<String>(strBadge),
      'strStadium': serializer.toJson<String?>(strStadium),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  FavoriteClub copyWith(
          {int? id,
          String? idTeam,
          String? strTeam,
          String? strDescriptionEN,
          String? strBadge,
          Value<String?> strStadium = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent()}) =>
      FavoriteClub(
        id: id ?? this.id,
        idTeam: idTeam ?? this.idTeam,
        strTeam: strTeam ?? this.strTeam,
        strDescriptionEN: strDescriptionEN ?? this.strDescriptionEN,
        strBadge: strBadge ?? this.strBadge,
        strStadium: strStadium.present ? strStadium.value : this.strStadium,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  FavoriteClub copyWithCompanion(FavoriteClubsCompanion data) {
    return FavoriteClub(
      id: data.id.present ? data.id.value : this.id,
      idTeam: data.idTeam.present ? data.idTeam.value : this.idTeam,
      strTeam: data.strTeam.present ? data.strTeam.value : this.strTeam,
      strDescriptionEN: data.strDescriptionEN.present
          ? data.strDescriptionEN.value
          : this.strDescriptionEN,
      strBadge: data.strBadge.present ? data.strBadge.value : this.strBadge,
      strStadium:
          data.strStadium.present ? data.strStadium.value : this.strStadium,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteClub(')
          ..write('id: $id, ')
          ..write('idTeam: $idTeam, ')
          ..write('strTeam: $strTeam, ')
          ..write('strDescriptionEN: $strDescriptionEN, ')
          ..write('strBadge: $strBadge, ')
          ..write('strStadium: $strStadium, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, idTeam, strTeam, strDescriptionEN, strBadge, strStadium, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteClub &&
          other.id == this.id &&
          other.idTeam == this.idTeam &&
          other.strTeam == this.strTeam &&
          other.strDescriptionEN == this.strDescriptionEN &&
          other.strBadge == this.strBadge &&
          other.strStadium == this.strStadium &&
          other.createdAt == this.createdAt);
}

class FavoriteClubsCompanion extends UpdateCompanion<FavoriteClub> {
  final Value<int> id;
  final Value<String> idTeam;
  final Value<String> strTeam;
  final Value<String> strDescriptionEN;
  final Value<String> strBadge;
  final Value<String?> strStadium;
  final Value<DateTime?> createdAt;
  const FavoriteClubsCompanion({
    this.id = const Value.absent(),
    this.idTeam = const Value.absent(),
    this.strTeam = const Value.absent(),
    this.strDescriptionEN = const Value.absent(),
    this.strBadge = const Value.absent(),
    this.strStadium = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoriteClubsCompanion.insert({
    this.id = const Value.absent(),
    required String idTeam,
    required String strTeam,
    required String strDescriptionEN,
    required String strBadge,
    this.strStadium = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : idTeam = Value(idTeam),
        strTeam = Value(strTeam),
        strDescriptionEN = Value(strDescriptionEN),
        strBadge = Value(strBadge);
  static Insertable<FavoriteClub> custom({
    Expression<int>? id,
    Expression<String>? idTeam,
    Expression<String>? strTeam,
    Expression<String>? strDescriptionEN,
    Expression<String>? strBadge,
    Expression<String>? strStadium,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idTeam != null) 'id_team': idTeam,
      if (strTeam != null) 'str_team': strTeam,
      if (strDescriptionEN != null) 'str_description_e_n': strDescriptionEN,
      if (strBadge != null) 'str_badge': strBadge,
      if (strStadium != null) 'str_stadium': strStadium,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoriteClubsCompanion copyWith(
      {Value<int>? id,
      Value<String>? idTeam,
      Value<String>? strTeam,
      Value<String>? strDescriptionEN,
      Value<String>? strBadge,
      Value<String?>? strStadium,
      Value<DateTime?>? createdAt}) {
    return FavoriteClubsCompanion(
      id: id ?? this.id,
      idTeam: idTeam ?? this.idTeam,
      strTeam: strTeam ?? this.strTeam,
      strDescriptionEN: strDescriptionEN ?? this.strDescriptionEN,
      strBadge: strBadge ?? this.strBadge,
      strStadium: strStadium ?? this.strStadium,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idTeam.present) {
      map['id_team'] = Variable<String>(idTeam.value);
    }
    if (strTeam.present) {
      map['str_team'] = Variable<String>(strTeam.value);
    }
    if (strDescriptionEN.present) {
      map['str_description_e_n'] = Variable<String>(strDescriptionEN.value);
    }
    if (strBadge.present) {
      map['str_badge'] = Variable<String>(strBadge.value);
    }
    if (strStadium.present) {
      map['str_stadium'] = Variable<String>(strStadium.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteClubsCompanion(')
          ..write('id: $id, ')
          ..write('idTeam: $idTeam, ')
          ..write('strTeam: $strTeam, ')
          ..write('strDescriptionEN: $strDescriptionEN, ')
          ..write('strBadge: $strBadge, ')
          ..write('strStadium: $strStadium, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteClubsTable favoriteClubs = $FavoriteClubsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteClubs];
}

typedef $$FavoriteClubsTableCreateCompanionBuilder = FavoriteClubsCompanion
    Function({
  Value<int> id,
  required String idTeam,
  required String strTeam,
  required String strDescriptionEN,
  required String strBadge,
  Value<String?> strStadium,
  Value<DateTime?> createdAt,
});
typedef $$FavoriteClubsTableUpdateCompanionBuilder = FavoriteClubsCompanion
    Function({
  Value<int> id,
  Value<String> idTeam,
  Value<String> strTeam,
  Value<String> strDescriptionEN,
  Value<String> strBadge,
  Value<String?> strStadium,
  Value<DateTime?> createdAt,
});

class $$FavoriteClubsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteClubsTable> {
  $$FavoriteClubsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get idTeam => $composableBuilder(
      column: $table.idTeam, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strTeam => $composableBuilder(
      column: $table.strTeam, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strDescriptionEN => $composableBuilder(
      column: $table.strDescriptionEN,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strBadge => $composableBuilder(
      column: $table.strBadge, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get strStadium => $composableBuilder(
      column: $table.strStadium, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$FavoriteClubsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteClubsTable> {
  $$FavoriteClubsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get idTeam => $composableBuilder(
      column: $table.idTeam, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strTeam => $composableBuilder(
      column: $table.strTeam, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strDescriptionEN => $composableBuilder(
      column: $table.strDescriptionEN,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strBadge => $composableBuilder(
      column: $table.strBadge, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get strStadium => $composableBuilder(
      column: $table.strStadium, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$FavoriteClubsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteClubsTable> {
  $$FavoriteClubsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get idTeam =>
      $composableBuilder(column: $table.idTeam, builder: (column) => column);

  GeneratedColumn<String> get strTeam =>
      $composableBuilder(column: $table.strTeam, builder: (column) => column);

  GeneratedColumn<String> get strDescriptionEN => $composableBuilder(
      column: $table.strDescriptionEN, builder: (column) => column);

  GeneratedColumn<String> get strBadge =>
      $composableBuilder(column: $table.strBadge, builder: (column) => column);

  GeneratedColumn<String> get strStadium => $composableBuilder(
      column: $table.strStadium, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoriteClubsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteClubsTable,
    FavoriteClub,
    $$FavoriteClubsTableFilterComposer,
    $$FavoriteClubsTableOrderingComposer,
    $$FavoriteClubsTableAnnotationComposer,
    $$FavoriteClubsTableCreateCompanionBuilder,
    $$FavoriteClubsTableUpdateCompanionBuilder,
    (
      FavoriteClub,
      BaseReferences<_$AppDatabase, $FavoriteClubsTable, FavoriteClub>
    ),
    FavoriteClub,
    PrefetchHooks Function()> {
  $$FavoriteClubsTableTableManager(_$AppDatabase db, $FavoriteClubsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteClubsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteClubsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteClubsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> idTeam = const Value.absent(),
            Value<String> strTeam = const Value.absent(),
            Value<String> strDescriptionEN = const Value.absent(),
            Value<String> strBadge = const Value.absent(),
            Value<String?> strStadium = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              FavoriteClubsCompanion(
            id: id,
            idTeam: idTeam,
            strTeam: strTeam,
            strDescriptionEN: strDescriptionEN,
            strBadge: strBadge,
            strStadium: strStadium,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String idTeam,
            required String strTeam,
            required String strDescriptionEN,
            required String strBadge,
            Value<String?> strStadium = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              FavoriteClubsCompanion.insert(
            id: id,
            idTeam: idTeam,
            strTeam: strTeam,
            strDescriptionEN: strDescriptionEN,
            strBadge: strBadge,
            strStadium: strStadium,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoriteClubsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoriteClubsTable,
    FavoriteClub,
    $$FavoriteClubsTableFilterComposer,
    $$FavoriteClubsTableOrderingComposer,
    $$FavoriteClubsTableAnnotationComposer,
    $$FavoriteClubsTableCreateCompanionBuilder,
    $$FavoriteClubsTableUpdateCompanionBuilder,
    (
      FavoriteClub,
      BaseReferences<_$AppDatabase, $FavoriteClubsTable, FavoriteClub>
    ),
    FavoriteClub,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteClubsTableTableManager get favoriteClubs =>
      $$FavoriteClubsTableTableManager(_db, _db.favoriteClubs);
}
