import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

part 'home_database.g.dart';

@DataClassName('HomeItemRow')
class HomeItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
  TextColumn get imagePath => text()();
  TextColumn get iconName => text()();
}

@DataClassName('HomeImageRow')
class HomeImages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get path => text()();
}

@DataClassName('UserRow')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get password => text().nullable()();
}

@lazySingleton
@DriftDatabase(tables: [HomeItems, HomeImages, Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'app_database'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

      await batch((batch) {
        batch.insertAll(homeItems, [
          HomeItemsCompanion.insert(title: 'Просмотр фильмов', subtitle: 'Смотрите фильмы и сериалы онлайн', imagePath: 'assets/images/11.jpg', iconName: 'play_circle'),
          HomeItemsCompanion.insert(title: 'Подписка', subtitle: 'Оформите подписку на сервис', imagePath: 'assets/images/10.jpg', iconName: 'card_membership'),
          HomeItemsCompanion.insert(title: 'Онлайн-трансляция', subtitle: 'Прямые трансляции и премьеры', imagePath: 'assets/images/3.jpg', iconName: 'live_tv'),
          HomeItemsCompanion.insert(title: 'Личный кабинет', subtitle: 'Управляйте своим профилем', imagePath: 'assets/images/9.jpg', iconName: 'person'),
        ]);

        batch.insertAll(homeImages, [
          HomeImagesCompanion.insert(path: 'assets/images/11.jpg'),
          HomeImagesCompanion.insert(path: 'assets/images/10.jpg'),
          HomeImagesCompanion.insert(path: 'assets/images/3.jpg'),
          HomeImagesCompanion.insert(path: 'assets/images/9.jpg'),
          HomeImagesCompanion.insert(path: 'assets/images/14.png'),
        ]);

        batch.insertAll(users, [
          UsersCompanion.insert(name: 'Лукиных София Даниловна', email: 'sofilukin2@gmail.com', password: const Value('12345')),
        ]);
      });
    },
  );
}