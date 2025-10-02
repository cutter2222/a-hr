import '../database.dart';

class LogbookTable extends SupabaseTable<LogbookRow> {
  @override
  String get tableName => 'logbook';

  @override
  LogbookRow createRow(Map<String, dynamic> data) => LogbookRow(data);
}

class LogbookRow extends SupabaseDataRow {
  LogbookRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LogbookTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get entityId => getField<int>('entity_id');
  set entityId(int? value) => setField<int>('entity_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get entityType => getField<String>('entity_type');
  set entityType(String? value) => setField<String>('entity_type', value);

  int? get skillPointsChange => getField<int>('skill_points_change');
  set skillPointsChange(int? value) =>
      setField<int>('skill_points_change', value);

  int? get xpPointsChange => getField<int>('xp_points_change');
  set xpPointsChange(int? value) => setField<int>('xp_points_change', value);

  int? get levelChange => getField<int>('level_change');
  set levelChange(int? value) => setField<int>('level_change', value);

  int? get coinsChange => getField<int>('coins_change');
  set coinsChange(int? value) => setField<int>('coins_change', value);
}
