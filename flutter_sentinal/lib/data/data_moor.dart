import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';




part 'data_moor.g.dart';

@DataClassName('Site')
class Sites extends Table {
  TextColumn get sitename => text().withLength(min: 1, max: 50)();
  TextColumn get siteaddress => text().withLength(min: 1,max: 50)();
  DateTimeColumn get Updated => dateTime().nullable()();
  IntColumn get numofbarn => integer().nullable()();
  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey => {sitename};
}

class SetupBarns extends Table{
  TextColumn get barnname => text().withLength(min: 1, max: 50)();
  TextColumn get sitename => text().withLength(min: 1,max: 50)();
  DateTimeColumn get Updated => dateTime().nullable()();
  IntColumn get numofbarn => integer().nullable()();
  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey => {barnname,sitename};
}

LazyDatabase _openConnection(){
return LazyDatabase(()async{
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path,'db.sqlite'));
  return VmDatabase(file);
});
}

@UseMoor(tables: [Sites, SetupBarns], daos: [SiteDao, SetupBarnDao])
class MyData extends _$MyData{
  MyData(): super(_openConnection());
  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from == 1) await migrator.createTable(setupBarns);
    },

  );

}
@UseDao(tables: [Sites])
class SiteDao extends DatabaseAccessor<MyData> with _$SiteDaoMixin{
  final MyData db;

  SiteDao(this.db): super(db);

  Future<List<Site>> getAllSites() => select(sites).get();
  Stream<List<Site>> watchAllSites() => select(sites).watch();
  Future insertSite(Site site) => into(sites).insert(site);
  Future updateSite(Site site) => update(sites).replace(site);
  Future deleteSite(Site site) => delete(sites).delete(site);
}
@UseDao(tables:  [SetupBarns])
class SetupBarnDao extends DatabaseAccessor<MyData> with _$SetupBarnDaoMixin{
  final MyData db;

  SetupBarnDao(this.db) : super(db);

  Stream<List<SetupBarn>> watchSetupBarn()=> select(setupBarns).watch();
  Stream<List<SetupBarn>> watchSetupBarnSiteName(String s){
      return (select(setupBarns)..where((tbl) => tbl.sitename.equals(s.trim()))).watch();
  }
  Future insertSetupBarn(SetupBarn barn) => into(setupBarns).insert(barn);
//  Future deleteBarn(SetupBarn barn) => delete(setupBarns).delete(barn);
}
class SiteWithBarn{
  final Site site;
  final SetupBarn barn;

  SiteWithBarn(this.site,this.barn);
}




