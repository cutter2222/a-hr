// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionQuizStruct extends BaseStruct {
  MissionQuizStruct({
    List<MissionQuizDataStruct>? missionQuizData,
  }) : _missionQuizData = missionQuizData;

  // "mission_quiz_data" field.
  List<MissionQuizDataStruct>? _missionQuizData;
  List<MissionQuizDataStruct> get missionQuizData =>
      _missionQuizData ?? const [];
  set missionQuizData(List<MissionQuizDataStruct>? val) =>
      _missionQuizData = val;

  void updateMissionQuizData(Function(List<MissionQuizDataStruct>) updateFn) {
    updateFn(_missionQuizData ??= []);
  }

  bool hasMissionQuizData() => _missionQuizData != null;

  static MissionQuizStruct fromMap(Map<String, dynamic> data) =>
      MissionQuizStruct(
        missionQuizData: getStructList(
          data['mission_quiz_data'],
          MissionQuizDataStruct.fromMap,
        ),
      );

  static MissionQuizStruct? maybeFromMap(dynamic data) => data is Map
      ? MissionQuizStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mission_quiz_data': _missionQuizData?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mission_quiz_data': serializeParam(
          _missionQuizData,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MissionQuizStruct fromSerializableMap(Map<String, dynamic> data) =>
      MissionQuizStruct(
        missionQuizData: deserializeStructParam<MissionQuizDataStruct>(
          data['mission_quiz_data'],
          ParamType.DataStruct,
          true,
          structBuilder: MissionQuizDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MissionQuizStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MissionQuizStruct &&
        listEquality.equals(missionQuizData, other.missionQuizData);
  }

  @override
  int get hashCode => const ListEquality().hash([missionQuizData]);
}

MissionQuizStruct createMissionQuizStruct() => MissionQuizStruct();
