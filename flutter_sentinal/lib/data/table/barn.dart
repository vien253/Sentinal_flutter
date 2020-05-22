import 'package:moor/moor.dart';

class SetupBarns extends Table{
  TextColumn get barnname => text().withLength(min: 1, max: 50)();
  TextColumn get sitename => text().withLength(min: 1,max: 50)();
  DateTimeColumn get Updated => dateTime().nullable()();
  IntColumn get numofbarn => integer().nullable()();
  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey => {barnname,sitename};
}