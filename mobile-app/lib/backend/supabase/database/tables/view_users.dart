import '../database.dart';

class ViewUsersTable extends SupabaseTable<ViewUsersRow> {
  @override
  String get tableName => 'view_users';

  @override
  ViewUsersRow createRow(Map<String, dynamic> data) => ViewUsersRow(data);
}

class ViewUsersRow extends SupabaseDataRow {
  ViewUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUsersTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int? get xpPoints => getField<int>('xp_points');
  set xpPoints(int? value) => setField<int>('xp_points', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  int? get level => getField<int>('level');
  set level(int? value) => setField<int>('level', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  DateTime? get birthDate => getField<DateTime>('birth_date');
  set birthDate(DateTime? value) => setField<DateTime>('birth_date', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get companyPosition => getField<String>('company_position');
  set companyPosition(String? value) =>
      setField<String>('company_position', value);

  DateTime? get companyStartDate => getField<DateTime>('company_start_date');
  set companyStartDate(DateTime? value) =>
      setField<DateTime>('company_start_date', value);

  int? get skillPoints => getField<int>('skill_points');
  set skillPoints(int? value) => setField<int>('skill_points', value);

  int? get coins => getField<int>('coins');
  set coins(int? value) => setField<int>('coins', value);

  int? get rankId => getField<int>('rank_id');
  set rankId(int? value) => setField<int>('rank_id', value);

  int? get branchId => getField<int>('branch_id');
  set branchId(int? value) => setField<int>('branch_id', value);

  String? get rankTitle => getField<String>('rank_title');
  set rankTitle(String? value) => setField<String>('rank_title', value);

  int? get rankOrderIndex => getField<int>('rank_order_index');
  set rankOrderIndex(int? value) => setField<int>('rank_order_index', value);

  String? get rankDescription => getField<String>('rank_description');
  set rankDescription(String? value) =>
      setField<String>('rank_description', value);

  String? get rankCharacterVideoMaleUrl =>
      getField<String>('rank_character_video_male_url');
  set rankCharacterVideoMaleUrl(String? value) =>
      setField<String>('rank_character_video_male_url', value);

  String? get rankCharacterVideoFemaleUrl =>
      getField<String>('rank_character_video_female_url');
  set rankCharacterVideoFemaleUrl(String? value) =>
      setField<String>('rank_character_video_female_url', value);

  String? get rankBadgeImageUrl => getField<String>('rank_badge_image_url');
  set rankBadgeImageUrl(String? value) =>
      setField<String>('rank_badge_image_url', value);

  String? get rankColor => getField<String>('rank_color');
  set rankColor(String? value) => setField<String>('rank_color', value);

  int? get levelXpToNext => getField<int>('level_xp_to_next');
  set levelXpToNext(int? value) => setField<int>('level_xp_to_next', value);

  int? get levelTotalCount => getField<int>('level_total_count');
  set levelTotalCount(int? value) => setField<int>('level_total_count', value);

  String? get branchName => getField<String>('branch_name');
  set branchName(String? value) => setField<String>('branch_name', value);

  String? get branchImageUrl => getField<String>('branch_image_url');
  set branchImageUrl(String? value) =>
      setField<String>('branch_image_url', value);

  int? get branchOrderIndex => getField<int>('branch_order_index');
  set branchOrderIndex(int? value) =>
      setField<int>('branch_order_index', value);
}
