import 'package:simform_practical/data/local/user/user_table.dart';
import 'package:simform_practical/data/model/user.dart';

abstract class UserLocalRepository {
  Future<int> insertUserDB(UserLocalCompanion userCompanion);

  Future<void> insertListOfUserDB(List<User> user);

  Future<List<UserLocalData>> getUsersFromDB();

  Future<int> deleteUsersDB();
}

class UserLocalRepositoryImpl implements UserLocalRepository {
  UserLocalRepositoryImpl({
    required AppDatabase appDatabaseManager,
  }) : _appDatabaseManager = appDatabaseManager;

  late final AppDatabase _appDatabaseManager;

  @override
  Future<int> insertUserDB(UserLocalCompanion userCompanion) async {
    return await _appDatabaseManager.insertUser(userCompanion);
  }

  @override
  Future<List<UserLocalData>> getUsersFromDB() async {
    return await _appDatabaseManager.getUserList();
  }

  @override
  Future<int> deleteUsersDB() async {
    return _appDatabaseManager.deleteUser();
  }

  @override
  Future<void> insertListOfUserDB(List<User> users) async {
    return await Future.forEach(users, (user) async {
      await _appDatabaseManager.insertUser(UserLocalCompanion.insert(
          gender: user.gender, email: user.email, phone: user.phone, name: user.name.fullName));
    });
  }
}
