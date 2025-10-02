import '../database.dart';

class RankRequiredSkillsTable extends SupabaseTable<RankRequiredSkillsRow> {
  @override
  String get tableName => 'rank_required_skills';

  @override
  RankRequiredSkillsRow createRow(Map<String, dynamic> data) =>
      RankRequiredSkillsRow(data);
}

class RankRequiredSkillsRow extends SupabaseDataRow {
  RankRequiredSkillsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RankRequiredSkillsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get rankId => getField<int>('rank_id');
  set rankId(int? value) => setField<int>('rank_id', value);

  int? get requiredSkillId => getField<int>('required_skill_id');
  set requiredSkillId(int? value) => setField<int>('required_skill_id', value);

  double? get requiredSkillPoints => getField<double>('required_skill_points');
  set requiredSkillPoints(double? value) =>
      setField<double>('required_skill_points', value);
}
