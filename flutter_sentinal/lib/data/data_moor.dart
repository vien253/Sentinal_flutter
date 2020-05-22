import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';
import '../data/table/site.dart';
import '../data/table/barn.dart';
import '../data/dao/site_dao.dart';
import '../data/dao/barn_dao.dart';
part 'data_moor.g.dart';

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


class SiteWithBarn{
  final Site site;
  final SetupBarn barn;

  SiteWithBarn(this.site,this.barn);
}




