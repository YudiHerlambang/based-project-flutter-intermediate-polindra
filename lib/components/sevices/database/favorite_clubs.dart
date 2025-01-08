import 'package:drift/drift.dart';

class FavoriteClubs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idTeam => text()();
  TextColumn get strTeam => text()();
  TextColumn get strDescriptionEN => text()();
  TextColumn get strBadge => text()();
  TextColumn get strStadium => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}
