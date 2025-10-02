import '../database.dart';

class MissionRequiredSkillsTable
    extends SupabaseTable<MissionRequiredSkillsRow> {
  @override
  String get tableName => 'mission_required_skills';

  @override
  MissionRequiredSkillsRow createRow(Map<String, dynamic> data) =>
      MissionRequiredSkillsRow(data);
}

class MissionRequiredSkillsRow extends SupabaseDataRow {
  MissionRequiredSkillsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MissionRequiredSkillsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get missionId => getField<int>('mission_id');
  set missionId(int? value) => setField<int>('mission_id', value);

  int? get requiredSkillId => getField<int>('required_skill_id');
  set requiredSkillId(int? value) => setField<int>('required_skill_id', value);

  double? get requiredSkillPoints => getField<double>('required_skill_points');
  set requiredSkillPoints(double? value) =>
      setField<double>('required_skill_points', value);
}
