import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'missions_add_widget.dart' show MissionsAddWidget;
import 'package:flutter/material.dart';

class MissionsAddModel extends FlutterFlowModel<MissionsAddWidget> {
  ///  Local state fields for this page.

  List<int> requiredBranchIds = [];
  void addToRequiredBranchIds(int item) => requiredBranchIds.add(item);
  void removeFromRequiredBranchIds(int item) => requiredBranchIds.remove(item);
  void removeAtIndexFromRequiredBranchIds(int index) =>
      requiredBranchIds.removeAt(index);
  void insertAtIndexInRequiredBranchIds(int index, int item) =>
      requiredBranchIds.insert(index, item);
  void updateRequiredBranchIdsAtIndex(int index, Function(int) updateFn) =>
      requiredBranchIds[index] = updateFn(requiredBranchIds[index]);

  bool isLoaded = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in MissionsAdd widget.
  List<MissionRequiredBranchesRow>? queryRequiredBranches;
  // Stores action output result for [Backend Call - Query Rows] action in MissionsAdd widget.
  List<MissionRequiredSkillsRow>? queryRequiredSkill;
  // Stores action output result for [Backend Call - Query Rows] action in MissionsAdd widget.
  List<MissionRewardsRow>? queryMissionRewards;
  // Model for NavbarDesktop component.
  late NavbarDesktopModel navbarDesktopModel;
  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for DescriptionInput widget.
  FocusNode? descriptionInputFocusNode;
  TextEditingController? descriptionInputTextController;
  String? Function(BuildContext, String?)?
      descriptionInputTextControllerValidator;
  // State field(s) for TaskInput widget.
  FocusNode? taskInputFocusNode;
  TextEditingController? taskInputTextController;
  String? Function(BuildContext, String?)? taskInputTextControllerValidator;
  // State field(s) for RequiredBranchInput widget.
  List<int>? requiredBranchInputValue;
  FormFieldController<List<int>>? requiredBranchInputValueController;
  // State field(s) for RequiredRankInput widget.
  String? requiredRankInputValue;
  FormFieldController<String>? requiredRankInputValueController;
  // State field(s) for XpPointsInput widget.
  FocusNode? xpPointsInputFocusNode;
  TextEditingController? xpPointsInputTextController;
  String? Function(BuildContext, String?)? xpPointsInputTextControllerValidator;
  // State field(s) for CoinsInput widget.
  FocusNode? coinsInputFocusNode;
  TextEditingController? coinsInputTextController;
  String? Function(BuildContext, String?)? coinsInputTextControllerValidator;
  // State field(s) for MissionRewardsInput widget.
  List<String>? missionRewardsInputValue;
  FormFieldController<List<String>>? missionRewardsInputValueController;
  // State field(s) for RequiredMissionsInput widget.
  String? requiredMissionsInputValue;
  FormFieldController<String>? requiredMissionsInputValueController;
  // State field(s) for OrderIndexInput widget.
  FocusNode? orderIndexInputFocusNode;
  TextEditingController? orderIndexInputTextController;
  String? Function(BuildContext, String?)?
      orderIndexInputTextControllerValidator;
  // State field(s) for TypeInput widget.
  String? typeInputValue;
  FormFieldController<String>? typeInputValueController;
  // Model for NavbarMobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navbarDesktopModel = createModel(context, () => NavbarDesktopModel());
    appBarModel = createModel(context, () => AppBarModel());
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

    navbarMobileModel.dispose();
  }
}
