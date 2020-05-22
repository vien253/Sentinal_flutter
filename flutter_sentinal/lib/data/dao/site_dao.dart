import '../table/site.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import '../data_moor.dart';

part 'site_dao.g.dart';

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