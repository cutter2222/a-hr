import '../database.dart';

class RankRewardsTable extends SupabaseTable<RankRewardsRow> {
  @override
  String get tableName => 'rank_rewards';

  @override
  RankRewardsRow createRow(Map<String, dynamic> data) => RankRewardsRow(data);
}

class RankRewardsRow extends SupabaseDataRow {
  RankRewardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RankRewardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get rankId => getField<int>('rank_id');
  set rankId(int? value) => setField<int>('rank_id', value);

  int? get rewardId => getField<int>('reward_id');
  set rewardId(int? value) => setField<int>('reward_id', value);
}
