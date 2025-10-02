import '../database.dart';

class UserMissionsTable extends SupabaseTable<UserMissionsRow> {
  @override
  String get tableName => 'user_missions';

  @override
  UserMissionsRow createRow(Map<String, dynamic> data) => UserMissionsRow(data);
}

class UserMissionsRow extends SupabaseDataRow {
  UserMissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserMissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get startedAt => getField<DateTime>('started_at')!;
  set startedAt(DateTime value) => setField<DateTime>('started_at', value);

  DateTime? get competedAt => getField<DateTime>('competed_at');
  set competedAt(DateTime? value) => setField<DateTime>('competed_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get missionId => getField<int>('mission_id')!;
  set missionId(int value) => setField<int>('mission_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  dynamic get playload => getField<dynamic>('playload');
  set playload(dynamic value) => setField<dynamic>('playload', value);
}
