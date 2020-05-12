import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';


part 'data_moor.g.dart';

@DataClassName('Site')
class Sites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sitename => text().withLength(min: 1, max: 50)();
  TextColumn get siteaddress => text().withLength(min: 1,max: 50)();
  IntColumn get numofbarn => integer().nullable()();

//  @override
//  // TODO: implement primaryKey
//  Set<Column> get primaryKey => {id};
}
LazyDatabase _openConnection(){
return LazyDatabase(()async{
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path,'db.sqlite'));
  return VmDatabase(file);
});
}
@UseMoor(tables: [Sites])
class MyData extends _$MyData{
  MyData(): super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  Future<List<Site>> getAllSites() => select(sites).get();
  Stream<List<Site>> watchAllSites() => select(sites).watch();
  Future insertSite(Site site) => into(sites).insert(site);
  Future updateSite(Site site) => update(sites).replace(site);
  Future deleteTask(Site site) => delete(sites).delete(site);
}



