import '/components/app_bar_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ranks_add_widget.dart' show RanksAddWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RanksAddModel extends FlutterFlowModel<RanksAddWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  // State field(s) for OrderInput widget.
  FocusNode? orderInputFocusNode;
  TextEditingController? orderInputTextController;
  String? Function(BuildContext, String?)? orderInputTextControllerValidator;
  // State field(s) for RequiredLevelInput widget.
  FocusNode? requiredLevelInputFocusNode;
  TextEditingController? requiredLevelInputTextController;
  late MaskTextInputFormatter requiredLevelInputMask;
  String? Function(BuildContext, String?)?
      requiredLevelInputTextControllerValidator;
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

    orderInputFocusNode?.dispose();
    orderInputTextController?.dispose();

    requiredLevelInputFocusNode?.dispose();
    requiredLevelInputTextController?.dispose();

    navbarMobileModel.dispose();
  }
}
