// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LocationTable extends Location
    with TableInfo<$LocationTable, LocationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _location_idMeta = const VerificationMeta(
    'location_id',
  );
  @override
  late final GeneratedColumn<String> location_id = GeneratedColumn<String>(
    'location_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _location_nameMeta = const VerificationMeta(
    'location_name',
  );
  @override
  late final GeneratedColumn<String> location_name = GeneratedColumn<String>(
    'location_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lonMeta = const VerificationMeta('lon');
  @override
  late final GeneratedColumn<double> lon = GeneratedColumn<double>(
    'lon',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _is_defaultMeta = const VerificationMeta(
    'is_default',
  );
  @override
  late final GeneratedColumn<bool> is_default = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _created_atMeta = const VerificationMeta(
    'created_at',
  );
  @override
  late final GeneratedColumn<DateTime> created_at = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    location_id,
    location_name,
    address,
    lat,
    lon,
    is_default,
    created_at,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('location_id')) {
      context.handle(
        _location_idMeta,
        location_id.isAcceptableOrUnknown(
          data['location_id']!,
          _location_idMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_location_idMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
        _location_nameMeta,
        location_name.isAcceptableOrUnknown(
          data['location_name']!,
          _location_nameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_location_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lon')) {
      context.handle(
        _lonMeta,
        lon.isAcceptableOrUnknown(data['lon']!, _lonMeta),
      );
    } else if (isInserting) {
      context.missing(_lonMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _is_defaultMeta,
        is_default.isAcceptableOrUnknown(data['is_default']!, _is_defaultMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _created_atMeta,
        created_at.isAcceptableOrUnknown(data['created_at']!, _created_atMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {location_id};
  @override
  LocationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationData(
      location_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      )!,
      location_name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lon'],
      )!,
      is_default: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
      created_at: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LocationTable createAlias(String alias) {
    return $LocationTable(attachedDatabase, alias);
  }
}

class LocationData extends DataClass implements Insertable<LocationData> {
  final String location_id;
  final String location_name;
  final String address;
  final double lat;
  final double lon;
  final bool is_default;
  final DateTime created_at;
  const LocationData({
    required this.location_id,
    required this.location_name,
    required this.address,
    required this.lat,
    required this.lon,
    required this.is_default,
    required this.created_at,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['location_id'] = Variable<String>(location_id);
    map['location_name'] = Variable<String>(location_name);
    map['address'] = Variable<String>(address);
    map['lat'] = Variable<double>(lat);
    map['lon'] = Variable<double>(lon);
    map['is_default'] = Variable<bool>(is_default);
    map['created_at'] = Variable<DateTime>(created_at);
    return map;
  }

  LocationCompanion toCompanion(bool nullToAbsent) {
    return LocationCompanion(
      location_id: Value(location_id),
      location_name: Value(location_name),
      address: Value(address),
      lat: Value(lat),
      lon: Value(lon),
      is_default: Value(is_default),
      created_at: Value(created_at),
    );
  }

  factory LocationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationData(
      location_id: serializer.fromJson<String>(json['location_id']),
      location_name: serializer.fromJson<String>(json['location_name']),
      address: serializer.fromJson<String>(json['address']),
      lat: serializer.fromJson<double>(json['lat']),
      lon: serializer.fromJson<double>(json['lon']),
      is_default: serializer.fromJson<bool>(json['is_default']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'location_id': serializer.toJson<String>(location_id),
      'location_name': serializer.toJson<String>(location_name),
      'address': serializer.toJson<String>(address),
      'lat': serializer.toJson<double>(lat),
      'lon': serializer.toJson<double>(lon),
      'is_default': serializer.toJson<bool>(is_default),
      'created_at': serializer.toJson<DateTime>(created_at),
    };
  }

  LocationData copyWith({
    String? location_id,
    String? location_name,
    String? address,
    double? lat,
    double? lon,
    bool? is_default,
    DateTime? created_at,
  }) => LocationData(
    location_id: location_id ?? this.location_id,
    location_name: location_name ?? this.location_name,
    address: address ?? this.address,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    is_default: is_default ?? this.is_default,
    created_at: created_at ?? this.created_at,
  );
  LocationData copyWithCompanion(LocationCompanion data) {
    return LocationData(
      location_id: data.location_id.present
          ? data.location_id.value
          : this.location_id,
      location_name: data.location_name.present
          ? data.location_name.value
          : this.location_name,
      address: data.address.present ? data.address.value : this.address,
      lat: data.lat.present ? data.lat.value : this.lat,
      lon: data.lon.present ? data.lon.value : this.lon,
      is_default: data.is_default.present
          ? data.is_default.value
          : this.is_default,
      created_at: data.created_at.present
          ? data.created_at.value
          : this.created_at,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationData(')
          ..write('location_id: $location_id, ')
          ..write('location_name: $location_name, ')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('is_default: $is_default, ')
          ..write('created_at: $created_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    location_id,
    location_name,
    address,
    lat,
    lon,
    is_default,
    created_at,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationData &&
          other.location_id == this.location_id &&
          other.location_name == this.location_name &&
          other.address == this.address &&
          other.lat == this.lat &&
          other.lon == this.lon &&
          other.is_default == this.is_default &&
          other.created_at == this.created_at);
}

class LocationCompanion extends UpdateCompanion<LocationData> {
  final Value<String> location_id;
  final Value<String> location_name;
  final Value<String> address;
  final Value<double> lat;
  final Value<double> lon;
  final Value<bool> is_default;
  final Value<DateTime> created_at;
  final Value<int> rowid;
  const LocationCompanion({
    this.location_id = const Value.absent(),
    this.location_name = const Value.absent(),
    this.address = const Value.absent(),
    this.lat = const Value.absent(),
    this.lon = const Value.absent(),
    this.is_default = const Value.absent(),
    this.created_at = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationCompanion.insert({
    required String location_id,
    required String location_name,
    required String address,
    required double lat,
    required double lon,
    this.is_default = const Value.absent(),
    this.created_at = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : location_id = Value(location_id),
       location_name = Value(location_name),
       address = Value(address),
       lat = Value(lat),
       lon = Value(lon);
  static Insertable<LocationData> custom({
    Expression<String>? location_id,
    Expression<String>? location_name,
    Expression<String>? address,
    Expression<double>? lat,
    Expression<double>? lon,
    Expression<bool>? is_default,
    Expression<DateTime>? created_at,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (location_id != null) 'location_id': location_id,
      if (location_name != null) 'location_name': location_name,
      if (address != null) 'address': address,
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (is_default != null) 'is_default': is_default,
      if (created_at != null) 'created_at': created_at,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationCompanion copyWith({
    Value<String>? location_id,
    Value<String>? location_name,
    Value<String>? address,
    Value<double>? lat,
    Value<double>? lon,
    Value<bool>? is_default,
    Value<DateTime>? created_at,
    Value<int>? rowid,
  }) {
    return LocationCompanion(
      location_id: location_id ?? this.location_id,
      location_name: location_name ?? this.location_name,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      is_default: is_default ?? this.is_default,
      created_at: created_at ?? this.created_at,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (location_id.present) {
      map['location_id'] = Variable<String>(location_id.value);
    }
    if (location_name.present) {
      map['location_name'] = Variable<String>(location_name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lon.present) {
      map['lon'] = Variable<double>(lon.value);
    }
    if (is_default.present) {
      map['is_default'] = Variable<bool>(is_default.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationCompanion(')
          ..write('location_id: $location_id, ')
          ..write('location_name: $location_name, ')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('lon: $lon, ')
          ..write('is_default: $is_default, ')
          ..write('created_at: $created_at, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocationTable location = $LocationTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [location];
}

typedef $$LocationTableCreateCompanionBuilder =
    LocationCompanion Function({
      required String location_id,
      required String location_name,
      required String address,
      required double lat,
      required double lon,
      Value<bool> is_default,
      Value<DateTime> created_at,
      Value<int> rowid,
    });
typedef $$LocationTableUpdateCompanionBuilder =
    LocationCompanion Function({
      Value<String> location_id,
      Value<String> location_name,
      Value<String> address,
      Value<double> lat,
      Value<double> lon,
      Value<bool> is_default,
      Value<DateTime> created_at,
      Value<int> rowid,
    });

class $$LocationTableFilterComposer
    extends Composer<_$AppDatabase, $LocationTable> {
  $$LocationTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get location_id => $composableBuilder(
    column: $table.location_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location_name => $composableBuilder(
    column: $table.location_name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocationTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationTable> {
  $$LocationTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get location_id => $composableBuilder(
    column: $table.location_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location_name => $composableBuilder(
    column: $table.location_name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lon => $composableBuilder(
    column: $table.lon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationTable> {
  $$LocationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get location_id => $composableBuilder(
    column: $table.location_id,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location_name => $composableBuilder(
    column: $table.location_name,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lon =>
      $composableBuilder(column: $table.lon, builder: (column) => column);

  GeneratedColumn<bool> get is_default => $composableBuilder(
    column: $table.is_default,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get created_at => $composableBuilder(
    column: $table.created_at,
    builder: (column) => column,
  );
}

class $$LocationTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocationTable,
          LocationData,
          $$LocationTableFilterComposer,
          $$LocationTableOrderingComposer,
          $$LocationTableAnnotationComposer,
          $$LocationTableCreateCompanionBuilder,
          $$LocationTableUpdateCompanionBuilder,
          (
            LocationData,
            BaseReferences<_$AppDatabase, $LocationTable, LocationData>,
          ),
          LocationData,
          PrefetchHooks Function()
        > {
  $$LocationTableTableManager(_$AppDatabase db, $LocationTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> location_id = const Value.absent(),
                Value<String> location_name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lon = const Value.absent(),
                Value<bool> is_default = const Value.absent(),
                Value<DateTime> created_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationCompanion(
                location_id: location_id,
                location_name: location_name,
                address: address,
                lat: lat,
                lon: lon,
                is_default: is_default,
                created_at: created_at,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String location_id,
                required String location_name,
                required String address,
                required double lat,
                required double lon,
                Value<bool> is_default = const Value.absent(),
                Value<DateTime> created_at = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocationCompanion.insert(
                location_id: location_id,
                location_name: location_name,
                address: address,
                lat: lat,
                lon: lon,
                is_default: is_default,
                created_at: created_at,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocationTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocationTable,
      LocationData,
      $$LocationTableFilterComposer,
      $$LocationTableOrderingComposer,
      $$LocationTableAnnotationComposer,
      $$LocationTableCreateCompanionBuilder,
      $$LocationTableUpdateCompanionBuilder,
      (
        LocationData,
        BaseReferences<_$AppDatabase, $LocationTable, LocationData>,
      ),
      LocationData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocationTableTableManager get location =>
      $$LocationTableTableManager(_db, _db.location);
}
