import '../database.dart';

class RewardsTable extends SupabaseTable<RewardsRow> {
  @override
  String get tableName => 'rewards';

  @override
  RewardsRow createRow(Map<String, dynamic> data) => RewardsRow(data);
}

class RewardsRow extends SupabaseDataRow {
  RewardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RewardsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  int? get requiredRankId => getField<int>('required_rank_id');
  set requiredRankId(int? value) => setField<int>('required_rank_id', value);

  String? get howToGet => getField<String>('how_to_get');
  set howToGet(String? value) => setField<String>('how_to_get', value);

  int? get rarityId => getField<int>('rarity_id');
  set rarityId(int? value) => setField<int>('rarity_id', value);
}
