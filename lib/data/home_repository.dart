import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../models/home_item.dart';
import 'home_database.dart';

@lazySingleton
class HomeRepository {
  final AppDatabase _db;

  HomeRepository(this._db);

  Future<List<HomeItem>> getHomeItems() async {
    final rows = await _db.select(_db.homeItems).get();
    return rows.map((row) => HomeItem(
      id: row.id, title: row.title, subtitle: row.subtitle, imagePath: row.imagePath, iconName: row.iconName,
    )).toList();
  }

  Future<List<String>> getHomeImages() async {
    final rows = await _db.select(_db.homeImages).get();
    return rows.map((row) => row.path).toList();
  }

  Future<UserRow?> getUser() async {
    final rows = await _db.select(_db.users).get();
    return rows.isNotEmpty ? rows.first : null;
  }

  Future<void> updateUser(String name, String email, String? password) async {
    final user = await getUser();
    if (user != null) {
      await (_db.update(_db.users)..where((t) => t.id.equals(user.id))).write(
        UsersCompanion(
          name: Value(name),
          email: Value(email),
          password: Value(password),
        ),
      );
    }
  }
}