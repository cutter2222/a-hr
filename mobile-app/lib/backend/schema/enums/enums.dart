import 'package:collection/collection.dart';

enum UserRole {
  all,
  candidate,
  employee,
  admin,
  organizer,
  hr,
}

enum UserMissionStatus {
  pending,
  completed,
  failed,
}

enum Logbook {
  purchase,
  mission,
  reward,
  skill,
  rank,
  level,
}

enum Gender {
  male,
  female,
}

enum MissionType {
  start,
  take_photo_video,
  gallery_photo_video,
  file,
  quiz,
  questionnaire,
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
    case (UserRole):
      return UserRole.values.deserialize(value) as T?;
    case (UserMissionStatus):
      return UserMissionStatus.values.deserialize(value) as T?;
    case (Logbook):
      return Logbook.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (MissionType):
      return MissionType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
