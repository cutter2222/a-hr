// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionFormDataStruct extends BaseStruct {
  MissionFormDataStruct({
    String? label,
    String? myText,
  })  : _label = label,
        _myText = myText;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "my_text" field.
  String? _myText;
  String get myText => _myText ?? '';
  set myText(String? val) => _myText = val;

  bool hasMyText() => _myText != null;

  static MissionFormDataStruct fromMap(Map<String, dynamic> data) =>
      MissionFormDataStruct(
        label: data['label'] as String?,
        myText: data['my_text'] as String?,
      );

  static MissionFormDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MissionFormDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'my_text': _myText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'my_text': serializeParam(
          _myText,
          ParamType.String,
        ),
      }.withoutNulls;

  static MissionFormDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MissionFormDataStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        myText: deserializeParam(
          data['my_text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MissionFormDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MissionFormDataStruct &&
        label == other.label &&
        myText == other.myText;
  }

  @override
  int get hashCode => const ListEquality().hash([label, myText]);
}

MissionFormDataStruct createMissionFormDataStruct({
  String? label,
  String? myText,
}) =>
    MissionFormDataStruct(
      label: label,
      myText: myText,
    );
