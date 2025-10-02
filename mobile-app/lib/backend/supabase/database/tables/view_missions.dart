import '../database.dart';

class ViewMissionsTable extends SupabaseTable<ViewMissionsRow> {
  @override
  String get tableName => 'view_missions';

  @override
  ViewMissionsRow createRow(Map<String, dynamic> data) => ViewMissionsRow(data);
}

class ViewMissionsRow extends SupabaseDataRow {
  ViewMissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewMissionsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

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

  dynamic? get content => getField<dynamic>('content');
  set content(dynamic? value) => setField<dynamic>('content', value);

  String? get userMissionsStatus => getField<String>('user_missions_status');
  set userMissionsStatus(String? value) =>
      setField<String>('user_missions_status', value);

  int? get xpPoints => getField<int>('xp_points');
  set xpPoints(int? value) => setField<int>('xp_points', value);

  int? get coins => getField<int>('coins');
  set coins(int? value) => setField<int>('coins', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get task => getField<String>('task');
  set task(String? value) => setField<String>('task', value);

  bool? get isArchived => getField<bool>('is_archived');
  set isArchived(bool? value) => setField<bool>('is_archived', value);

  DateTime? get archivedAt => getField<DateTime>('archived_at');
  set archivedAt(DateTime? value) => setField<DateTime>('archived_at', value);

  bool? get autoCheckEnabled => getField<bool>('auto_check_enabled');
  set autoCheckEnabled(bool? value) =>
      setField<bool>('auto_check_enabled', value);

  String? get autoCheckFunctionName =>
      getField<String>('auto_check_function_name');
  set autoCheckFunctionName(String? value) =>
      setField<String>('auto_check_function_name', value);

  String? get requiredRankName => getField<String>('required_rank_name');
  set requiredRankName(String? value) =>
      setField<String>('required_rank_name', value);

  String? get requiredRankImageUrl =>
      getField<String>('required_rank_image_url');
  set requiredRankImageUrl(String? value) =>
      setField<String>('required_rank_image_url', value);

  List<String> get requiredBranchNames =>
      getListField<String>('required_branch_names');
  set requiredBranchNames(List<String>? value) =>
      setListField<String>('required_branch_names', value);

  List<int> get requiredBranchIds => getListField<int>('required_branch_ids');
  set requiredBranchIds(List<int>? value) =>
      setListField<int>('required_branch_ids', value);

  List<String> get requiredBranchImageUrls =>
      getListField<String>('required_branch_image_urls');
  set requiredBranchImageUrls(List<String>? value) =>
      setListField<String>('required_branch_image_urls', value);

  bool? get isRankConditionMet => getField<bool>('is_rank_condition_met');
  set isRankConditionMet(bool? value) =>
      setField<bool>('is_rank_condition_met', value);

  bool? get isMissionConditionMet => getField<bool>('is_mission_condition_met');
  set isMissionConditionMet(bool? value) =>
      setField<bool>('is_mission_condition_met', value);

  bool? get isSkillConditionMet => getField<bool>('is_skill_condition_met');
  set isSkillConditionMet(bool? value) =>
      setField<bool>('is_skill_condition_met', value);

  bool? get isBranchConditionMet => getField<bool>('is_branch_condition_met');
  set isBranchConditionMet(bool? value) =>
      setField<bool>('is_branch_condition_met', value);

  bool? get isUnlocked => getField<bool>('is_unlocked');
  set isUnlocked(bool? value) => setField<bool>('is_unlocked', value);
}
