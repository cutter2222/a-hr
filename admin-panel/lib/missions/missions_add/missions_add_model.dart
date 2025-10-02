import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'missions_add_widget.dart' show MissionsAddWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MissionsAddModel extends FlutterFlowModel<MissionsAddWidget> {
  ///  Local state fields for this page.

  bool isLoaded = false;

  List<int> initialBranchIds = [];
  void addToInitialBranchIds(int item) => initialBranchIds.add(item);
  void removeFromInitialBranchIds(int item) => initialBranchIds.remove(item);
  void removeAtIndexFromInitialBranchIds(int index) =>
      initialBranchIds.removeAt(index);
  void insertAtIndexInInitialBranchIds(int index, int item) =>
      initialBranchIds.insert(index, item);
  void updateInitialBranchIdsAtIndex(int index, Function(int) updateFn) =>
      initialBranchIds[index] = updateFn(initialBranchIds[index]);

  List<int> requiredBranchIds = [];
  void addToRequiredBranchIds(int item) => requiredBranchIds.add(item);
  void removeFromRequiredBranchIds(int item) => requiredBranchIds.remove(item);
  void removeAtIndexFromRequiredBranchIds(int index) =>
      requiredBranchIds.removeAt(index);
  void insertAtIndexInRequiredBranchIds(int index, int item) =>
      requiredBranchIds.insert(index, item);
  void updateRequiredBranchIdsAtIndex(int index, Function(int) updateFn) =>
      requiredBranchIds[index] = updateFn(requiredBranchIds[index]);

  List<int> initialRewardIds = [];
  void addToInitialRewardIds(int item) => initialRewardIds.add(item);
  void removeFromInitialRewardIds(int item) => initialRewardIds.remove(item);
  void removeAtIndexFromInitialRewardIds(int index) =>
      initialRewardIds.removeAt(index);
  void insertAtIndexInInitialRewardIds(int index, int item) =>
      initialRewardIds.insert(index, item);
  void updateInitialRewardIdsAtIndex(int index, Function(int) updateFn) =>
      initialRewardIds[index] = updateFn(initialRewardIds[index]);

  List<int> missionRewardIds = [];
  void addToMissionRewardIds(int item) => missionRewardIds.add(item);
  void removeFromMissionRewardIds(int item) => missionRewardIds.remove(item);
  void removeAtIndexFromMissionRewardIds(int index) =>
      missionRewardIds.removeAt(index);
  void insertAtIndexInMissionRewardIds(int index, int item) =>
      missionRewardIds.insert(index, item);
  void updateMissionRewardIdsAtIndex(int index, Function(int) updateFn) =>
      missionRewardIds[index] = updateFn(missionRewardIds[index]);

  List<int> initialMissionIds = [];
  void addToInitialMissionIds(int item) => initialMissionIds.add(item);
  void removeFromInitialMissionIds(int item) => initialMissionIds.remove(item);
  void removeAtIndexFromInitialMissionIds(int index) =>
      initialMissionIds.removeAt(index);
  void insertAtIndexInInitialMissionIds(int index, int item) =>
      initialMissionIds.insert(index, item);
  void updateInitialMissionIdsAtIndex(int index, Function(int) updateFn) =>
      initialMissionIds[index] = updateFn(initialMissionIds[index]);

  List<int> requiredMissionIds = [];
  void addToRequiredMissionIds(int item) => requiredMissionIds.add(item);
  void removeFromRequiredMissionIds(int item) =>
      requiredMissionIds.remove(item);
  void removeAtIndexFromRequiredMissionIds(int index) =>
      requiredMissionIds.removeAt(index);
  void insertAtIndexInRequiredMissionIds(int index, int item) =>
      requiredMissionIds.insert(index, item);
  void updateRequiredMissionIdsAtIndex(int index, Function(int) updateFn) =>
      requiredMissionIds[index] = updateFn(requiredMissionIds[index]);

  List<MissionSkillsDataStruct> requiredSkills = [];
  void addToRequiredSkills(MissionSkillsDataStruct item) =>
      requiredSkills.add(item);
  void removeFromRequiredSkills(MissionSkillsDataStruct item) =>
      requiredSkills.remove(item);
  void removeAtIndexFromRequiredSkills(int index) =>
      requiredSkills.removeAt(index);
  void insertAtIndexInRequiredSkills(int index, MissionSkillsDataStruct item) =>
      requiredSkills.insert(index, item);
  void updateRequiredSkillsAtIndex(
          int index, Function(MissionSkillsDataStruct) updateFn) =>
      requiredSkills[index] = updateFn(requiredSkills[index]);

  dynamic content;

  int successedLoops = 0;

  int saveloops = 0;

  List<MissionSkillsDataStruct> missionSkills = [];
  void addToMissionSkills(MissionSkillsDataStruct item) =>
      missionSkills.add(item);
  void removeFromMissionSkills(MissionSkillsDataStruct item) =>
      missionSkills.remove(item);
  void removeAtIndexFromMissionSkills(int index) =>
      missionSkills.removeAt(index);
  void insertAtIndexInMissionSkills(int index, MissionSkillsDataStruct item) =>
      missionSkills.insert(index, item);
  void updateMissionSkillsAtIndex(
          int index, Function(MissionSkillsDataStruct) updateFn) =>
      missionSkills[index] = updateFn(missionSkills[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in MissionsAdd widget.
  List<MissionRequiredBranchesRow>? queryRequiredBranches;
  // Stores action output result for [Backend Call - Query Rows] action in MissionsAdd widget.
  List<MissionRewardsRow>? queryMissionRewards;
  // Stores action output result for [Backend Call - Query Rows] action in MissionsAdd widget.
  List<MissionRequiredMissionsRow>? queryRequiredMissions;
  // Stores action output result for [Backend Call - Query Rows] action in MissionsAdd widget.
  List<ViewMissionRequiredSkillsRow>? queryViewRequiredSkill;
  // Stores action output result for [Backend Call - Query Rows] action in MissionsAdd widget.
  List<ViewMissionSkillsRow>? viewMissionSkills;
  // Model for NavbarDesktop component.
  late NavbarDesktopModel navbarDesktopModel;
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  String? _nameInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Название миссии обязательно';
    }

    return null;
  }

  // State field(s) for DescriptionInput widget.
  FocusNode? descriptionInputFocusNode;
  TextEditingController? descriptionInputTextController;
  String? Function(BuildContext, String?)?
      descriptionInputTextControllerValidator;
  String? _descriptionInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Описание миссии обязательно';
    }

    return null;
  }

  // State field(s) for TaskInput widget.
  FocusNode? taskInputFocusNode;
  TextEditingController? taskInputTextController;
  String? Function(BuildContext, String?)? taskInputTextControllerValidator;
  String? _taskInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Описание задачи обязательно';
    }

    return null;
  }

  // State field(s) for RequiredBranchInput widget.
  List<int>? requiredBranchInputValue;
  FormFieldController<List<int>>? requiredBranchInputValueController;
  // State field(s) for RoleInput widget.
  String? roleInputValue;
  FormFieldController<String>? roleInputValueController;
  // State field(s) for RequiredRankInput widget.
  int? requiredRankInputValue;
  FormFieldController<int>? requiredRankInputValueController;
  // State field(s) for XpPointsInput widget.
  FocusNode? xpPointsInputFocusNode;
  TextEditingController? xpPointsInputTextController;
  late MaskTextInputFormatter xpPointsInputMask;
  String? Function(BuildContext, String?)? xpPointsInputTextControllerValidator;
  // State field(s) for CoinsInput widget.
  FocusNode? coinsInputFocusNode;
  TextEditingController? coinsInputTextController;
  late MaskTextInputFormatter coinsInputMask;
  String? Function(BuildContext, String?)? coinsInputTextControllerValidator;
  // State field(s) for MissionRewardsInput widget.
  List<int>? missionRewardsInputValue;
  FormFieldController<List<int>>? missionRewardsInputValueController;
  // State field(s) for RequiredMissionsInput widget.
  List<int>? requiredMissionsInputValue;
  FormFieldController<List<int>>? requiredMissionsInputValueController;
  // State field(s) for OrderIndexInput widget.
  FocusNode? orderIndexInputFocusNode;
  TextEditingController? orderIndexInputTextController;
  String? Function(BuildContext, String?)?
      orderIndexInputTextControllerValidator;
  String? _orderIndexInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Порядковый номер обязателен';
    }

    return null;
  }

  // State field(s) for TypeInput widget.
  String? typeInputValue;
  FormFieldController<String>? typeInputValueController;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  MissionQuizStruct? quizOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  MissionFormStruct? formOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  MissionQuestionnaireStruct? questionnaireOutput;
  // State field(s) for RequiredSkillInput widget.
  int? requiredSkillInputValue;
  FormFieldController<int>? requiredSkillInputValueController;
  // State field(s) for MissionSkillInput widget.
  int? missionSkillInputValue;
  FormFieldController<int>? missionSkillInputValueController;
  // State field(s) for ArchiveChecbox widget.
  bool? archiveChecboxValue;
  // State field(s) for AutocheckCheckbox widget.
  bool? autocheckCheckboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // Stores action output result for [Backend Call - Insert Row] action in SaveButton widget.
  MissionsRow? insertRow;
  // Model for NavbarMobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navbarDesktopModel = createModel(context, () => NavbarDesktopModel());
    appBarModel = createModel(context, () => AppBarModel());
    nameInputTextControllerValidator = _nameInputTextControllerValidator;
    descriptionInputTextControllerValidator =
        _descriptionInputTextControllerValidator;
    taskInputTextControllerValidator = _taskInputTextControllerValidator;
    orderIndexInputTextControllerValidator =
        _orderIndexInputTextControllerValidator;
    navbarMobileModel = createModel(context, () => NavbarMobileModel());
  }

  @override
  void dispose() {
    navbarDesktopModel.dispose();
    appBarModel.dispose();
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    descriptionInputFocusNode?.dispose();
    descriptionInputTextController?.dispose();

    taskInputFocusNode?.dispose();
    taskInputTextController?.dispose();

    xpPointsInputFocusNode?.dispose();
    xpPointsInputTextController?.dispose();

    coinsInputFocusNode?.dispose();
    coinsInputTextController?.dispose();

    orderIndexInputFocusNode?.dispose();
    orderIndexInputTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController7?.dispose();

    navbarMobileModel.dispose();
  }
}
