// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionFormStruct extends BaseStruct {
  MissionFormStruct({
    String? title,
    List<MissionFormDataStruct>? missionFormData,
  })  : _title = title,
        _missionFormData = missionFormData;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "mission_form_data" field.
  List<MissionFormDataStruct>? _missionFormData;
  List<MissionFormDataStruct> get missionFormData =>
      _missionFormData ?? const [];
  set missionFormData(List<MissionFormDataStruct>? val) =>
      _missionFormData = val;

  void updateMissionFormData(Function(List<MissionFormDataStruct>) updateFn) {
    updateFn(_missionFormData ??= []);
  }

  bool hasMissionFormData() => _missionFormData != null;

  static MissionFormStruct fromMap(Map<String, dynamic> data) =>
      MissionFormStruct(
        title: data['title'] as String?,
        missionFormData: getStructList(
          data['mission_form_data'],
          MissionFormDataStruct.fromMap,
        ),
      );

  static MissionFormStruct? maybeFromMap(dynamic data) => data is Map
      ? MissionFormStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'mission_form_data': _missionFormData?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'mission_form_data': serializeParam(
          _missionFormData,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MissionFormStruct fromSerializableMap(Map<String, dynamic> data) =>
      MissionFormStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        missionFormData: deserializeStructParam<MissionFormDataStruct>(
          data['mission_form_data'],
          ParamType.DataStruct,
          true,
          structBuilder: MissionFormDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MissionFormStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MissionFormStruct &&
        title == other.title &&
        listEquality.equals(missionFormData, other.missionFormData);
  }

  @override
  int get hashCode => const ListEquality().hash([title, missionFormData]);
}

MissionFormStruct createMissionFormStruct({
  String? title,
}) =>
    MissionFormStruct(
      title: title,
    );
