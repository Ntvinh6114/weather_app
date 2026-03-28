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

class $DailyWeatherTable extends DailyWeather
    with TableInfo<$DailyWeatherTable, DailyWeatherData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyWeatherTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _daily_idMeta = const VerificationMeta(
    'daily_id',
  );
  @override
  late final GeneratedColumn<String> daily_id = GeneratedColumn<String>(
    'daily_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES location (location_id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temp_maxMeta = const VerificationMeta(
    'temp_max',
  );
  @override
  late final GeneratedColumn<double> temp_max = GeneratedColumn<double>(
    'temp_max',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temp_minMeta = const VerificationMeta(
    'temp_min',
  );
  @override
  late final GeneratedColumn<double> temp_min = GeneratedColumn<double>(
    'temp_min',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precip_probMeta = const VerificationMeta(
    'precip_prob',
  );
  @override
  late final GeneratedColumn<double> precip_prob = GeneratedColumn<double>(
    'precip_prob',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sunriseMeta = const VerificationMeta(
    'sunrise',
  );
  @override
  late final GeneratedColumn<DateTime> sunrise = GeneratedColumn<DateTime>(
    'sunrise',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sunsetMeta = const VerificationMeta('sunset');
  @override
  late final GeneratedColumn<DateTime> sunset = GeneratedColumn<DateTime>(
    'sunset',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TimeState, String> state =
      GeneratedColumn<String>(
        'state',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TimeState>($DailyWeatherTable.$converterstate);
  @override
  List<GeneratedColumn> get $columns => [
    daily_id,
    location_id,
    date,
    temp_max,
    temp_min,
    condition,
    icon,
    precip_prob,
    sunrise,
    sunset,
    state,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_weather';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyWeatherData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('daily_id')) {
      context.handle(
        _daily_idMeta,
        daily_id.isAcceptableOrUnknown(data['daily_id']!, _daily_idMeta),
      );
    } else if (isInserting) {
      context.missing(_daily_idMeta);
    }
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
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('temp_max')) {
      context.handle(
        _temp_maxMeta,
        temp_max.isAcceptableOrUnknown(data['temp_max']!, _temp_maxMeta),
      );
    } else if (isInserting) {
      context.missing(_temp_maxMeta);
    }
    if (data.containsKey('temp_min')) {
      context.handle(
        _temp_minMeta,
        temp_min.isAcceptableOrUnknown(data['temp_min']!, _temp_minMeta),
      );
    } else if (isInserting) {
      context.missing(_temp_minMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('precip_prob')) {
      context.handle(
        _precip_probMeta,
        precip_prob.isAcceptableOrUnknown(
          data['precip_prob']!,
          _precip_probMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precip_probMeta);
    }
    if (data.containsKey('sunrise')) {
      context.handle(
        _sunriseMeta,
        sunrise.isAcceptableOrUnknown(data['sunrise']!, _sunriseMeta),
      );
    }
    if (data.containsKey('sunset')) {
      context.handle(
        _sunsetMeta,
        sunset.isAcceptableOrUnknown(data['sunset']!, _sunsetMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {daily_id};
  @override
  DailyWeatherData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyWeatherData(
      daily_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}daily_id'],
      )!,
      location_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      temp_max: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temp_max'],
      )!,
      temp_min: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temp_min'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      precip_prob: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precip_prob'],
      )!,
      sunrise: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sunrise'],
      ),
      sunset: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sunset'],
      ),
      state: $DailyWeatherTable.$converterstate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}state'],
        )!,
      ),
    );
  }

  @override
  $DailyWeatherTable createAlias(String alias) {
    return $DailyWeatherTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TimeState, String, String> $converterstate =
      const EnumNameConverter<TimeState>(TimeState.values);
}

