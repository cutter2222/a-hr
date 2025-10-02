import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<OptionLabelStruct> _missionType = [
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"start\",\"label\":\"Стартовая миссия\"}')),
    OptionLabelStruct.fromSerializableMap(jsonDecode(
        '{\"option\":\"take_photo_video\",\"label\":\"Сделать фото / видео\"}')),
    OptionLabelStruct.fromSerializableMap(jsonDecode(
        '{\"option\":\"gallery_photo_video\",\"label\":\"Выбрать фото / видео из галереи\"}')),
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"file\",\"label\":\"Загрузить файл\"}')),
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"quiz\",\"label\":\"Квиз\"}')),
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"questionnaire\",\"label\":\"Опросник\"}')),
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"form\",\"label\":\"Форма\"}'))
  ];
  List<OptionLabelStruct> get missionType => _missionType;
  set missionType(List<OptionLabelStruct> value) {
    _missionType = value;
  }

  void addToMissionType(OptionLabelStruct value) {
    missionType.add(value);
  }

  void removeFromMissionType(OptionLabelStruct value) {
    missionType.remove(value);
  }

  void removeAtIndexFromMissionType(int index) {
    missionType.removeAt(index);
  }

  void updateMissionTypeAtIndex(
    int index,
    OptionLabelStruct Function(OptionLabelStruct) updateFn,
  ) {
    missionType[index] = updateFn(_missionType[index]);
  }

  void insertAtIndexInMissionType(int index, OptionLabelStruct value) {
    missionType.insert(index, value);
  }

  List<OptionLabelStruct> _userMissionStatus = [
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"pending\",\"label\":\"В обработке\"}')),
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"completed\",\"label\":\"Выполнено\"}')),
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"failed\",\"label\":\"Провален\"}'))
  ];
  List<OptionLabelStruct> get userMissionStatus => _userMissionStatus;
  set userMissionStatus(List<OptionLabelStruct> value) {
    _userMissionStatus = value;
  }

  void addToUserMissionStatus(OptionLabelStruct value) {
    userMissionStatus.add(value);
  }

  void removeFromUserMissionStatus(OptionLabelStruct value) {
    userMissionStatus.remove(value);
  }

  void removeAtIndexFromUserMissionStatus(int index) {
    userMissionStatus.removeAt(index);
  }

  void updateUserMissionStatusAtIndex(
    int index,
    OptionLabelStruct Function(OptionLabelStruct) updateFn,
  ) {
    userMissionStatus[index] = updateFn(_userMissionStatus[index]);
  }

  void insertAtIndexInUserMissionStatus(int index, OptionLabelStruct value) {
    userMissionStatus.insert(index, value);
  }

  List<OptionLabelStruct> _globalRole = [
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"candidate\",\"label\":\"Кандидат\"}')),
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"employee\",\"label\":\"Сотрудник\"}')),
    OptionLabelStruct.fromSerializableMap(
        jsonDecode('{\"option\":\"all\",\"label\":\"Все\"}'))
  ];
  List<OptionLabelStruct> get globalRole => _globalRole;
  set globalRole(List<OptionLabelStruct> value) {
    _globalRole = value;
  }

  void addToGlobalRole(OptionLabelStruct value) {
    globalRole.add(value);
  }

  void removeFromGlobalRole(OptionLabelStruct value) {
    globalRole.remove(value);
  }

  void removeAtIndexFromGlobalRole(int index) {
    globalRole.removeAt(index);
  }

  void updateGlobalRoleAtIndex(
    int index,
    OptionLabelStruct Function(OptionLabelStruct) updateFn,
  ) {
    globalRole[index] = updateFn(_globalRole[index]);
  }

  void insertAtIndexInGlobalRole(int index, OptionLabelStruct value) {
    globalRole.insert(index, value);
  }
}
