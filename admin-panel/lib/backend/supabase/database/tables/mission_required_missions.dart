import '../database.dart';

class MissionRequiredMissionsTable
    extends SupabaseTable<MissionRequiredMissionsRow> {
  @override
  String get tableName => 'mission_required_missions';

  @override
  MissionRequiredMissionsRow createRow(Map<String, dynamic> data) =>
      MissionRequiredMissionsRow(data);
}

class MissionRequiredMissionsRow extends SupabaseDataRow {
  MissionRequiredMissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MissionRequiredMissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get missionId => getField<int>('mission_id');
  set missionId(int? value) => setField<int>('mission_id', value);

  int? get requiredMissionId => getField<int>('required_mission_id');
  set requiredMissionId(int? value) =>
      setField<int>('required_mission_id', value);
}
