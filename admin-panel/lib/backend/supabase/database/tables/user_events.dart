import '../database.dart';

class UserEventsTable extends SupabaseTable<UserEventsRow> {
  @override
  String get tableName => 'user_events';

  @override
  UserEventsRow createRow(Map<String, dynamic> data) => UserEventsRow(data);
}

class UserEventsRow extends SupabaseDataRow {
  UserEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserEventsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get eventId => getField<int>('event_id');
  set eventId(int? value) => setField<int>('event_id', value);
}
