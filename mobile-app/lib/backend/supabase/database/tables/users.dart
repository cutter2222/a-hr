import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int get xpPoints => getField<int>('xp_points')!;
  set xpPoints(int value) => setField<int>('xp_points', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  int get level => getField<int>('level')!;
  set level(int value) => setField<int>('level', value);

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

  int get skillPoints => getField<int>('skill_points')!;
  set skillPoints(int value) => setField<int>('skill_points', value);

  int get coins => getField<int>('coins')!;
  set coins(int value) => setField<int>('coins', value);

  int? get rankId => getField<int>('rank_id');
  set rankId(int? value) => setField<int>('rank_id', value);

  int? get branchId => getField<int>('branch_id');
  set branchId(int? value) => setField<int>('branch_id', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get nickname => getField<String>('nickname');
  set nickname(String? value) => setField<String>('nickname', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get qualities => getField<String>('qualities');
  set qualities(String? value) => setField<String>('qualities', value);

  String? get hobby => getField<String>('hobby');
  set hobby(String? value) => setField<String>('hobby', value);

  String? get training => getField<String>('training');
  set training(String? value) => setField<String>('training', value);

  String? get education => getField<String>('education');
  set education(String? value) => setField<String>('education', value);

  String? get worked => getField<String>('worked');
  set worked(String? value) => setField<String>('worked', value);
}
