import '../database.dart';

class ViewUserPurchasesTable extends SupabaseTable<ViewUserPurchasesRow> {
  @override
  String get tableName => 'view_user_purchases';

  @override
  ViewUserPurchasesRow createRow(Map<String, dynamic> data) =>
      ViewUserPurchasesRow(data);
}

class ViewUserPurchasesRow extends SupabaseDataRow {
  ViewUserPurchasesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewUserPurchasesTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get priceCoins => getField<double>('price_coins');
  set priceCoins(double? value) => setField<double>('price_coins', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get shopProductId => getField<int>('shop_product_id');
  set shopProductId(int? value) => setField<int>('shop_product_id', value);

  String? get shopProductName => getField<String>('shop_product_name');
  set shopProductName(String? value) =>
      setField<String>('shop_product_name', value);

  String? get shopProductDescription =>
      getField<String>('shop_product_description');
  set shopProductDescription(String? value) =>
      setField<String>('shop_product_description', value);

  double? get shopProductPriceCoins =>
      getField<double>('shop_product_price_coins');
  set shopProductPriceCoins(double? value) =>
      setField<double>('shop_product_price_coins', value);

  int? get shopProductStock => getField<int>('shop_product_stock');
  set shopProductStock(int? value) =>
      setField<int>('shop_product_stock', value);

  int? get shopProductLimitPerUser =>
      getField<int>('shop_product_limit_per_user');
  set shopProductLimitPerUser(int? value) =>
      setField<int>('shop_product_limit_per_user', value);

  String? get shopProductImageUrl => getField<String>('shop_product_image_url');
  set shopProductImageUrl(String? value) =>
      setField<String>('shop_product_image_url', value);

  bool? get shopProductIsActive => getField<bool>('shop_product_is_active');
  set shopProductIsActive(bool? value) =>
      setField<bool>('shop_product_is_active', value);

  int? get shopProductCategoryId => getField<int>('shop_product_category_id');
  set shopProductCategoryId(int? value) =>
      setField<int>('shop_product_category_id', value);

  String? get shopCategoriesName => getField<String>('shop_categories_name');
  set shopCategoriesName(String? value) =>
      setField<String>('shop_categories_name', value);

  int? get shopCategoriesOrderIndex =>
      getField<int>('shop_categories_order_index');
  set shopCategoriesOrderIndex(int? value) =>
      setField<int>('shop_categories_order_index', value);
}
