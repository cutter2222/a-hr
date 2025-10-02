import '../database.dart';

class MissionRequiredBranchesTable
    extends SupabaseTable<MissionRequiredBranchesRow> {
  @override
  String get tableName => 'mission_required_branches';

  @override
  MissionRequiredBranchesRow createRow(Map<String, dynamic> data) =>
      MissionRequiredBranchesRow(data);
}

class MissionRequiredBranchesRow extends SupabaseDataRow {
  MissionRequiredBranchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MissionRequiredBranchesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get requiredBranchId => getField<int>('required_branch_id');
  set requiredBranchId(int? value) =>
      setField<int>('required_branch_id', value);

  int? get missionId => getField<int>('mission_id');
  set missionId(int? value) => setField<int>('mission_id', value);
}
