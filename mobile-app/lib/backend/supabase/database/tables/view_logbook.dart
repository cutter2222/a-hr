import '../database.dart';

class ViewLogbookTable extends SupabaseTable<ViewLogbookRow> {
  @override
  String get tableName => 'view_logbook';

  @override
  ViewLogbookRow createRow(Map<String, dynamic> data) => ViewLogbookRow(data);
}

class ViewLogbookRow extends SupabaseDataRow {
  ViewLogbookRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewLogbookTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get entityId => getField<int>('entity_id');
  set entityId(int? value) => setField<int>('entity_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get entityType => getField<String>('entity_type');
  set entityType(String? value) => setField<String>('entity_type', value);

  int? get coinsChange => getField<int>('coins_change');
  set coinsChange(int? value) => setField<int>('coins_change', value);

  int? get skillPointsChange => getField<int>('skill_points_change');
  set skillPointsChange(int? value) =>
      setField<int>('skill_points_change', value);

  int? get xpPointsChange => getField<int>('xp_points_change');
  set xpPointsChange(int? value) => setField<int>('xp_points_change', value);

  int? get levelChange => getField<int>('level_change');
  set levelChange(int? value) => setField<int>('level_change', value);

  String? get entityName => getField<String>('entity_name');
  set entityName(String? value) => setField<String>('entity_name', value);
}
