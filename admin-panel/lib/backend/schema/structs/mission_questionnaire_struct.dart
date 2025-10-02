// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionQuestionnaireStruct extends BaseStruct {
  MissionQuestionnaireStruct({
    List<MissionQuestionnaireDataStruct>? missionQuestionnaireData,
  }) : _missionQuestionnaireData = missionQuestionnaireData;

  // "mission_questionnaire_data" field.
  List<MissionQuestionnaireDataStruct>? _missionQuestionnaireData;
  List<MissionQuestionnaireDataStruct> get missionQuestionnaireData =>
      _missionQuestionnaireData ?? const [];
  set missionQuestionnaireData(List<MissionQuestionnaireDataStruct>? val) =>
      _missionQuestionnaireData = val;

  void updateMissionQuestionnaireData(
      Function(List<MissionQuestionnaireDataStruct>) updateFn) {
    updateFn(_missionQuestionnaireData ??= []);
  }

  bool hasMissionQuestionnaireData() => _missionQuestionnaireData != null;

  static MissionQuestionnaireStruct fromMap(Map<String, dynamic> data) =>
      MissionQuestionnaireStruct(
        missionQuestionnaireData: getStructList(
          data['mission_questionnaire_data'],
          MissionQuestionnaireDataStruct.fromMap,
        ),
      );

  static MissionQuestionnaireStruct? maybeFromMap(dynamic data) => data is Map
      ? MissionQuestionnaireStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mission_questionnaire_data':
            _missionQuestionnaireData?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mission_questionnaire_data': serializeParam(
          _missionQuestionnaireData,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MissionQuestionnaireStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MissionQuestionnaireStruct(
        missionQuestionnaireData:
            deserializeStructParam<MissionQuestionnaireDataStruct>(
          data['mission_questionnaire_data'],
          ParamType.DataStruct,
          true,
          structBuilder: MissionQuestionnaireDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MissionQuestionnaireStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MissionQuestionnaireStruct &&
        listEquality.equals(
            missionQuestionnaireData, other.missionQuestionnaireData);
  }

  @override
  int get hashCode => const ListEquality().hash([missionQuestionnaireData]);
}

MissionQuestionnaireStruct createMissionQuestionnaireStruct() =>
    MissionQuestionnaireStruct();
