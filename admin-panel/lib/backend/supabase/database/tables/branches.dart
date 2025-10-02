import '../database.dart';

class BranchesTable extends SupabaseTable<BranchesRow> {
  @override
  String get tableName => 'branches';

  @override
  BranchesRow createRow(Map<String, dynamic> data) => BranchesRow(data);
}

class BranchesRow extends SupabaseDataRow {
  BranchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BranchesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);
}
