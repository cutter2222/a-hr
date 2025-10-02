import '../database.dart';

class ShopCategoriesTable extends SupabaseTable<ShopCategoriesRow> {
  @override
  String get tableName => 'shop_categories';

  @override
  ShopCategoriesRow createRow(Map<String, dynamic> data) =>
      ShopCategoriesRow(data);
}

class ShopCategoriesRow extends SupabaseDataRow {
  ShopCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ShopCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool get isArchived => getField<bool>('is_archived')!;
  set isArchived(bool value) => setField<bool>('is_archived', value);
}
