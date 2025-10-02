import '../database.dart';

class ViewUserEventsTable extends SupabaseTable<ViewUserEventsRow> {
  @override
  String get tableName => 'view_user_events';

  @override
  ViewUserEventsRow createRow(Map<String, dynamic> data) =>
      ViewUserEventsRow(data);
}

class ViewUserEventsRow extends SupabaseDataRow {
  ViewUserEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserEventsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get eventId => getField<int>('event_id');
  set eventId(int? value) => setField<int>('event_id', value);

  String? get userFirstName => getField<String>('user_first_name');
  set userFirstName(String? value) =>
      setField<String>('user_first_name', value);

  String? get userLastName => getField<String>('user_last_name');
  set userLastName(String? value) => setField<String>('user_last_name', value);

  String? get userPhotoUrl => getField<String>('user_photo_url');
  set userPhotoUrl(String? value) => setField<String>('user_photo_url', value);
}
