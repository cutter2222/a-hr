import '../database.dart';

class ViewSkillsTable extends SupabaseTable<ViewSkillsRow> {
  @override
  String get tableName => 'view_skills';

  @override
  ViewSkillsRow createRow(Map<String, dynamic> data) => ViewSkillsRow(data);
}

class ViewSkillsRow extends SupabaseDataRow {
  ViewSkillsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewSkillsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  double? get skillMaxPoints => getField<double>('skill_max_points');
  set skillMaxPoints(double? value) =>
      setField<double>('skill_max_points', value);

  double? get userSkillPoints => getField<double>('user_skill_points');
  set userSkillPoints(double? value) =>
      setField<double>('user_skill_points', value);

  DateTime? get userSkillsUpdatedAt =>
      getField<DateTime>('user_skills_updated_at');
  set userSkillsUpdatedAt(DateTime? value) =>
      setField<DateTime>('user_skills_updated_at', value);
}
