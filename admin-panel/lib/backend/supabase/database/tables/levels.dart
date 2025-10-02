import '../database.dart';

class LevelsTable extends SupabaseTable<LevelsRow> {
  @override
  String get tableName => 'levels';

  @override
  LevelsRow createRow(Map<String, dynamic> data) => LevelsRow(data);
}

class LevelsRow extends SupabaseDataRow {
  LevelsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LevelsTable();

  int get level => getField<int>('level')!;
  set level(int value) => setField<int>('level', value);

  int get xpToNext => getField<int>('xp_to_next')!;
  set xpToNext(int value) => setField<int>('xp_to_next', value);
}
