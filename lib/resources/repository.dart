import 'package:skilled_tasker/Models/home_response.dart';
import 'package:skilled_tasker/Models/login_response.dart';
import 'package:skilled_tasker/resources/api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<LoginResponse> login(Map<String, dynamic> queryParameters) =>
      apiProvider.login(queryParameters);
  // Future<Results> getList() => apiProvider.getList();
}
