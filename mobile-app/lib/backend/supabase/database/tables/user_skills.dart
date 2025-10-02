import '../database.dart';

class UserSkillsTable extends SupabaseTable<UserSkillsRow> {
  @override
  String get tableName => 'user_skills';

  @override
  UserSkillsRow createRow(Map<String, dynamic> data) => UserSkillsRow(data);
}

class UserSkillsRow extends SupabaseDataRow {
  UserSkillsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserSkillsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get skillId => getField<int>('skill_id');
  set skillId(int? value) => setField<int>('skill_id', value);

  double get skillPoints => getField<double>('skill_points')!;
  set skillPoints(double value) => setField<double>('skill_points', value);
}
