
import '../table/barn.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import '../data_moor.dart';

part 'barn_dao.g.dart';

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