// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MissionQuizDataStruct extends BaseStruct {
  MissionQuizDataStruct({
    String? question,
    String? imageUrl,
    List<String>? answers,
    String? myAnswer,
    String? correctAnswer,
    bool? isValidated,
  })  : _question = question,
        _imageUrl = imageUrl,
        _answers = answers,
        _myAnswer = myAnswer,
        _correctAnswer = correctAnswer,
        _isValidated = isValidated;

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

  // "correct_answer" field.
  String? _correctAnswer;
  String get correctAnswer => _correctAnswer ?? '';
  set correctAnswer(String? val) => _correctAnswer = val;

  bool hasCorrectAnswer() => _correctAnswer != null;

  // "is_validated" field.
  bool? _isValidated;
  bool get isValidated => _isValidated ?? false;
  set isValidated(bool? val) => _isValidated = val;

  bool hasIsValidated() => _isValidated != null;

  static MissionQuizDataStruct fromMap(Map<String, dynamic> data) =>
      MissionQuizDataStruct(
        question: data['question'] as String?,
        imageUrl: data['image_url'] as String?,
        answers: getDataList(data['answers']),
        myAnswer: data['my_answer'] as String?,
        correctAnswer: data['correct_answer'] as String?,
        isValidated: data['is_validated'] as bool?,
      );

  static MissionQuizDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MissionQuizDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'image_url': _imageUrl,
        'answers': _answers,
        'my_answer': _myAnswer,
        'correct_answer': _correctAnswer,
        'is_validated': _isValidated,
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
        'correct_answer': serializeParam(
          _correctAnswer,
          ParamType.String,
        ),
        'is_validated': serializeParam(
          _isValidated,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MissionQuizDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MissionQuizDataStruct(
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
        correctAnswer: deserializeParam(
          data['correct_answer'],
          ParamType.String,
          false,
        ),
        isValidated: deserializeParam(
          data['is_validated'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MissionQuizDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MissionQuizDataStruct &&
        question == other.question &&
        imageUrl == other.imageUrl &&
        listEquality.equals(answers, other.answers) &&
        myAnswer == other.myAnswer &&
        correctAnswer == other.correctAnswer &&
        isValidated == other.isValidated;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [question, imageUrl, answers, myAnswer, correctAnswer, isValidated]);
}

MissionQuizDataStruct createMissionQuizDataStruct({
  String? question,
  String? imageUrl,
  String? myAnswer,
  String? correctAnswer,
  bool? isValidated,
}) =>
    MissionQuizDataStruct(
      question: question,
      imageUrl: imageUrl,
      myAnswer: myAnswer,
      correctAnswer: correctAnswer,
      isValidated: isValidated,
    );
