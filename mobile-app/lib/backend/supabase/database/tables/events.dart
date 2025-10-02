import '../database.dart';

class EventsTable extends SupabaseTable<EventsRow> {
  @override
  String get tableName => 'events';

  @override
  EventsRow createRow(Map<String, dynamic> data) => EventsRow(data);
}

class EventsRow extends SupabaseDataRow {
  EventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  int? get minUsers => getField<int>('min_users');
  set minUsers(int? value) => setField<int>('min_users', value);

  int? get maxUsers => getField<int>('max_users');
  set maxUsers(int? value) => setField<int>('max_users', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  List<String> get imageProofUrls => getListField<String>('image_proof_urls');
  set imageProofUrls(List<String>? value) =>
      setListField<String>('image_proof_urls', value);

  List<String> get videoProofUrls => getListField<String>('video_proof_urls');
  set videoProofUrls(List<String>? value) =>
      setListField<String>('video_proof_urls', value);
}
