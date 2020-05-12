// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_moor.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Site extends DataClass implements Insertable<Site> {
  final int id;
  final String sitename;
  final String siteaddress;
  final int numofbarn;
  Site(
      {@required this.id,
      @required this.sitename,
      @required this.siteaddress,
      this.numofbarn});
  factory Site.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Site(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      sitename: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sitename']),
      siteaddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}siteaddress']),
      numofbarn:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}numofbarn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || sitename != null) {
      map['sitename'] = Variable<String>(sitename);
    }
    if (!nullToAbsent || siteaddress != null) {
      map['siteaddress'] = Variable<String>(siteaddress);
    }
    if (!nullToAbsent || numofbarn != null) {
      map['numofbarn'] = Variable<int>(numofbarn);
    }
    return map;
  }

  factory Site.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Site(
      id: serializer.fromJson<int>(json['id']),
      sitename: serializer.fromJson<String>(json['sitename']),
      siteaddress: serializer.fromJson<String>(json['siteaddress']),
      numofbarn: serializer.fromJson<int>(json['numofbarn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sitename': serializer.toJson<String>(sitename),
      'siteaddress': serializer.toJson<String>(siteaddress),
      'numofbarn': serializer.toJson<int>(numofbarn),
    };
  }

  Site copyWith({int id, String sitename, String siteaddress, int numofbarn}) =>
      Site(
        id: id ?? this.id,
        sitename: sitename ?? this.sitename,
        siteaddress: siteaddress ?? this.siteaddress,
        numofbarn: numofbarn ?? this.numofbarn,
      );
  @override
  String toString() {
    return (StringBuffer('Site(')
          ..write('id: $id, ')
          ..write('sitename: $sitename, ')
          ..write('siteaddress: $siteaddress, ')
          ..write('numofbarn: $numofbarn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          sitename.hashCode, $mrjc(siteaddress.hashCode, numofbarn.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Site &&
          other.id == this.id &&
          other.sitename == this.sitename &&
          other.siteaddress == this.siteaddress &&
          other.numofbarn == this.numofbarn);
}

class SitesCompanion extends UpdateCompanion<Site> {
  final Value<int> id;
  final Value<String> sitename;
  final Value<String> siteaddress;
  final Value<int> numofbarn;
  const SitesCompanion({
    this.id = const Value.absent(),
    this.sitename = const Value.absent(),
    this.siteaddress = const Value.absent(),
    this.numofbarn = const Value.absent(),
  });
  SitesCompanion.insert({
    this.id = const Value.absent(),
    @required String sitename,
    @required String siteaddress,
    this.numofbarn = const Value.absent(),
  })  : sitename = Value(sitename),
        siteaddress = Value(siteaddress);
  static Insertable<Site> custom({
    Expression<int> id,
    Expression<String> sitename,
    Expression<String> siteaddress,
    Expression<int> numofbarn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sitename != null) 'sitename': sitename,
      if (siteaddress != null) 'siteaddress': siteaddress,
      if (numofbarn != null) 'numofbarn': numofbarn,
    });
  }

  SitesCompanion copyWith(
      {Value<int> id,
      Value<String> sitename,
      Value<String> siteaddress,
      Value<int> numofbarn}) {
    return SitesCompanion(
      id: id ?? this.id,
      sitename: sitename ?? this.sitename,
      siteaddress: siteaddress ?? this.siteaddress,
      numofbarn: numofbarn ?? this.numofbarn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sitename.present) {
      map['sitename'] = Variable<String>(sitename.value);
    }
    if (siteaddress.present) {
      map['siteaddress'] = Variable<String>(siteaddress.value);
    }
    if (numofbarn.present) {
      map['numofbarn'] = Variable<int>(numofbarn.value);
    }
    return map;
  }
}

class $SitesTable extends Sites with TableInfo<$SitesTable, Site> {
  final GeneratedDatabase _db;
  final String _alias;
  $SitesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _sitenameMeta = const VerificationMeta('sitename');
  GeneratedTextColumn _sitename;
  @override
  GeneratedTextColumn get sitename => _sitename ??= _constructSitename();
  GeneratedTextColumn _constructSitename() {
    return GeneratedTextColumn('sitename', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _siteaddressMeta =
      const VerificationMeta('siteaddress');
  GeneratedTextColumn _siteaddress;
  @override
  GeneratedTextColumn get siteaddress =>
      _siteaddress ??= _constructSiteaddress();
  GeneratedTextColumn _constructSiteaddress() {
    return GeneratedTextColumn('siteaddress', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _numofbarnMeta = const VerificationMeta('numofbarn');
  GeneratedIntColumn _numofbarn;
  @override
  GeneratedIntColumn get numofbarn => _numofbarn ??= _constructNumofbarn();
  GeneratedIntColumn _constructNumofbarn() {
    return GeneratedIntColumn(
      'numofbarn',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, sitename, siteaddress, numofbarn];
  @override
  $SitesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sites';
  @override
  final String actualTableName = 'sites';
  @override
  VerificationContext validateIntegrity(Insertable<Site> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('sitename')) {
      context.handle(_sitenameMeta,
          sitename.isAcceptableOrUnknown(data['sitename'], _sitenameMeta));
    } else if (isInserting) {
      context.missing(_sitenameMeta);
    }
    if (data.containsKey('siteaddress')) {
      context.handle(
          _siteaddressMeta,
          siteaddress.isAcceptableOrUnknown(
              data['siteaddress'], _siteaddressMeta));
    } else if (isInserting) {
      context.missing(_siteaddressMeta);
    }
    if (data.containsKey('numofbarn')) {
      context.handle(_numofbarnMeta,
          numofbarn.isAcceptableOrUnknown(data['numofbarn'], _numofbarnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Site map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Site.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SitesTable createAlias(String alias) {
    return $SitesTable(_db, alias);
  }
}

abstract class _$MyData extends GeneratedDatabase {
  _$MyData(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $SitesTable _sites;
  $SitesTable get sites => _sites ??= $SitesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sites];
}
