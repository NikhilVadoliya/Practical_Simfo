import 'package:simform_practical/core/app_string.dart';
import 'package:simform_practical/data/model/user.dart';
import 'package:simform_practical/data/model/user_response.dart';
import 'package:simform_practical/data/remote/api_provider.dart';
import 'package:dio/dio.dart';

class UserRemoteRepository {
  final BaseApiProvider baseApiProvider;

  UserRemoteRepository(this.baseApiProvider);

  Future<List<User>> getUserFromRemote() async {
    Response response = await baseApiProvider.getMethod('?results=100');
    if (response.statusCode == 200) {
      return Future.value(UserResponse.fromJson(response.data['results']).results);
    } else {
      throw Exception(AppString.somethingWentWrong);
    }
  }
}
