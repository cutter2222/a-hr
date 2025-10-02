import '../database.dart';

class MissionsTable extends SupabaseTable<MissionsRow> {
  @override
  String get tableName => 'missions';

  @override
  MissionsRow createRow(Map<String, dynamic> data) => MissionsRow(data);
}

class MissionsRow extends SupabaseDataRow {
  MissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get requiredRankId => getField<int>('required_rank_id');
  set requiredRankId(int? value) => setField<int>('required_rank_id', value);

  DateTime? get deadlineAt => getField<DateTime>('deadline_at');
  set deadlineAt(DateTime? value) => setField<DateTime>('deadline_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get xpPoints => getField<int>('xp_points');
  set xpPoints(int? value) => setField<int>('xp_points', value);

  int get coins => getField<int>('coins')!;
  set coins(int value) => setField<int>('coins', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get task => getField<String>('task');
  set task(String? value) => setField<String>('task', value);

  int? get branchId => getField<int>('branch_id');
  set branchId(int? value) => setField<int>('branch_id', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);

  bool get isArchived => getField<bool>('is_archived')!;
  set isArchived(bool value) => setField<bool>('is_archived', value);

  DateTime? get archivedAt => getField<DateTime>('archived_at');
  set archivedAt(DateTime? value) => setField<DateTime>('archived_at', value);

  dynamic get content => getField<dynamic>('content');
  set content(dynamic value) => setField<dynamic>('content', value);

  bool get autoCheckEnabled => getField<bool>('auto_check_enabled')!;
  set autoCheckEnabled(bool value) =>
      setField<bool>('auto_check_enabled', value);

  String? get autoCheckFunctionName =>
      getField<String>('auto_check_function_name');
  set autoCheckFunctionName(String? value) =>
      setField<String>('auto_check_function_name', value);
}
