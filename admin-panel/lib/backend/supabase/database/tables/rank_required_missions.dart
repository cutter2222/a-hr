import '../database.dart';

class RankRequiredMissionsTable extends SupabaseTable<RankRequiredMissionsRow> {
  @override
  String get tableName => 'rank_required_missions';

  @override
  RankRequiredMissionsRow createRow(Map<String, dynamic> data) =>
      RankRequiredMissionsRow(data);
}

class RankRequiredMissionsRow extends SupabaseDataRow {
  RankRequiredMissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RankRequiredMissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get rankId => getField<int>('rank_id');
  set rankId(int? value) => setField<int>('rank_id', value);

  int? get requiredMissionId => getField<int>('required_mission_id');
  set requiredMissionId(int? value) =>
      setField<int>('required_mission_id', value);
}
