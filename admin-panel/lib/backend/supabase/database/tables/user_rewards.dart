import '../database.dart';

class UserRewardsTable extends SupabaseTable<UserRewardsRow> {
  @override
  String get tableName => 'user_rewards';

  @override
  UserRewardsRow createRow(Map<String, dynamic> data) => UserRewardsRow(data);
}

class UserRewardsRow extends SupabaseDataRow {
  UserRewardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRewardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get earnedAt => getField<DateTime>('earned_at')!;
  set earnedAt(DateTime value) => setField<DateTime>('earned_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get rewardId => getField<int>('reward_id');
  set rewardId(int? value) => setField<int>('reward_id', value);

  String? get source => getField<String>('source');
  set source(String? value) => setField<String>('source', value);
}
