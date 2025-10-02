import 'package:collection/collection.dart';

enum MissionStatus {
  completed,
  failed,
  pending,
}

enum MissionType {
  start,
  take_photo_video,
  gallery_photo_video,
  file,
  quiz,
  questionnaire,
  form,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (MissionStatus):
      return MissionStatus.values.deserialize(value) as T?;
    case (MissionType):
      return MissionType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
