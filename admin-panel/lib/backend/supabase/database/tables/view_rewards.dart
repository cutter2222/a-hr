import '../database.dart';

class ViewRewardsTable extends SupabaseTable<ViewRewardsRow> {
  @override
  String get tableName => 'view_rewards';

  @override
  ViewRewardsRow createRow(Map<String, dynamic> data) => ViewRewardsRow(data);
}

class ViewRewardsRow extends SupabaseDataRow {
  ViewRewardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewRewardsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

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

  String? get rarityName => getField<String>('rarity_name');
  set rarityName(String? value) => setField<String>('rarity_name', value);

  String? get rarityColor => getField<String>('rarity_color');
  set rarityColor(String? value) => setField<String>('rarity_color', value);

  String? get rarityInfo => getField<String>('rarity_info');
  set rarityInfo(String? value) => setField<String>('rarity_info', value);

  String? get rankTitle => getField<String>('rank_title');
  set rankTitle(String? value) => setField<String>('rank_title', value);

  int? get rankOrderIndex => getField<int>('rank_order_index');
  set rankOrderIndex(int? value) => setField<int>('rank_order_index', value);

  String? get rankDescription => getField<String>('rank_description');
  set rankDescription(String? value) =>
      setField<String>('rank_description', value);

  String? get rankCharacterVideoUrl =>
      getField<String>('rank_character_video_url');
  set rankCharacterVideoUrl(String? value) =>
      setField<String>('rank_character_video_url', value);

  String? get rankColor => getField<String>('rank_color');
  set rankColor(String? value) => setField<String>('rank_color', value);

  int? get rankRequiredLevel => getField<int>('rank_required_level');
  set rankRequiredLevel(int? value) =>
      setField<int>('rank_required_level', value);

  String? get rankBadgeImageUrl => getField<String>('rank_badge_image_url');
  set rankBadgeImageUrl(String? value) =>
      setField<String>('rank_badge_image_url', value);

  bool? get isEarned => getField<bool>('is_earned');
  set isEarned(bool? value) => setField<bool>('is_earned', value);
}
