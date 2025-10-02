import '../database.dart';

class MissionSkillsTable extends SupabaseTable<MissionSkillsRow> {
  @override
  String get tableName => 'mission_skills';

  @override
  MissionSkillsRow createRow(Map<String, dynamic> data) =>
      MissionSkillsRow(data);
}

class MissionSkillsRow extends SupabaseDataRow {
  MissionSkillsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MissionSkillsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get missionId => getField<int>('mission_id');
  set missionId(int? value) => setField<int>('mission_id', value);

  int? get skillId => getField<int>('skill_id');
  set skillId(int? value) => setField<int>('skill_id', value);

  double get skillUpPoints => getField<double>('skill_up_points')!;
  set skillUpPoints(double value) => setField<double>('skill_up_points', value);
}
