import '../database.dart';

class ViewShopProductsTable extends SupabaseTable<ViewShopProductsRow> {
  @override
  String get tableName => 'view_shop_products';

  @override
  ViewShopProductsRow createRow(Map<String, dynamic> data) =>
      ViewShopProductsRow(data);
}

class ViewShopProductsRow extends SupabaseDataRow {
  ViewShopProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewShopProductsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get priceCoins => getField<double>('price_coins');
  set priceCoins(double? value) => setField<double>('price_coins', value);

  int? get stock => getField<int>('stock');
  set stock(int? value) => setField<int>('stock', value);

  int? get limitPerUser => getField<int>('limit_per_user');
  set limitPerUser(int? value) => setField<int>('limit_per_user', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  int? get cateogryId => getField<int>('cateogry_id');
  set cateogryId(int? value) => setField<int>('cateogry_id', value);

  String? get shopCategoryName => getField<String>('shop_category_name');
  set shopCategoryName(String? value) =>
      setField<String>('shop_category_name', value);

  int? get shopCategoryOrderIndex => getField<int>('shop_category_order_index');
  set shopCategoryOrderIndex(int? value) =>
      setField<int>('shop_category_order_index', value);
}
