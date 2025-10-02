import '../database.dart';

class TestUsersTable extends SupabaseTable<TestUsersRow> {
  @override
  String get tableName => 'test_users';

  @override
  TestUsersRow createRow(Map<String, dynamic> data) => TestUsersRow(data);
}

class TestUsersRow extends SupabaseDataRow {
  TestUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TestUsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);

  String? get login => getField<String>('login');
  set login(String? value) => setField<String>('login', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);
}
