// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestUsersStruct extends BaseStruct {
  TestUsersStruct({
    String? login,
    String? password,
  })  : _login = login,
        _password = password;

  // "login" field.
  String? _login;
  String get login => _login ?? '';
  set login(String? val) => _login = val;

  bool hasLogin() => _login != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  static TestUsersStruct fromMap(Map<String, dynamic> data) => TestUsersStruct(
        login: data['login'] as String?,
        password: data['password'] as String?,
      );

  static TestUsersStruct? maybeFromMap(dynamic data) => data is Map
      ? TestUsersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'login': _login,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'login': serializeParam(
          _login,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static TestUsersStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestUsersStruct(
        login: deserializeParam(
          data['login'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TestUsersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestUsersStruct &&
        login == other.login &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([login, password]);
}

TestUsersStruct createTestUsersStruct({
  String? login,
  String? password,
}) =>
    TestUsersStruct(
      login: login,
      password: password,
    );
