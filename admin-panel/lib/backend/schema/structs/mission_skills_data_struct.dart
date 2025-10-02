// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionSkillsDataStruct extends BaseStruct {
  MissionSkillsDataStruct({
    int? id,
    String? name,
    int? skillId,
    double? skillPoints,
    bool? isUpdated,
    bool? isDeleted,
  })  : _id = id,
        _name = name,
        _skillId = skillId,
        _skillPoints = skillPoints,
        _isUpdated = isUpdated,
        _isDeleted = isDeleted;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "skill_id" field.
  int? _skillId;
  int get skillId => _skillId ?? 0;
  set skillId(int? val) => _skillId = val;

  void incrementSkillId(int amount) => skillId = skillId + amount;

  bool hasSkillId() => _skillId != null;

  // "skill_points" field.
  double? _skillPoints;
  double get skillPoints => _skillPoints ?? 0.0;
  set skillPoints(double? val) => _skillPoints = val;

  void incrementSkillPoints(double amount) =>
      skillPoints = skillPoints + amount;

  bool hasSkillPoints() => _skillPoints != null;

  // "is_updated" field.
  bool? _isUpdated;
  bool get isUpdated => _isUpdated ?? false;
  set isUpdated(bool? val) => _isUpdated = val;

  bool hasIsUpdated() => _isUpdated != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  static MissionSkillsDataStruct fromMap(Map<String, dynamic> data) =>
      MissionSkillsDataStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        skillId: castToType<int>(data['skill_id']),
        skillPoints: castToType<double>(data['skill_points']),
        isUpdated: data['is_updated'] as bool?,
        isDeleted: data['is_deleted'] as bool?,
      );

  static MissionSkillsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MissionSkillsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'skill_id': _skillId,
        'skill_points': _skillPoints,
        'is_updated': _isUpdated,
        'is_deleted': _isDeleted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'skill_id': serializeParam(
          _skillId,
          ParamType.int,
        ),
        'skill_points': serializeParam(
          _skillPoints,
          ParamType.double,
        ),
        'is_updated': serializeParam(
          _isUpdated,
          ParamType.bool,
        ),
        'is_deleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MissionSkillsDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MissionSkillsDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        skillId: deserializeParam(
          data['skill_id'],
          ParamType.int,
          false,
        ),
        skillPoints: deserializeParam(
          data['skill_points'],
          ParamType.double,
          false,
        ),
        isUpdated: deserializeParam(
          data['is_updated'],
          ParamType.bool,
          false,
        ),
        isDeleted: deserializeParam(
          data['is_deleted'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MissionSkillsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MissionSkillsDataStruct &&
        id == other.id &&
        name == other.name &&
        skillId == other.skillId &&
        skillPoints == other.skillPoints &&
        isUpdated == other.isUpdated &&
        isDeleted == other.isDeleted;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, skillId, skillPoints, isUpdated, isDeleted]);
}

MissionSkillsDataStruct createMissionSkillsDataStruct({
  int? id,
  String? name,
  int? skillId,
  double? skillPoints,
  bool? isUpdated,
  bool? isDeleted,
}) =>
    MissionSkillsDataStruct(
      id: id,
      name: name,
      skillId: skillId,
      skillPoints: skillPoints,
      isUpdated: isUpdated,
      isDeleted: isDeleted,
    );
