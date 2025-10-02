import '../database.dart';

class ViewMissionSkillsTable extends SupabaseTable<ViewMissionSkillsRow> {
  @override
  String get tableName => 'view_mission_skills';

  @override
  ViewMissionSkillsRow createRow(Map<String, dynamic> data) =>
      ViewMissionSkillsRow(data);
}

class ViewMissionSkillsRow extends SupabaseDataRow {
  ViewMissionSkillsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewMissionSkillsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get missionId => getField<int>('mission_id');
  set missionId(int? value) => setField<int>('mission_id', value);

  int? get skillId => getField<int>('skill_id');
  set skillId(int? value) => setField<int>('skill_id', value);

  double? get skillUpPoints => getField<double>('skill_up_points');
  set skillUpPoints(double? value) =>
      setField<double>('skill_up_points', value);

  String? get skillName => getField<String>('skill_name');
  set skillName(String? value) => setField<String>('skill_name', value);
}
