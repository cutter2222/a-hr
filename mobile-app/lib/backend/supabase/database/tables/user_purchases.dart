import '../database.dart';

class UserPurchasesTable extends SupabaseTable<UserPurchasesRow> {
  @override
  String get tableName => 'user_purchases';

  @override
  UserPurchasesRow createRow(Map<String, dynamic> data) =>
      UserPurchasesRow(data);
}

class UserPurchasesRow extends SupabaseDataRow {
  UserPurchasesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserPurchasesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get priceCoins => getField<double>('price_coins');
  set priceCoins(double? value) => setField<double>('price_coins', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get shopProductId => getField<int>('shop_product_id');
  set shopProductId(int? value) => setField<int>('shop_product_id', value);
}
