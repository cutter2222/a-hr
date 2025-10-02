// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionLabelStruct extends BaseStruct {
  OptionLabelStruct({
    String? option,
    String? label,
  })  : _option = option,
        _label = label;

  // "option" field.
  String? _option;
  String get option => _option ?? '';
  set option(String? val) => _option = val;

  bool hasOption() => _option != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  static OptionLabelStruct fromMap(Map<String, dynamic> data) =>
      OptionLabelStruct(
        option: data['option'] as String?,
        label: data['label'] as String?,
      );

  static OptionLabelStruct? maybeFromMap(dynamic data) => data is Map
      ? OptionLabelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'option': _option,
        'label': _label,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'option': serializeParam(
          _option,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
      }.withoutNulls;

  static OptionLabelStruct fromSerializableMap(Map<String, dynamic> data) =>
      OptionLabelStruct(
        option: deserializeParam(
          data['option'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OptionLabelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OptionLabelStruct &&
        option == other.option &&
        label == other.label;
  }

  @override
  int get hashCode => const ListEquality().hash([option, label]);
}

OptionLabelStruct createOptionLabelStruct({
  String? option,
  String? label,
}) =>
    OptionLabelStruct(
      option: option,
      label: label,
    );
