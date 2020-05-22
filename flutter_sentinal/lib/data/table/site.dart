import 'package:moor/moor.dart';

@DataClassName('Site')
class Sites extends Table {
  TextColumn get sitename => text().withLength(min: 1, max: 50)();
  TextColumn get siteaddress => text().withLength(min: 1,max: 50)();
  TextColumn get imagesite => text().nullable()();
  DateTimeColumn get Updated => dateTime().nullable()();
  IntColumn get numofbarn => integer().nullable()();
  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey => {sitename};
}