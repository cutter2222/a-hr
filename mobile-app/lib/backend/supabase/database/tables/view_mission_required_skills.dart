import '../database.dart';

class ViewMissionRequiredSkillsTable
    extends SupabaseTable<ViewMissionRequiredSkillsRow> {
  @override
  String get tableName => 'view_mission_required_skills';

  @override
  ViewMissionRequiredSkillsRow createRow(Map<String, dynamic> data) =>
      ViewMissionRequiredSkillsRow(data);
}

class ViewMissionRequiredSkillsRow extends SupabaseDataRow {
  ViewMissionRequiredSkillsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewMissionRequiredSkillsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get missionId => getField<int>('mission_id');
  set missionId(int? value) => setField<int>('mission_id', value);

  int? get requiredSkillId => getField<int>('required_skill_id');
  set requiredSkillId(int? value) => setField<int>('required_skill_id', value);

  double? get requiredSkillPoints => getField<double>('required_skill_points');
  set requiredSkillPoints(double? value) =>
      setField<double>('required_skill_points', value);

  String? get skillName => getField<String>('skill_name');
  set skillName(String? value) => setField<String>('skill_name', value);
}
