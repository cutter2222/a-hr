import '../database.dart';

class MissionRewardsTable extends SupabaseTable<MissionRewardsRow> {
  @override
  String get tableName => 'mission_rewards';

  @override
  MissionRewardsRow createRow(Map<String, dynamic> data) =>
      MissionRewardsRow(data);
}

class MissionRewardsRow extends SupabaseDataRow {
  MissionRewardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MissionRewardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get missionId => getField<int>('mission_id');
  set missionId(int? value) => setField<int>('mission_id', value);

  int? get rewardId => getField<int>('reward_id');
  set rewardId(int? value) => setField<int>('reward_id', value);
}
