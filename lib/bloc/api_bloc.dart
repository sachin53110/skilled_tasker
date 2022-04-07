import 'package:flutter/cupertino.dart';
import 'package:skilled_tasker/Models/home_response.dart';
import 'package:skilled_tasker/Models/login_response.dart';
import 'package:skilled_tasker/resources/api_provider.dart';
import 'package:skilled_tasker/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ApiBloc {
  final _repository = Repository();
  final _loginFetcher = PublishSubject<LoginResponse>();
  final _getListFetcher = PublishSubject<Results>();

  Stream<LoginResponse> get login => _loginFetcher.stream;
  Stream<Results> get getlist => _getListFetcher;
  loginApi(Map<String, dynamic> queryParameters) async {
    LoginResponse loginResponse = await _repository.login(queryParameters);
    _loginFetcher.sink.add(loginResponse);
  }

  // getListApi() async {
  //   Results homeList = await _repository.getList();
  //   _getListFetcher.sink.add(homeList);
  // }
}

final bloc = ApiBloc();
