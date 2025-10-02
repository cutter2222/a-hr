// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionProofsStruct extends BaseStruct {
  MissionProofsStruct({
    List<String>? photoUrls,
    List<String>? videoUrls,
    List<String>? fileUrls,
  })  : _photoUrls = photoUrls,
        _videoUrls = videoUrls,
        _fileUrls = fileUrls;

  // "photo_urls" field.
  List<String>? _photoUrls;
  List<String> get photoUrls => _photoUrls ?? const [];
  set photoUrls(List<String>? val) => _photoUrls = val;

  void updatePhotoUrls(Function(List<String>) updateFn) {
    updateFn(_photoUrls ??= []);
  }

  bool hasPhotoUrls() => _photoUrls != null;

  // "video_urls" field.
  List<String>? _videoUrls;
  List<String> get videoUrls => _videoUrls ?? const [];
  set videoUrls(List<String>? val) => _videoUrls = val;

  void updateVideoUrls(Function(List<String>) updateFn) {
    updateFn(_videoUrls ??= []);
  }

  bool hasVideoUrls() => _videoUrls != null;

  // "file_urls" field.
  List<String>? _fileUrls;
  List<String> get fileUrls => _fileUrls ?? const [];
  set fileUrls(List<String>? val) => _fileUrls = val;

  void updateFileUrls(Function(List<String>) updateFn) {
    updateFn(_fileUrls ??= []);
  }

  bool hasFileUrls() => _fileUrls != null;

  static MissionProofsStruct fromMap(Map<String, dynamic> data) =>
      MissionProofsStruct(
        photoUrls: getDataList(data['photo_urls']),
        videoUrls: getDataList(data['video_urls']),
        fileUrls: getDataList(data['file_urls']),
      );

  static MissionProofsStruct? maybeFromMap(dynamic data) => data is Map
      ? MissionProofsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'photo_urls': _photoUrls,
        'video_urls': _videoUrls,
        'file_urls': _fileUrls,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photo_urls': serializeParam(
          _photoUrls,
          ParamType.String,
          isList: true,
        ),
        'video_urls': serializeParam(
          _videoUrls,
          ParamType.String,
          isList: true,
        ),
        'file_urls': serializeParam(
          _fileUrls,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static MissionProofsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MissionProofsStruct(
        photoUrls: deserializeParam<String>(
          data['photo_urls'],
          ParamType.String,
          true,
        ),
        videoUrls: deserializeParam<String>(
          data['video_urls'],
          ParamType.String,
          true,
        ),
        fileUrls: deserializeParam<String>(
          data['file_urls'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'MissionProofsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MissionProofsStruct &&
        listEquality.equals(photoUrls, other.photoUrls) &&
        listEquality.equals(videoUrls, other.videoUrls) &&
        listEquality.equals(fileUrls, other.fileUrls);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([photoUrls, videoUrls, fileUrls]);
}

MissionProofsStruct createMissionProofsStruct() => MissionProofsStruct();