class DailyWeatherData extends DataClass
    implements Insertable<DailyWeatherData> {
  final String daily_id;
  final String location_id;
  final DateTime date;
  final double temp_max;
  final double temp_min;
  final String condition;
  final String icon;
  final double precip_prob;
  final DateTime? sunrise;
  final DateTime? sunset;
  final TimeState state;
  const DailyWeatherData({
    required this.daily_id,
    required this.location_id,
    required this.date,
    required this.temp_max,
    required this.temp_min,
    required this.condition,
    required this.icon,
    required this.precip_prob,
    this.sunrise,
    this.sunset,
    required this.state,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['daily_id'] = Variable<String>(daily_id);
    map['location_id'] = Variable<String>(location_id);
    map['date'] = Variable<DateTime>(date);
    map['temp_max'] = Variable<double>(temp_max);
    map['temp_min'] = Variable<double>(temp_min);
    map['condition'] = Variable<String>(condition);
    map['icon'] = Variable<String>(icon);
    map['precip_prob'] = Variable<double>(precip_prob);
    if (!nullToAbsent || sunrise != null) {
      map['sunrise'] = Variable<DateTime>(sunrise);
    }
    if (!nullToAbsent || sunset != null) {
      map['sunset'] = Variable<DateTime>(sunset);
    }
    {
      map['state'] = Variable<String>(
        $DailyWeatherTable.$converterstate.toSql(state),
      );
    }
    return map;
  }

  DailyWeatherCompanion toCompanion(bool nullToAbsent) {
    return DailyWeatherCompanion(
      daily_id: Value(daily_id),
      location_id: Value(location_id),
      date: Value(date),
      temp_max: Value(temp_max),
      temp_min: Value(temp_min),
      condition: Value(condition),
      icon: Value(icon),
      precip_prob: Value(precip_prob),
      sunrise: sunrise == null && nullToAbsent
          ? const Value.absent()
          : Value(sunrise),
      sunset: sunset == null && nullToAbsent
          ? const Value.absent()
          : Value(sunset),
      state: Value(state),
    );
  }

  factory DailyWeatherData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyWeatherData(
      daily_id: serializer.fromJson<String>(json['daily_id']),
      location_id: serializer.fromJson<String>(json['location_id']),
      date: serializer.fromJson<DateTime>(json['date']),
      temp_max: serializer.fromJson<double>(json['temp_max']),
      temp_min: serializer.fromJson<double>(json['temp_min']),
      condition: serializer.fromJson<String>(json['condition']),
      icon: serializer.fromJson<String>(json['icon']),
      precip_prob: serializer.fromJson<double>(json['precip_prob']),
      sunrise: serializer.fromJson<DateTime?>(json['sunrise']),
      sunset: serializer.fromJson<DateTime?>(json['sunset']),
      state: $DailyWeatherTable.$converterstate.fromJson(
        serializer.fromJson<String>(json['state']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'daily_id': serializer.toJson<String>(daily_id),
      'location_id': serializer.toJson<String>(location_id),
      'date': serializer.toJson<DateTime>(date),
      'temp_max': serializer.toJson<double>(temp_max),
      'temp_min': serializer.toJson<double>(temp_min),
      'condition': serializer.toJson<String>(condition),
      'icon': serializer.toJson<String>(icon),
      'precip_prob': serializer.toJson<double>(precip_prob),
      'sunrise': serializer.toJson<DateTime?>(sunrise),
      'sunset': serializer.toJson<DateTime?>(sunset),
      'state': serializer.toJson<String>(
        $DailyWeatherTable.$converterstate.toJson(state),
      ),
    };
  }

  DailyWeatherData copyWith({
    String? daily_id,
    String? location_id,
    DateTime? date,
    double? temp_max,
    double? temp_min,
    String? condition,
    String? icon,
    double? precip_prob,
    Value<DateTime?> sunrise = const Value.absent(),
    Value<DateTime?> sunset = const Value.absent(),
    TimeState? state,
  }) => DailyWeatherData(
    daily_id: daily_id ?? this.daily_id,
    location_id: location_id ?? this.location_id,
    date: date ?? this.date,
    temp_max: temp_max ?? this.temp_max,
    temp_min: temp_min ?? this.temp_min,
    condition: condition ?? this.condition,
    icon: icon ?? this.icon,
    precip_prob: precip_prob ?? this.precip_prob,
    sunrise: sunrise.present ? sunrise.value : this.sunrise,
    sunset: sunset.present ? sunset.value : this.sunset,
    state: state ?? this.state,
  );
  DailyWeatherData copyWithCompanion(DailyWeatherCompanion data) {
    return DailyWeatherData(
      daily_id: data.daily_id.present ? data.daily_id.value : this.daily_id,
      location_id: data.location_id.present
          ? data.location_id.value
          : this.location_id,
      date: data.date.present ? data.date.value : this.date,
      temp_max: data.temp_max.present ? data.temp_max.value : this.temp_max,
      temp_min: data.temp_min.present ? data.temp_min.value : this.temp_min,
      condition: data.condition.present ? data.condition.value : this.condition,
      icon: data.icon.present ? data.icon.value : this.icon,
      precip_prob: data.precip_prob.present
          ? data.precip_prob.value
          : this.precip_prob,
      sunrise: data.sunrise.present ? data.sunrise.value : this.sunrise,
      sunset: data.sunset.present ? data.sunset.value : this.sunset,
      state: data.state.present ? data.state.value : this.state,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyWeatherData(')
          ..write('daily_id: $daily_id, ')
          ..write('location_id: $location_id, ')
          ..write('date: $date, ')
          ..write('temp_max: $temp_max, ')
          ..write('temp_min: $temp_min, ')
          ..write('condition: $condition, ')
          ..write('icon: $icon, ')
          ..write('precip_prob: $precip_prob, ')
          ..write('sunrise: $sunrise, ')
          ..write('sunset: $sunset, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    daily_id,
    location_id,
    date,
    temp_max,
    temp_min,
    condition,
    icon,
    precip_prob,
    sunrise,
    sunset,
    state,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyWeatherData &&
          other.daily_id == this.daily_id &&
          other.location_id == this.location_id &&
          other.date == this.date &&
          other.temp_max == this.temp_max &&
          other.temp_min == this.temp_min &&
          other.condition == this.condition &&
          other.icon == this.icon &&
          other.precip_prob == this.precip_prob &&
          other.sunrise == this.sunrise &&
          other.sunset == this.sunset &&
          other.state == this.state);
}

class DailyWeatherCompanion extends UpdateCompanion<DailyWeatherData> {
  final Value<String> daily_id;
  final Value<String> location_id;
  final Value<DateTime> date;
  final Value<double> temp_max;
  final Value<double> temp_min;
  final Value<String> condition;
  final Value<String> icon;
  final Value<double> precip_prob;
  final Value<DateTime?> sunrise;
  final Value<DateTime?> sunset;
  final Value<TimeState> state;
  final Value<int> rowid;
  const DailyWeatherCompanion({
    this.daily_id = const Value.absent(),
    this.location_id = const Value.absent(),
    this.date = const Value.absent(),
    this.temp_max = const Value.absent(),
    this.temp_min = const Value.absent(),
    this.condition = const Value.absent(),
    this.icon = const Value.absent(),
    this.precip_prob = const Value.absent(),
    this.sunrise = const Value.absent(),
    this.sunset = const Value.absent(),
    this.state = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyWeatherCompanion.insert({
    required String daily_id,
    required String location_id,
    required DateTime date,
    required double temp_max,
    required double temp_min,
    required String condition,
    required String icon,
    required double precip_prob,
    this.sunrise = const Value.absent(),
    this.sunset = const Value.absent(),
    required TimeState state,
    this.rowid = const Value.absent(),
  }) : daily_id = Value(daily_id),
       location_id = Value(location_id),
       date = Value(date),
       temp_max = Value(temp_max),
       temp_min = Value(temp_min),
       condition = Value(condition),
       icon = Value(icon),
       precip_prob = Value(precip_prob),
       state = Value(state);
  static Insertable<DailyWeatherData> custom({
    Expression<String>? daily_id,
    Expression<String>? location_id,
    Expression<DateTime>? date,
    Expression<double>? temp_max,
    Expression<double>? temp_min,
    Expression<String>? condition,
    Expression<String>? icon,
    Expression<double>? precip_prob,
    Expression<DateTime>? sunrise,
    Expression<DateTime>? sunset,
    Expression<String>? state,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (daily_id != null) 'daily_id': daily_id,
      if (location_id != null) 'location_id': location_id,
      if (date != null) 'date': date,
      if (temp_max != null) 'temp_max': temp_max,
      if (temp_min != null) 'temp_min': temp_min,
      if (condition != null) 'condition': condition,
      if (icon != null) 'icon': icon,
      if (precip_prob != null) 'precip_prob': precip_prob,
      if (sunrise != null) 'sunrise': sunrise,
      if (sunset != null) 'sunset': sunset,
      if (state != null) 'state': state,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyWeatherCompanion copyWith({
    Value<String>? daily_id,
    Value<String>? location_id,
    Value<DateTime>? date,
    Value<double>? temp_max,
    Value<double>? temp_min,
    Value<String>? condition,
    Value<String>? icon,
    Value<double>? precip_prob,
    Value<DateTime?>? sunrise,
    Value<DateTime?>? sunset,
    Value<TimeState>? state,
    Value<int>? rowid,
  }) {
    return DailyWeatherCompanion(
      daily_id: daily_id ?? this.daily_id,
      location_id: location_id ?? this.location_id,
      date: date ?? this.date,
      temp_max: temp_max ?? this.temp_max,
      temp_min: temp_min ?? this.temp_min,
      condition: condition ?? this.condition,
      icon: icon ?? this.icon,
      precip_prob: precip_prob ?? this.precip_prob,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      state: state ?? this.state,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (daily_id.present) {
      map['daily_id'] = Variable<String>(daily_id.value);
    }
    if (location_id.present) {
      map['location_id'] = Variable<String>(location_id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (temp_max.present) {
      map['temp_max'] = Variable<double>(temp_max.value);
    }
    if (temp_min.present) {
      map['temp_min'] = Variable<double>(temp_min.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (precip_prob.present) {
      map['precip_prob'] = Variable<double>(precip_prob.value);
    }
    if (sunrise.present) {
      map['sunrise'] = Variable<DateTime>(sunrise.value);
    }
    if (sunset.present) {
      map['sunset'] = Variable<DateTime>(sunset.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(
        $DailyWeatherTable.$converterstate.toSql(state.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyWeatherCompanion(')
          ..write('daily_id: $daily_id, ')
          ..write('location_id: $location_id, ')
          ..write('date: $date, ')
          ..write('temp_max: $temp_max, ')
          ..write('temp_min: $temp_min, ')
          ..write('condition: $condition, ')
          ..write('icon: $icon, ')
          ..write('precip_prob: $precip_prob, ')
          ..write('sunrise: $sunrise, ')
          ..write('sunset: $sunset, ')
          ..write('state: $state, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HourlyWeatherTable extends HourlyWeather
    with TableInfo<$HourlyWeatherTable, HourlyWeatherData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HourlyWeatherTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _hourly_idMeta = const VerificationMeta(
    'hourly_id',
  );
  @override
  late final GeneratedColumn<String> hourly_id = GeneratedColumn<String>(
    'hourly_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _daily_idMeta = const VerificationMeta(
    'daily_id',
  );
  @override
  late final GeneratedColumn<String> daily_id = GeneratedColumn<String>(
    'daily_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES daily_weather (daily_id)',
    ),
  );
  static const VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<DateTime> hour = GeneratedColumn<DateTime>(
    'hour',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tempMeta = const VerificationMeta('temp');
  @override
  late final GeneratedColumn<double> temp = GeneratedColumn<double>(
    'temp',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feed_likeMeta = const VerificationMeta(
    'feed_like',
  );
  @override
  late final GeneratedColumn<double> feed_like = GeneratedColumn<double>(
    'feed_like',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _humidityMeta = const VerificationMeta(
    'humidity',
  );
  @override
  late final GeneratedColumn<double> humidity = GeneratedColumn<double>(
    'humidity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precip_probMeta = const VerificationMeta(
    'precip_prob',
  );
  @override
  late final GeneratedColumn<double> precip_prob = GeneratedColumn<double>(
    'precip_prob',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cloud_coverMeta = const VerificationMeta(
    'cloud_cover',
  );
  @override
  late final GeneratedColumn<double> cloud_cover = GeneratedColumn<double>(
    'cloud_cover',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wind_speedMeta = const VerificationMeta(
    'wind_speed',
  );
  @override
  late final GeneratedColumn<double> wind_speed = GeneratedColumn<double>(
    'wind_speed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uv_indexMeta = const VerificationMeta(
    'uv_index',
  );
  @override
  late final GeneratedColumn<int> uv_index = GeneratedColumn<int>(
    'uv_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TimeState, String> state =
      GeneratedColumn<String>(
        'state',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TimeState>($HourlyWeatherTable.$converterstate);
  @override
  List<GeneratedColumn> get $columns => [
    hourly_id,
    daily_id,
    hour,
    temp,
    feed_like,
    condition,
    icon,
    humidity,
    precip_prob,
    cloud_cover,
    wind_speed,
    uv_index,
    state,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hourly_weather';
  @override
  VerificationContext validateIntegrity(
    Insertable<HourlyWeatherData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('hourly_id')) {
      context.handle(
        _hourly_idMeta,
        hourly_id.isAcceptableOrUnknown(data['hourly_id']!, _hourly_idMeta),
      );
    } else if (isInserting) {
      context.missing(_hourly_idMeta);
    }
    if (data.containsKey('daily_id')) {
      context.handle(
        _daily_idMeta,
        daily_id.isAcceptableOrUnknown(data['daily_id']!, _daily_idMeta),
      );
    } else if (isInserting) {
      context.missing(_daily_idMeta);
    }
    if (data.containsKey('hour')) {
      context.handle(
        _hourMeta,
        hour.isAcceptableOrUnknown(data['hour']!, _hourMeta),
      );
    } else if (isInserting) {
      context.missing(_hourMeta);
    }
    if (data.containsKey('temp')) {
      context.handle(
        _tempMeta,
        temp.isAcceptableOrUnknown(data['temp']!, _tempMeta),
      );
    } else if (isInserting) {
      context.missing(_tempMeta);
    }
    if (data.containsKey('feed_like')) {
      context.handle(
        _feed_likeMeta,
        feed_like.isAcceptableOrUnknown(data['feed_like']!, _feed_likeMeta),
      );
    } else if (isInserting) {
      context.missing(_feed_likeMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('humidity')) {
      context.handle(
        _humidityMeta,
        humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta),
      );
    } else if (isInserting) {
      context.missing(_humidityMeta);
    }
    if (data.containsKey('precip_prob')) {
      context.handle(
        _precip_probMeta,
        precip_prob.isAcceptableOrUnknown(
          data['precip_prob']!,
          _precip_probMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precip_probMeta);
    }
    if (data.containsKey('cloud_cover')) {
      context.handle(
        _cloud_coverMeta,
        cloud_cover.isAcceptableOrUnknown(
          data['cloud_cover']!,
          _cloud_coverMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cloud_coverMeta);
    }
    if (data.containsKey('wind_speed')) {
      context.handle(
        _wind_speedMeta,
        wind_speed.isAcceptableOrUnknown(data['wind_speed']!, _wind_speedMeta),
      );
    } else if (isInserting) {
      context.missing(_wind_speedMeta);
    }
    if (data.containsKey('uv_index')) {
      context.handle(
        _uv_indexMeta,
        uv_index.isAcceptableOrUnknown(data['uv_index']!, _uv_indexMeta),
      );
    } else if (isInserting) {
      context.missing(_uv_indexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hourly_id};
  @override
  HourlyWeatherData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HourlyWeatherData(
      hourly_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hourly_id'],
      )!,
      daily_id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}daily_id'],
      )!,
      hour: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hour'],
      )!,
      temp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temp'],
      )!,
      feed_like: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}feed_like'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      humidity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}humidity'],
      )!,
      precip_prob: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precip_prob'],
      )!,
      cloud_cover: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cloud_cover'],
      )!,
      wind_speed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wind_speed'],
      )!,
      uv_index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uv_index'],
      )!,
      state: $HourlyWeatherTable.$converterstate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}state'],
        )!,
      ),
    );
  }

  @override
  $HourlyWeatherTable createAlias(String alias) {
    return $HourlyWeatherTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TimeState, String, String> $converterstate =
      const EnumNameConverter<TimeState>(TimeState.values);
}

class HourlyWeatherData extends DataClass
    implements Insertable<HourlyWeatherData> {
  final String hourly_id;
  final String daily_id;
  final DateTime hour;
  final double temp;
  final double feed_like;
  final String condition;
  final String icon;
  final double humidity;
  final double precip_prob;
  final double cloud_cover;
  final double wind_speed;
  final int uv_index;
  final TimeState state;
  const HourlyWeatherData({
    required this.hourly_id,
    required this.daily_id,
    required this.hour,
    required this.temp,
    required this.feed_like,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.precip_prob,
    required this.cloud_cover,
    required this.wind_speed,
    required this.uv_index,
    required this.state,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['hourly_id'] = Variable<String>(hourly_id);
    map['daily_id'] = Variable<String>(daily_id);
    map['hour'] = Variable<DateTime>(hour);
    map['temp'] = Variable<double>(temp);
    map['feed_like'] = Variable<double>(feed_like);
    map['condition'] = Variable<String>(condition);
    map['icon'] = Variable<String>(icon);
    map['humidity'] = Variable<double>(humidity);
    map['precip_prob'] = Variable<double>(precip_prob);
    map['cloud_cover'] = Variable<double>(cloud_cover);
    map['wind_speed'] = Variable<double>(wind_speed);
    map['uv_index'] = Variable<int>(uv_index);
    {
      map['state'] = Variable<String>(
        $HourlyWeatherTable.$converterstate.toSql(state),
      );
    }
    return map;
  }

  HourlyWeatherCompanion toCompanion(bool nullToAbsent) {
    return HourlyWeatherCompanion(
      hourly_id: Value(hourly_id),
      daily_id: Value(daily_id),
      hour: Value(hour),
      temp: Value(temp),
      feed_like: Value(feed_like),
      condition: Value(condition),
      icon: Value(icon),
      humidity: Value(humidity),
      precip_prob: Value(precip_prob),
      cloud_cover: Value(cloud_cover),
      wind_speed: Value(wind_speed),
      uv_index: Value(uv_index),
      state: Value(state),
    );
  }

  factory HourlyWeatherData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HourlyWeatherData(
      hourly_id: serializer.fromJson<String>(json['hourly_id']),
      daily_id: serializer.fromJson<String>(json['daily_id']),
      hour: serializer.fromJson<DateTime>(json['hour']),
      temp: serializer.fromJson<double>(json['temp']),
      feed_like: serializer.fromJson<double>(json['feed_like']),
      condition: serializer.fromJson<String>(json['condition']),
      icon: serializer.fromJson<String>(json['icon']),
      humidity: serializer.fromJson<double>(json['humidity']),
      precip_prob: serializer.fromJson<double>(json['precip_prob']),
      cloud_cover: serializer.fromJson<double>(json['cloud_cover']),
      wind_speed: serializer.fromJson<double>(json['wind_speed']),
      uv_index: serializer.fromJson<int>(json['uv_index']),
      state: $HourlyWeatherTable.$converterstate.fromJson(
        serializer.fromJson<String>(json['state']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hourly_id': serializer.toJson<String>(hourly_id),
      'daily_id': serializer.toJson<String>(daily_id),
      'hour': serializer.toJson<DateTime>(hour),
      'temp': serializer.toJson<double>(temp),
      'feed_like': serializer.toJson<double>(feed_like),
      'condition': serializer.toJson<String>(condition),
      'icon': serializer.toJson<String>(icon),
      'humidity': serializer.toJson<double>(humidity),
      'precip_prob': serializer.toJson<double>(precip_prob),
      'cloud_cover': serializer.toJson<double>(cloud_cover),
      'wind_speed': serializer.toJson<double>(wind_speed),
      'uv_index': serializer.toJson<int>(uv_index),
      'state': serializer.toJson<String>(
        $HourlyWeatherTable.$converterstate.toJson(state),
      ),
    };
  }

  HourlyWeatherData copyWith({
    String? hourly_id,
    String? daily_id,
    DateTime? hour,
    double? temp,
    double? feed_like,
    String? condition,
    String? icon,
    double? humidity,
    double? precip_prob,
    double? cloud_cover,
    double? wind_speed,
    int? uv_index,
    TimeState? state,
  }) => HourlyWeatherData(
    hourly_id: hourly_id ?? this.hourly_id,
    daily_id: daily_id ?? this.daily_id,
    hour: hour ?? this.hour,
    temp: temp ?? this.temp,
    feed_like: feed_like ?? this.feed_like,
    condition: condition ?? this.condition,
    icon: icon ?? this.icon,
    humidity: humidity ?? this.humidity,
    precip_prob: precip_prob ?? this.precip_prob,
    cloud_cover: cloud_cover ?? this.cloud_cover,
    wind_speed: wind_speed ?? this.wind_speed,
    uv_index: uv_index ?? this.uv_index,
    state: state ?? this.state,
  );
  HourlyWeatherData copyWithCompanion(HourlyWeatherCompanion data) {
    return HourlyWeatherData(
      hourly_id: data.hourly_id.present ? data.hourly_id.value : this.hourly_id,
      daily_id: data.daily_id.present ? data.daily_id.value : this.daily_id,
      hour: data.hour.present ? data.hour.value : this.hour,
      temp: data.temp.present ? data.temp.value : this.temp,
      feed_like: data.feed_like.present ? data.feed_like.value : this.feed_like,
      condition: data.condition.present ? data.condition.value : this.condition,
      icon: data.icon.present ? data.icon.value : this.icon,
      humidity: data.humidity.present ? data.humidity.value : this.humidity,
      precip_prob: data.precip_prob.present
          ? data.precip_prob.value
          : this.precip_prob,
      cloud_cover: data.cloud_cover.present
          ? data.cloud_cover.value
          : this.cloud_cover,
      wind_speed: data.wind_speed.present
          ? data.wind_speed.value
          : this.wind_speed,
      uv_index: data.uv_index.present ? data.uv_index.value : this.uv_index,
      state: data.state.present ? data.state.value : this.state,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HourlyWeatherData(')
          ..write('hourly_id: $hourly_id, ')
          ..write('daily_id: $daily_id, ')
          ..write('hour: $hour, ')
          ..write('temp: $temp, ')
          ..write('feed_like: $feed_like, ')
          ..write('condition: $condition, ')
          ..write('icon: $icon, ')
          ..write('humidity: $humidity, ')
          ..write('precip_prob: $precip_prob, ')
          ..write('cloud_cover: $cloud_cover, ')
          ..write('wind_speed: $wind_speed, ')
          ..write('uv_index: $uv_index, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    hourly_id,
    daily_id,
    hour,
    temp,
    feed_like,
    condition,
    icon,
    humidity,
    precip_prob,
    cloud_cover,
    wind_speed,
    uv_index,
    state,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HourlyWeatherData &&
          other.hourly_id == this.hourly_id &&
          other.daily_id == this.daily_id &&
          other.hour == this.hour &&
          other.temp == this.temp &&
          other.feed_like == this.feed_like &&
          other.condition == this.condition &&
          other.icon == this.icon &&
          other.humidity == this.humidity &&
          other.precip_prob == this.precip_prob &&
          other.cloud_cover == this.cloud_cover &&
          other.wind_speed == this.wind_speed &&
          other.uv_index == this.uv_index &&
          other.state == this.state);
}

class HourlyWeatherCompanion extends UpdateCompanion<HourlyWeatherData> {
  final Value<String> hourly_id;
  final Value<String> daily_id;
  final Value<DateTime> hour;
  final Value<double> temp;
  final Value<double> feed_like;
  final Value<String> condition;
  final Value<String> icon;
  final Value<double> humidity;
  final Value<double> precip_prob;
  final Value<double> cloud_cover;
  final Value<double> wind_speed;
  final Value<int> uv_index;
  final Value<TimeState> state;
  final Value<int> rowid;
  const HourlyWeatherCompanion({
    this.hourly_id = const Value.absent(),
    this.daily_id = const Value.absent(),
    this.hour = const Value.absent(),
    this.temp = const Value.absent(),
    this.feed_like = const Value.absent(),
    this.condition = const Value.absent(),
    this.icon = const Value.absent(),
    this.humidity = const Value.absent(),
    this.precip_prob = const Value.absent(),
    this.cloud_cover = const Value.absent(),
    this.wind_speed = const Value.absent(),
    this.uv_index = const Value.absent(),
    this.state = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HourlyWeatherCompanion.insert({
    required String hourly_id,
    required String daily_id,
    required DateTime hour,
    required double temp,
    required double feed_like,
    required String condition,
    required String icon,
    required double humidity,
    required double precip_prob,
    required double cloud_cover,
    required double wind_speed,
    required int uv_index,
    required TimeState state,
    this.rowid = const Value.absent(),
  }) : hourly_id = Value(hourly_id),
       daily_id = Value(daily_id),
       hour = Value(hour),
       temp = Value(temp),
       feed_like = Value(feed_like),
       condition = Value(condition),
       icon = Value(icon),
       humidity = Value(humidity),
       precip_prob = Value(precip_prob),
       cloud_cover = Value(cloud_cover),
       wind_speed = Value(wind_speed),
       uv_index = Value(uv_index),
       state = Value(state);
  static Insertable<HourlyWeatherData> custom({
    Expression<String>? hourly_id,
    Expression<String>? daily_id,
    Expression<DateTime>? hour,
    Expression<double>? temp,
    Expression<double>? feed_like,
    Expression<String>? condition,
    Expression<String>? icon,
    Expression<double>? humidity,
    Expression<double>? precip_prob,
    Expression<double>? cloud_cover,
    Expression<double>? wind_speed,
    Expression<int>? uv_index,
    Expression<String>? state,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (hourly_id != null) 'hourly_id': hourly_id,
      if (daily_id != null) 'daily_id': daily_id,
      if (hour != null) 'hour': hour,
      if (temp != null) 'temp': temp,
      if (feed_like != null) 'feed_like': feed_like,
      if (condition != null) 'condition': condition,
      if (icon != null) 'icon': icon,
      if (humidity != null) 'humidity': humidity,
      if (precip_prob != null) 'precip_prob': precip_prob,
      if (cloud_cover != null) 'cloud_cover': cloud_cover,
      if (wind_speed != null) 'wind_speed': wind_speed,
      if (uv_index != null) 'uv_index': uv_index,
      if (state != null) 'state': state,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HourlyWeatherCompanion copyWith({
    Value<String>? hourly_id,
    Value<String>? daily_id,
    Value<DateTime>? hour,
    Value<double>? temp,
    Value<double>? feed_like,
    Value<String>? condition,
    Value<String>? icon,
    Value<double>? humidity,
    Value<double>? precip_prob,
    Value<double>? cloud_cover,
    Value<double>? wind_speed,
    Value<int>? uv_index,
    Value<TimeState>? state,
    Value<int>? rowid,
  }) {
    return HourlyWeatherCompanion(
      hourly_id: hourly_id ?? this.hourly_id,
      daily_id: daily_id ?? this.daily_id,
      hour: hour ?? this.hour,
      temp: temp ?? this.temp,
      feed_like: feed_like ?? this.feed_like,
      condition: condition ?? this.condition,
      icon: icon ?? this.icon,
      humidity: humidity ?? this.humidity,
      precip_prob: precip_prob ?? this.precip_prob,
      cloud_cover: cloud_cover ?? this.cloud_cover,
      wind_speed: wind_speed ?? this.wind_speed,
      uv_index: uv_index ?? this.uv_index,
      state: state ?? this.state,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (hourly_id.present) {
      map['hourly_id'] = Variable<String>(hourly_id.value);
    }
    if (daily_id.present) {
      map['daily_id'] = Variable<String>(daily_id.value);
    }
    if (hour.present) {
      map['hour'] = Variable<DateTime>(hour.value);
    }
    if (temp.present) {
      map['temp'] = Variable<double>(temp.value);
    }
    if (feed_like.present) {
      map['feed_like'] = Variable<double>(feed_like.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<double>(humidity.value);
    }
    if (precip_prob.present) {
      map['precip_prob'] = Variable<double>(precip_prob.value);
    }
    if (cloud_cover.present) {
      map['cloud_cover'] = Variable<double>(cloud_cover.value);
    }
    if (wind_speed.present) {
      map['wind_speed'] = Variable<double>(wind_speed.value);
    }
    if (uv_index.present) {
      map['uv_index'] = Variable<int>(uv_index.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(
        $HourlyWeatherTable.$converterstate.toSql(state.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HourlyWeatherCompanion(')
          ..write('hourly_id: $hourly_id, ')
          ..write('daily_id: $daily_id, ')
          ..write('hour: $hour, ')
          ..write('temp: $temp, ')
          ..write('feed_like: $feed_like, ')
          ..write('condition: $condition, ')
          ..write('icon: $icon, ')
          ..write('humidity: $humidity, ')
          ..write('precip_prob: $precip_prob, ')
          ..write('cloud_cover: $cloud_cover, ')
          ..write('wind_speed: $wind_speed, ')
          ..write('uv_index: $uv_index, ')
          ..write('state: $state, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocationTable location = $LocationTable(this);
  late final $DailyWeatherTable dailyWeather = $DailyWeatherTable(this);
  late final $HourlyWeatherTable hourlyWeather = $HourlyWeatherTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    location,
    dailyWeather,
    hourlyWeather,
  ];
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

final class $$LocationTableReferences
    extends BaseReferences<_$AppDatabase, $LocationTable, LocationData> {
  $$LocationTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DailyWeatherTable, List<DailyWeatherData>>
  _dailyWeatherRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dailyWeather,
    aliasName: $_aliasNameGenerator(
      db.location.location_id,
      db.dailyWeather.location_id,
    ),
  );

  $$DailyWeatherTableProcessedTableManager get dailyWeatherRefs {
    final manager = $$DailyWeatherTableTableManager($_db, $_db.dailyWeather)
        .filter(
          (f) => f.location_id.location_id.sqlEquals(
            $_itemColumn<String>('location_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_dailyWeatherRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> dailyWeatherRefs(
    Expression<bool> Function($$DailyWeatherTableFilterComposer f) f,
  ) {
    final $$DailyWeatherTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.location_id,
      referencedTable: $db.dailyWeather,
      getReferencedColumn: (t) => t.location_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyWeatherTableFilterComposer(
            $db: $db,
            $table: $db.dailyWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> dailyWeatherRefs<T extends Object>(
    Expression<T> Function($$DailyWeatherTableAnnotationComposer a) f,
  ) {
    final $$DailyWeatherTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.location_id,
      referencedTable: $db.dailyWeather,
      getReferencedColumn: (t) => t.location_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyWeatherTableAnnotationComposer(
            $db: $db,
            $table: $db.dailyWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (LocationData, $$LocationTableReferences),
          LocationData,
          PrefetchHooks Function({bool dailyWeatherRefs})
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
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocationTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dailyWeatherRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dailyWeatherRefs) db.dailyWeather],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dailyWeatherRefs)
                    await $_getPrefetchedData<
                      LocationData,
                      $LocationTable,
                      DailyWeatherData
                    >(
                      currentTable: table,
                      referencedTable: $$LocationTableReferences
                          ._dailyWeatherRefsTable(db),
                      managerFromTypedResult: (p0) => $$LocationTableReferences(
                        db,
                        table,
                        p0,
                      ).dailyWeatherRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.location_id == item.location_id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (LocationData, $$LocationTableReferences),
      LocationData,
      PrefetchHooks Function({bool dailyWeatherRefs})
    >;
typedef $$DailyWeatherTableCreateCompanionBuilder =
    DailyWeatherCompanion Function({
      required String daily_id,
      required String location_id,
      required DateTime date,
      required double temp_max,
      required double temp_min,
      required String condition,
      required String icon,
      required double precip_prob,
      Value<DateTime?> sunrise,
      Value<DateTime?> sunset,
      required TimeState state,
      Value<int> rowid,
    });
typedef $$DailyWeatherTableUpdateCompanionBuilder =
    DailyWeatherCompanion Function({
      Value<String> daily_id,
      Value<String> location_id,
      Value<DateTime> date,
      Value<double> temp_max,
      Value<double> temp_min,
      Value<String> condition,
      Value<String> icon,
      Value<double> precip_prob,
      Value<DateTime?> sunrise,
      Value<DateTime?> sunset,
      Value<TimeState> state,
      Value<int> rowid,
    });

final class $$DailyWeatherTableReferences
    extends
        BaseReferences<_$AppDatabase, $DailyWeatherTable, DailyWeatherData> {
  $$DailyWeatherTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LocationTable _location_idTable(_$AppDatabase db) =>
      db.location.createAlias(
        $_aliasNameGenerator(
          db.dailyWeather.location_id,
          db.location.location_id,
        ),
      );

  $$LocationTableProcessedTableManager get location_id {
    final $_column = $_itemColumn<String>('location_id')!;

    final manager = $$LocationTableTableManager(
      $_db,
      $_db.location,
    ).filter((f) => f.location_id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_location_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$HourlyWeatherTable, List<HourlyWeatherData>>
  _hourlyWeatherRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.hourlyWeather,
    aliasName: $_aliasNameGenerator(
      db.dailyWeather.daily_id,
      db.hourlyWeather.daily_id,
    ),
  );

  $$HourlyWeatherTableProcessedTableManager get hourlyWeatherRefs {
    final manager = $$HourlyWeatherTableTableManager($_db, $_db.hourlyWeather)
        .filter(
          (f) =>
              f.daily_id.daily_id.sqlEquals($_itemColumn<String>('daily_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_hourlyWeatherRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DailyWeatherTableFilterComposer
    extends Composer<_$AppDatabase, $DailyWeatherTable> {
  $$DailyWeatherTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get daily_id => $composableBuilder(
    column: $table.daily_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temp_max => $composableBuilder(
    column: $table.temp_max,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temp_min => $composableBuilder(
    column: $table.temp_min,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precip_prob => $composableBuilder(
    column: $table.precip_prob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sunrise => $composableBuilder(
    column: $table.sunrise,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sunset => $composableBuilder(
    column: $table.sunset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TimeState, TimeState, String> get state =>
      $composableBuilder(
        column: $table.state,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$LocationTableFilterComposer get location_id {
    final $$LocationTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.location_id,
      referencedTable: $db.location,
      getReferencedColumn: (t) => t.location_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableFilterComposer(
            $db: $db,
            $table: $db.location,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> hourlyWeatherRefs(
    Expression<bool> Function($$HourlyWeatherTableFilterComposer f) f,
  ) {
    final $$HourlyWeatherTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.daily_id,
      referencedTable: $db.hourlyWeather,
      getReferencedColumn: (t) => t.daily_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HourlyWeatherTableFilterComposer(
            $db: $db,
            $table: $db.hourlyWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DailyWeatherTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyWeatherTable> {
  $$DailyWeatherTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get daily_id => $composableBuilder(
    column: $table.daily_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temp_max => $composableBuilder(
    column: $table.temp_max,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temp_min => $composableBuilder(
    column: $table.temp_min,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precip_prob => $composableBuilder(
    column: $table.precip_prob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sunrise => $composableBuilder(
    column: $table.sunrise,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sunset => $composableBuilder(
    column: $table.sunset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  $$LocationTableOrderingComposer get location_id {
    final $$LocationTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.location_id,
      referencedTable: $db.location,
      getReferencedColumn: (t) => t.location_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableOrderingComposer(
            $db: $db,
            $table: $db.location,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DailyWeatherTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyWeatherTable> {
  $$DailyWeatherTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get daily_id =>
      $composableBuilder(column: $table.daily_id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get temp_max =>
      $composableBuilder(column: $table.temp_max, builder: (column) => column);

  GeneratedColumn<double> get temp_min =>
      $composableBuilder(column: $table.temp_min, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<double> get precip_prob => $composableBuilder(
    column: $table.precip_prob,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get sunrise =>
      $composableBuilder(column: $table.sunrise, builder: (column) => column);

  GeneratedColumn<DateTime> get sunset =>
      $composableBuilder(column: $table.sunset, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TimeState, String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  $$LocationTableAnnotationComposer get location_id {
    final $$LocationTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.location_id,
      referencedTable: $db.location,
      getReferencedColumn: (t) => t.location_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationTableAnnotationComposer(
            $db: $db,
            $table: $db.location,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> hourlyWeatherRefs<T extends Object>(
    Expression<T> Function($$HourlyWeatherTableAnnotationComposer a) f,
  ) {
    final $$HourlyWeatherTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.daily_id,
      referencedTable: $db.hourlyWeather,
      getReferencedColumn: (t) => t.daily_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HourlyWeatherTableAnnotationComposer(
            $db: $db,
            $table: $db.hourlyWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DailyWeatherTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyWeatherTable,
          DailyWeatherData,
          $$DailyWeatherTableFilterComposer,
          $$DailyWeatherTableOrderingComposer,
          $$DailyWeatherTableAnnotationComposer,
          $$DailyWeatherTableCreateCompanionBuilder,
          $$DailyWeatherTableUpdateCompanionBuilder,
          (DailyWeatherData, $$DailyWeatherTableReferences),
          DailyWeatherData,
          PrefetchHooks Function({bool location_id, bool hourlyWeatherRefs})
        > {
  $$DailyWeatherTableTableManager(_$AppDatabase db, $DailyWeatherTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyWeatherTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyWeatherTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyWeatherTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> daily_id = const Value.absent(),
                Value<String> location_id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> temp_max = const Value.absent(),
                Value<double> temp_min = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<double> precip_prob = const Value.absent(),
                Value<DateTime?> sunrise = const Value.absent(),
                Value<DateTime?> sunset = const Value.absent(),
                Value<TimeState> state = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyWeatherCompanion(
                daily_id: daily_id,
                location_id: location_id,
                date: date,
                temp_max: temp_max,
                temp_min: temp_min,
                condition: condition,
                icon: icon,
                precip_prob: precip_prob,
                sunrise: sunrise,
                sunset: sunset,
                state: state,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String daily_id,
                required String location_id,
                required DateTime date,
                required double temp_max,
                required double temp_min,
                required String condition,
                required String icon,
                required double precip_prob,
                Value<DateTime?> sunrise = const Value.absent(),
                Value<DateTime?> sunset = const Value.absent(),
                required TimeState state,
                Value<int> rowid = const Value.absent(),
              }) => DailyWeatherCompanion.insert(
                daily_id: daily_id,
                location_id: location_id,
                date: date,
                temp_max: temp_max,
                temp_min: temp_min,
                condition: condition,
                icon: icon,
                precip_prob: precip_prob,
                sunrise: sunrise,
                sunset: sunset,
                state: state,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DailyWeatherTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({location_id = false, hourlyWeatherRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (hourlyWeatherRefs) db.hourlyWeather,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (location_id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.location_id,
                                    referencedTable:
                                        $$DailyWeatherTableReferences
                                            ._location_idTable(db),
                                    referencedColumn:
                                        $$DailyWeatherTableReferences
                                            ._location_idTable(db)
                                            .location_id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (hourlyWeatherRefs)
                        await $_getPrefetchedData<
                          DailyWeatherData,
                          $DailyWeatherTable,
                          HourlyWeatherData
                        >(
                          currentTable: table,
                          referencedTable: $$DailyWeatherTableReferences
                              ._hourlyWeatherRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DailyWeatherTableReferences(
                                db,
                                table,
                                p0,
                              ).hourlyWeatherRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.daily_id == item.daily_id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DailyWeatherTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyWeatherTable,
      DailyWeatherData,
      $$DailyWeatherTableFilterComposer,
      $$DailyWeatherTableOrderingComposer,
      $$DailyWeatherTableAnnotationComposer,
      $$DailyWeatherTableCreateCompanionBuilder,
      $$DailyWeatherTableUpdateCompanionBuilder,
      (DailyWeatherData, $$DailyWeatherTableReferences),
      DailyWeatherData,
      PrefetchHooks Function({bool location_id, bool hourlyWeatherRefs})
    >;
typedef $$HourlyWeatherTableCreateCompanionBuilder =
    HourlyWeatherCompanion Function({
      required String hourly_id,
      required String daily_id,
      required DateTime hour,
      required double temp,
      required double feed_like,
      required String condition,
      required String icon,
      required double humidity,
      required double precip_prob,
      required double cloud_cover,
      required double wind_speed,
      required int uv_index,
      required TimeState state,
      Value<int> rowid,
    });
typedef $$HourlyWeatherTableUpdateCompanionBuilder =
    HourlyWeatherCompanion Function({
      Value<String> hourly_id,
      Value<String> daily_id,
      Value<DateTime> hour,
      Value<double> temp,
      Value<double> feed_like,
      Value<String> condition,
      Value<String> icon,
      Value<double> humidity,
      Value<double> precip_prob,
      Value<double> cloud_cover,
      Value<double> wind_speed,
      Value<int> uv_index,
      Value<TimeState> state,
      Value<int> rowid,
    });

final class $$HourlyWeatherTableReferences
    extends
        BaseReferences<_$AppDatabase, $HourlyWeatherTable, HourlyWeatherData> {
  $$HourlyWeatherTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DailyWeatherTable _daily_idTable(_$AppDatabase db) =>
      db.dailyWeather.createAlias(
        $_aliasNameGenerator(
          db.hourlyWeather.daily_id,
          db.dailyWeather.daily_id,
        ),
      );

  $$DailyWeatherTableProcessedTableManager get daily_id {
    final $_column = $_itemColumn<String>('daily_id')!;

    final manager = $$DailyWeatherTableTableManager(
      $_db,
      $_db.dailyWeather,
    ).filter((f) => f.daily_id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_daily_idTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HourlyWeatherTableFilterComposer
    extends Composer<_$AppDatabase, $HourlyWeatherTable> {
  $$HourlyWeatherTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get hourly_id => $composableBuilder(
    column: $table.hourly_id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temp => $composableBuilder(
    column: $table.temp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get feed_like => $composableBuilder(
    column: $table.feed_like,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precip_prob => $composableBuilder(
    column: $table.precip_prob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cloud_cover => $composableBuilder(
    column: $table.cloud_cover,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get wind_speed => $composableBuilder(
    column: $table.wind_speed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get uv_index => $composableBuilder(
    column: $table.uv_index,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TimeState, TimeState, String> get state =>
      $composableBuilder(
        column: $table.state,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$DailyWeatherTableFilterComposer get daily_id {
    final $$DailyWeatherTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.daily_id,
      referencedTable: $db.dailyWeather,
      getReferencedColumn: (t) => t.daily_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyWeatherTableFilterComposer(
            $db: $db,
            $table: $db.dailyWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HourlyWeatherTableOrderingComposer
    extends Composer<_$AppDatabase, $HourlyWeatherTable> {
  $$HourlyWeatherTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get hourly_id => $composableBuilder(
    column: $table.hourly_id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temp => $composableBuilder(
    column: $table.temp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get feed_like => $composableBuilder(
    column: $table.feed_like,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precip_prob => $composableBuilder(
    column: $table.precip_prob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cloud_cover => $composableBuilder(
    column: $table.cloud_cover,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get wind_speed => $composableBuilder(
    column: $table.wind_speed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get uv_index => $composableBuilder(
    column: $table.uv_index,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  $$DailyWeatherTableOrderingComposer get daily_id {
    final $$DailyWeatherTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.daily_id,
      referencedTable: $db.dailyWeather,
      getReferencedColumn: (t) => t.daily_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyWeatherTableOrderingComposer(
            $db: $db,
            $table: $db.dailyWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HourlyWeatherTableAnnotationComposer
    extends Composer<_$AppDatabase, $HourlyWeatherTable> {
  $$HourlyWeatherTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get hourly_id =>
      $composableBuilder(column: $table.hourly_id, builder: (column) => column);

  GeneratedColumn<DateTime> get hour =>
      $composableBuilder(column: $table.hour, builder: (column) => column);

  GeneratedColumn<double> get temp =>
      $composableBuilder(column: $table.temp, builder: (column) => column);

  GeneratedColumn<double> get feed_like =>
      $composableBuilder(column: $table.feed_like, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<double> get humidity =>
      $composableBuilder(column: $table.humidity, builder: (column) => column);

  GeneratedColumn<double> get precip_prob => $composableBuilder(
    column: $table.precip_prob,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cloud_cover => $composableBuilder(
    column: $table.cloud_cover,
    builder: (column) => column,
  );

  GeneratedColumn<double> get wind_speed => $composableBuilder(
    column: $table.wind_speed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get uv_index =>
      $composableBuilder(column: $table.uv_index, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TimeState, String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  $$DailyWeatherTableAnnotationComposer get daily_id {
    final $$DailyWeatherTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.daily_id,
      referencedTable: $db.dailyWeather,
      getReferencedColumn: (t) => t.daily_id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DailyWeatherTableAnnotationComposer(
            $db: $db,
            $table: $db.dailyWeather,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HourlyWeatherTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HourlyWeatherTable,
          HourlyWeatherData,
          $$HourlyWeatherTableFilterComposer,
          $$HourlyWeatherTableOrderingComposer,
          $$HourlyWeatherTableAnnotationComposer,
          $$HourlyWeatherTableCreateCompanionBuilder,
          $$HourlyWeatherTableUpdateCompanionBuilder,
          (HourlyWeatherData, $$HourlyWeatherTableReferences),
          HourlyWeatherData,
          PrefetchHooks Function({bool daily_id})
        > {
  $$HourlyWeatherTableTableManager(_$AppDatabase db, $HourlyWeatherTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HourlyWeatherTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HourlyWeatherTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HourlyWeatherTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> hourly_id = const Value.absent(),
                Value<String> daily_id = const Value.absent(),
                Value<DateTime> hour = const Value.absent(),
                Value<double> temp = const Value.absent(),
                Value<double> feed_like = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<double> humidity = const Value.absent(),
                Value<double> precip_prob = const Value.absent(),
                Value<double> cloud_cover = const Value.absent(),
                Value<double> wind_speed = const Value.absent(),
                Value<int> uv_index = const Value.absent(),
                Value<TimeState> state = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HourlyWeatherCompanion(
                hourly_id: hourly_id,
                daily_id: daily_id,
                hour: hour,
                temp: temp,
                feed_like: feed_like,
                condition: condition,
                icon: icon,
                humidity: humidity,
                precip_prob: precip_prob,
                cloud_cover: cloud_cover,
                wind_speed: wind_speed,
                uv_index: uv_index,
                state: state,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String hourly_id,
                required String daily_id,
                required DateTime hour,
                required double temp,
                required double feed_like,
                required String condition,
                required String icon,
                required double humidity,
                required double precip_prob,
                required double cloud_cover,
                required double wind_speed,
                required int uv_index,
                required TimeState state,
                Value<int> rowid = const Value.absent(),
              }) => HourlyWeatherCompanion.insert(
                hourly_id: hourly_id,
                daily_id: daily_id,
                hour: hour,
                temp: temp,
                feed_like: feed_like,
                condition: condition,
                icon: icon,
                humidity: humidity,
                precip_prob: precip_prob,
                cloud_cover: cloud_cover,
                wind_speed: wind_speed,
                uv_index: uv_index,
                state: state,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HourlyWeatherTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({daily_id = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (daily_id) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.daily_id,
                                referencedTable: $$HourlyWeatherTableReferences
                                    ._daily_idTable(db),
                                referencedColumn: $$HourlyWeatherTableReferences
                                    ._daily_idTable(db)
                                    .daily_id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HourlyWeatherTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HourlyWeatherTable,
      HourlyWeatherData,
      $$HourlyWeatherTableFilterComposer,
      $$HourlyWeatherTableOrderingComposer,
      $$HourlyWeatherTableAnnotationComposer,
      $$HourlyWeatherTableCreateCompanionBuilder,
      $$HourlyWeatherTableUpdateCompanionBuilder,
      (HourlyWeatherData, $$HourlyWeatherTableReferences),
      HourlyWeatherData,
      PrefetchHooks Function({bool daily_id})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocationTableTableManager get location =>
      $$LocationTableTableManager(_db, _db.location);
  $$DailyWeatherTableTableManager get dailyWeather =>
      $$DailyWeatherTableTableManager(_db, _db.dailyWeather);
  $$HourlyWeatherTableTableManager get hourlyWeather =>
      $$HourlyWeatherTableTableManager(_db, _db.hourlyWeather);
}
