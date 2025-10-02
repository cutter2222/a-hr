import '../database.dart';

class RewardRaritiesTable extends SupabaseTable<RewardRaritiesRow> {
  @override
  String get tableName => 'reward_rarities';

  @override
  RewardRaritiesRow createRow(Map<String, dynamic> data) =>
      RewardRaritiesRow(data);
}

class RewardRaritiesRow extends SupabaseDataRow {
  RewardRaritiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RewardRaritiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get info => getField<String>('info');
  set info(String? value) => setField<String>('info', value);
}
