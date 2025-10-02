import '../database.dart';

class SkillsTable extends SupabaseTable<SkillsRow> {
  @override
  String get tableName => 'skills';

  @override
  SkillsRow createRow(Map<String, dynamic> data) => SkillsRow(data);
}

class SkillsRow extends SupabaseDataRow {
  SkillsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SkillsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  double? get skillMaxPoints => getField<double>('skill_max_points');
  set skillMaxPoints(double? value) =>
      setField<double>('skill_max_points', value);
}
