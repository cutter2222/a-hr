import '../database.dart';

class ViewTopUsersMonthTable extends SupabaseTable<ViewTopUsersMonthRow> {
  @override
  String get tableName => 'view_top_users_month';

  @override
  ViewTopUsersMonthRow createRow(Map<String, dynamic> data) =>
      ViewTopUsersMonthRow(data);
}

class ViewTopUsersMonthRow extends SupabaseDataRow {
  ViewTopUsersMonthRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewTopUsersMonthTable();

  int? get rankPositionByXp => getField<int>('rank_position_by_xp');
  set rankPositionByXp(int? value) =>
      setField<int>('rank_position_by_xp', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  int? get totalXpChange => getField<int>('total_xp_change');
  set totalXpChange(int? value) => setField<int>('total_xp_change', value);

  int? get totalCoinsChange => getField<int>('total_coins_change');
  set totalCoinsChange(int? value) =>
      setField<int>('total_coins_change', value);

  int? get rankPositionByCoins => getField<int>('rank_position_by_coins');
  set rankPositionByCoins(int? value) =>
      setField<int>('rank_position_by_coins', value);
}
