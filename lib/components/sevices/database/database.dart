import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'favorite_clubs.dart';

part 'database.g.dart';

@DriftDatabase(tables: [FavoriteClubs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: "football_club_database",
    );
  }
}
