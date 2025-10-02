// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionQuestionnaireDataStruct extends BaseStruct {
  MissionQuestionnaireDataStruct({
    String? question,
    String? imageUrl,
    List<String>? answers,
    String? myAnswer,
  })  : _question = question,
        _imageUrl = imageUrl,
        _answers = answers,
        _myAnswer = myAnswer;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  set answers(List<String>? val) => _answers = val;

  void updateAnswers(Function(List<String>) updateFn) {
    updateFn(_answers ??= []);
  }

  bool hasAnswers() => _answers != null;

  // "my_answer" field.
  String? _myAnswer;
  String get myAnswer => _myAnswer ?? '';
  set myAnswer(String? val) => _myAnswer = val;

  bool hasMyAnswer() => _myAnswer != null;

  static MissionQuestionnaireDataStruct fromMap(Map<String, dynamic> data) =>
      MissionQuestionnaireDataStruct(
        question: data['question'] as String?,
        imageUrl: data['image_url'] as String?,
        answers: getDataList(data['answers']),
        myAnswer: data['my_answer'] as String?,
      );

  static MissionQuestionnaireDataStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? MissionQuestionnaireDataStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'image_url': _imageUrl,
        'answers': _answers,
        'my_answer': _myAnswer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'answers': serializeParam(
          _answers,
          ParamType.String,
          isList: true,
        ),
        'my_answer': serializeParam(
          _myAnswer,
          ParamType.String,
        ),
      }.withoutNulls;

  static MissionQuestionnaireDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MissionQuestionnaireDataStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
        answers: deserializeParam<String>(
          data['answers'],
          ParamType.String,
          true,
        ),
        myAnswer: deserializeParam(
          data['my_answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MissionQuestionnaireDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MissionQuestionnaireDataStruct &&
        question == other.question &&
        imageUrl == other.imageUrl &&
        listEquality.equals(answers, other.answers) &&
        myAnswer == other.myAnswer;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([question, imageUrl, answers, myAnswer]);
}

MissionQuestionnaireDataStruct createMissionQuestionnaireDataStruct({
  String? question,
  String? imageUrl,
  String? myAnswer,
}) =>
    MissionQuestionnaireDataStruct(
      question: question,
      imageUrl: imageUrl,
      myAnswer: myAnswer,
    );
