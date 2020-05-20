// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_moor.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Site extends DataClass implements Insertable<Site> {
  final String sitename;
  final String siteaddress;
  final DateTime Updated;
  final int numofbarn;
  Site(
      {@required this.sitename,
      @required this.siteaddress,
      this.Updated,
      this.numofbarn});
  factory Site.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return Site(
      sitename: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sitename']),
      siteaddress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}siteaddress']),
      Updated: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated']),
      numofbarn:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}numofbarn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || sitename != null) {
      map['sitename'] = Variable<String>(sitename);
    }
    if (!nullToAbsent || siteaddress != null) {
      map['siteaddress'] = Variable<String>(siteaddress);
    }
    if (!nullToAbsent || Updated != null) {
      map['updated'] = Variable<DateTime>(Updated);
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
      sitename: serializer.fromJson<String>(json['sitename']),
      siteaddress: serializer.fromJson<String>(json['siteaddress']),
      Updated: serializer.fromJson<DateTime>(json['Updated']),
      numofbarn: serializer.fromJson<int>(json['numofbarn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sitename': serializer.toJson<String>(sitename),
      'siteaddress': serializer.toJson<String>(siteaddress),
      'Updated': serializer.toJson<DateTime>(Updated),
      'numofbarn': serializer.toJson<int>(numofbarn),
    };
  }

  Site copyWith(
          {String sitename,
          String siteaddress,
          DateTime Updated,
          int numofbarn}) =>
      Site(
        sitename: sitename ?? this.sitename,
        siteaddress: siteaddress ?? this.siteaddress,
        Updated: Updated ?? this.Updated,
        numofbarn: numofbarn ?? this.numofbarn,
      );
  @override
  String toString() {
    return (StringBuffer('Site(')
          ..write('sitename: $sitename, ')
          ..write('siteaddress: $siteaddress, ')
          ..write('Updated: $Updated, ')
          ..write('numofbarn: $numofbarn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      sitename.hashCode,
      $mrjc(
          siteaddress.hashCode, $mrjc(Updated.hashCode, numofbarn.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Site &&
          other.sitename == this.sitename &&
          other.siteaddress == this.siteaddress &&
          other.Updated == this.Updated &&
          other.numofbarn == this.numofbarn);
}

class SitesCompanion extends UpdateCompanion<Site> {
  final Value<String> sitename;
  final Value<String> siteaddress;
  final Value<DateTime> Updated;
  final Value<int> numofbarn;
  const SitesCompanion({
    this.sitename = const Value.absent(),
    this.siteaddress = const Value.absent(),
    this.Updated = const Value.absent(),
    this.numofbarn = const Value.absent(),
  });
  SitesCompanion.insert({
    @required String sitename,
    @required String siteaddress,
    this.Updated = const Value.absent(),
    this.numofbarn = const Value.absent(),
  })  : sitename = Value(sitename),
        siteaddress = Value(siteaddress);
  static Insertable<Site> custom({
    Expression<String> sitename,
    Expression<String> siteaddress,
    Expression<DateTime> Updated,
    Expression<int> numofbarn,
  }) {
    return RawValuesInsertable({
      if (sitename != null) 'sitename': sitename,
      if (siteaddress != null) 'siteaddress': siteaddress,
      if (Updated != null) 'updated': Updated,
      if (numofbarn != null) 'numofbarn': numofbarn,
    });
  }

  SitesCompanion copyWith(
      {Value<String> sitename,
      Value<String> siteaddress,
      Value<DateTime> Updated,
      Value<int> numofbarn}) {
    return SitesCompanion(
      sitename: sitename ?? this.sitename,
      siteaddress: siteaddress ?? this.siteaddress,
      Updated: Updated ?? this.Updated,
      numofbarn: numofbarn ?? this.numofbarn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sitename.present) {
      map['sitename'] = Variable<String>(sitename.value);
    }
    if (siteaddress.present) {
      map['siteaddress'] = Variable<String>(siteaddress.value);
    }
    if (Updated.present) {
      map['updated'] = Variable<DateTime>(Updated.value);
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

  final VerificationMeta _UpdatedMeta = const VerificationMeta('Updated');
  GeneratedDateTimeColumn _Updated;
  @override
  GeneratedDateTimeColumn get Updated => _Updated ??= _constructUpdated();
  GeneratedDateTimeColumn _constructUpdated() {
    return GeneratedDateTimeColumn(
      'updated',
      $tableName,
      true,
    );
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
  List<GeneratedColumn> get $columns =>
      [sitename, siteaddress, Updated, numofbarn];
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
    if (data.containsKey('updated')) {
      context.handle(_UpdatedMeta,
          Updated.isAcceptableOrUnknown(data['updated'], _UpdatedMeta));
    }
    if (data.containsKey('numofbarn')) {
      context.handle(_numofbarnMeta,
          numofbarn.isAcceptableOrUnknown(data['numofbarn'], _numofbarnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sitename};
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

class SetupBarn extends DataClass implements Insertable<SetupBarn> {
  final String barnname;
  final String sitename;
  final DateTime Updated;
  final int numofbarn;
  SetupBarn(
      {@required this.barnname,
      @required this.sitename,
      this.Updated,
      this.numofbarn});
  factory SetupBarn.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return SetupBarn(
      barnname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}barnname']),
      sitename: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sitename']),
      Updated: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated']),
      numofbarn:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}numofbarn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || barnname != null) {
      map['barnname'] = Variable<String>(barnname);
    }
    if (!nullToAbsent || sitename != null) {
      map['sitename'] = Variable<String>(sitename);
    }
    if (!nullToAbsent || Updated != null) {
      map['updated'] = Variable<DateTime>(Updated);
    }
    if (!nullToAbsent || numofbarn != null) {
      map['numofbarn'] = Variable<int>(numofbarn);
    }
    return map;
  }

  factory SetupBarn.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SetupBarn(
      barnname: serializer.fromJson<String>(json['barnname']),
      sitename: serializer.fromJson<String>(json['sitename']),
      Updated: serializer.fromJson<DateTime>(json['Updated']),
      numofbarn: serializer.fromJson<int>(json['numofbarn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'barnname': serializer.toJson<String>(barnname),
      'sitename': serializer.toJson<String>(sitename),
      'Updated': serializer.toJson<DateTime>(Updated),
      'numofbarn': serializer.toJson<int>(numofbarn),
    };
  }

  SetupBarn copyWith(
          {String barnname,
          String sitename,
          DateTime Updated,
          int numofbarn}) =>
      SetupBarn(
        barnname: barnname ?? this.barnname,
        sitename: sitename ?? this.sitename,
        Updated: Updated ?? this.Updated,
        numofbarn: numofbarn ?? this.numofbarn,
      );
  @override
  String toString() {
    return (StringBuffer('SetupBarn(')
          ..write('barnname: $barnname, ')
          ..write('sitename: $sitename, ')
          ..write('Updated: $Updated, ')
          ..write('numofbarn: $numofbarn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(barnname.hashCode,
      $mrjc(sitename.hashCode, $mrjc(Updated.hashCode, numofbarn.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SetupBarn &&
          other.barnname == this.barnname &&
          other.sitename == this.sitename &&
          other.Updated == this.Updated &&
          other.numofbarn == this.numofbarn);
}

class SetupBarnsCompanion extends UpdateCompanion<SetupBarn> {
  final Value<String> barnname;
  final Value<String> sitename;
  final Value<DateTime> Updated;
  final Value<int> numofbarn;
  const SetupBarnsCompanion({
    this.barnname = const Value.absent(),
    this.sitename = const Value.absent(),
    this.Updated = const Value.absent(),
    this.numofbarn = const Value.absent(),
  });
  SetupBarnsCompanion.insert({
    @required String barnname,
    @required String sitename,
    this.Updated = const Value.absent(),
    this.numofbarn = const Value.absent(),
  })  : barnname = Value(barnname),
        sitename = Value(sitename);
  static Insertable<SetupBarn> custom({
    Expression<String> barnname,
    Expression<String> sitename,
    Expression<DateTime> Updated,
    Expression<int> numofbarn,
  }) {
    return RawValuesInsertable({
      if (barnname != null) 'barnname': barnname,
      if (sitename != null) 'sitename': sitename,
      if (Updated != null) 'updated': Updated,
      if (numofbarn != null) 'numofbarn': numofbarn,
    });
  }

  SetupBarnsCompanion copyWith(
      {Value<String> barnname,
      Value<String> sitename,
      Value<DateTime> Updated,
      Value<int> numofbarn}) {
    return SetupBarnsCompanion(
      barnname: barnname ?? this.barnname,
      sitename: sitename ?? this.sitename,
      Updated: Updated ?? this.Updated,
      numofbarn: numofbarn ?? this.numofbarn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (barnname.present) {
      map['barnname'] = Variable<String>(barnname.value);
    }
    if (sitename.present) {
      map['sitename'] = Variable<String>(sitename.value);
    }
    if (Updated.present) {
      map['updated'] = Variable<DateTime>(Updated.value);
    }
    if (numofbarn.present) {
      map['numofbarn'] = Variable<int>(numofbarn.value);
    }
    return map;
  }
}

class $SetupBarnsTable extends SetupBarns
    with TableInfo<$SetupBarnsTable, SetupBarn> {
  final GeneratedDatabase _db;
  final String _alias;
  $SetupBarnsTable(this._db, [this._alias]);
  final VerificationMeta _barnnameMeta = const VerificationMeta('barnname');
  GeneratedTextColumn _barnname;
  @override
  GeneratedTextColumn get barnname => _barnname ??= _constructBarnname();
  GeneratedTextColumn _constructBarnname() {
    return GeneratedTextColumn('barnname', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _sitenameMeta = const VerificationMeta('sitename');
  GeneratedTextColumn _sitename;
  @override
  GeneratedTextColumn get sitename => _sitename ??= _constructSitename();
  GeneratedTextColumn _constructSitename() {
    return GeneratedTextColumn('sitename', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _UpdatedMeta = const VerificationMeta('Updated');
  GeneratedDateTimeColumn _Updated;
  @override
  GeneratedDateTimeColumn get Updated => _Updated ??= _constructUpdated();
  GeneratedDateTimeColumn _constructUpdated() {
    return GeneratedDateTimeColumn(
      'updated',
      $tableName,
      true,
    );
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
  List<GeneratedColumn> get $columns =>
      [barnname, sitename, Updated, numofbarn];
  @override
  $SetupBarnsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'setup_barns';
  @override
  final String actualTableName = 'setup_barns';
  @override
  VerificationContext validateIntegrity(Insertable<SetupBarn> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('barnname')) {
      context.handle(_barnnameMeta,
          barnname.isAcceptableOrUnknown(data['barnname'], _barnnameMeta));
    } else if (isInserting) {
      context.missing(_barnnameMeta);
    }
    if (data.containsKey('sitename')) {
      context.handle(_sitenameMeta,
          sitename.isAcceptableOrUnknown(data['sitename'], _sitenameMeta));
    } else if (isInserting) {
      context.missing(_sitenameMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_UpdatedMeta,
          Updated.isAcceptableOrUnknown(data['updated'], _UpdatedMeta));
    }
    if (data.containsKey('numofbarn')) {
      context.handle(_numofbarnMeta,
          numofbarn.isAcceptableOrUnknown(data['numofbarn'], _numofbarnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {barnname, sitename};
  @override
  SetupBarn map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SetupBarn.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SetupBarnsTable createAlias(String alias) {
    return $SetupBarnsTable(_db, alias);
  }
}

abstract class _$MyData extends GeneratedDatabase {
  _$MyData(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $SitesTable _sites;
  $SitesTable get sites => _sites ??= $SitesTable(this);
  $SetupBarnsTable _setupBarns;
  $SetupBarnsTable get setupBarns => _setupBarns ??= $SetupBarnsTable(this);
  SiteDao _siteDao;
  SiteDao get siteDao => _siteDao ??= SiteDao(this as MyData);
  SetupBarnDao _setupBarnDao;
  SetupBarnDao get setupBarnDao =>
      _setupBarnDao ??= SetupBarnDao(this as MyData);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sites, setupBarns];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$SiteDaoMixin on DatabaseAccessor<MyData> {
  $SitesTable get sites => attachedDatabase.sites;
}
mixin _$SetupBarnDaoMixin on DatabaseAccessor<MyData> {
  $SetupBarnsTable get setupBarns => attachedDatabase.setupBarns;
}
