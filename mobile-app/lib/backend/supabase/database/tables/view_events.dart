import '../database.dart';

class ViewEventsTable extends SupabaseTable<ViewEventsRow> {
  @override
  String get tableName => 'view_events';

  @override
  ViewEventsRow createRow(Map<String, dynamic> data) => ViewEventsRow(data);
}

class ViewEventsRow extends SupabaseDataRow {
  ViewEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewEventsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get minUsers => getField<int>('min_users');
  set minUsers(int? value) => setField<int>('min_users', value);

  int? get maxUsers => getField<int>('max_users');
  set maxUsers(int? value) => setField<int>('max_users', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get userFirstName => getField<String>('user_first_name');
  set userFirstName(String? value) =>
      setField<String>('user_first_name', value);

  String? get userLastName => getField<String>('user_last_name');
  set userLastName(String? value) => setField<String>('user_last_name', value);

  String? get userPhotoUrl => getField<String>('user_photo_url');
  set userPhotoUrl(String? value) => setField<String>('user_photo_url', value);

  int? get participantCount => getField<int>('participant_count');
  set participantCount(int? value) => setField<int>('participant_count', value);
}
