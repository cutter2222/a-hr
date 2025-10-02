import '../database.dart';

class ViewUserMissionsTable extends SupabaseTable<ViewUserMissionsRow> {
  @override
  String get tableName => 'view_user_missions';

  @override
  ViewUserMissionsRow createRow(Map<String, dynamic> data) =>
      ViewUserMissionsRow(data);
}

class ViewUserMissionsRow extends SupabaseDataRow {
  ViewUserMissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserMissionsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);

  DateTime? get competedAt => getField<DateTime>('competed_at');
  set competedAt(DateTime? value) => setField<DateTime>('competed_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get missionId => getField<int>('mission_id');
  set missionId(int? value) => setField<int>('mission_id', value);

  dynamic get playload => getField<dynamic>('playload');
  set playload(dynamic value) => setField<dynamic>('playload', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get missionTitle => getField<String>('mission_title');
  set missionTitle(String? value) => setField<String>('mission_title', value);

  String? get missionType => getField<String>('mission_type');
  set missionType(String? value) => setField<String>('mission_type', value);

  int? get missionCoins => getField<int>('mission_coins');
  set missionCoins(int? value) => setField<int>('mission_coins', value);

  String? get userFirstName => getField<String>('user_first_name');
  set userFirstName(String? value) =>
      setField<String>('user_first_name', value);

  String? get userLastName => getField<String>('user_last_name');
  set userLastName(String? value) => setField<String>('user_last_name', value);

  String? get userPhotoUrl => getField<String>('user_photo_url');
  set userPhotoUrl(String? value) => setField<String>('user_photo_url', value);

  String? get userRankName => getField<String>('user_rank_name');
  set userRankName(String? value) => setField<String>('user_rank_name', value);
}
