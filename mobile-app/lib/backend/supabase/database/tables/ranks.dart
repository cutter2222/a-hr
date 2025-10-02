import '../database.dart';

class RanksTable extends SupabaseTable<RanksRow> {
  @override
  String get tableName => 'ranks';

  @override
  RanksRow createRow(Map<String, dynamic> data) => RanksRow(data);
}

class RanksRow extends SupabaseDataRow {
  RanksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RanksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get characterVideoMaleUrl =>
      getField<String>('character_video_male_url');
  set characterVideoMaleUrl(String? value) =>
      setField<String>('character_video_male_url', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  int? get requiredLevel => getField<int>('required_level');
  set requiredLevel(int? value) => setField<int>('required_level', value);

  String? get badgeImageUrl => getField<String>('badge_image_url');
  set badgeImageUrl(String? value) =>
      setField<String>('badge_image_url', value);

  String? get characterVideoFemaleUrl =>
      getField<String>('character_video_female_url');
  set characterVideoFemaleUrl(String? value) =>
      setField<String>('character_video_female_url', value);
}
