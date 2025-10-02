import '/components/app_bar_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/components/upload_image_new_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'skills_add_widget.dart' show SkillsAddWidget;
import 'package:flutter/material.dart';

class SkillsAddModel extends FlutterFlowModel<SkillsAddWidget> {
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
  // State field(s) for LimitInput widget.
  FocusNode? limitInputFocusNode;
  TextEditingController? limitInputTextController;
  String? Function(BuildContext, String?)? limitInputTextControllerValidator;
  // Model for uploadImage_new component.
  late UploadImageNewModel uploadImageNewModel;
  // State field(s) for RankInput widget.
  String? rankInputValue;
  FormFieldController<String>? rankInputValueController;
  bool isDataUploading_uploadDataM9s = false;
  FFUploadedFile uploadedLocalFile_uploadDataM9s =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataM9s = '';

  // Model for NavbarMobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navbarDesktopModel = createModel(context, () => NavbarDesktopModel());
    appBarModel = createModel(context, () => AppBarModel());
    uploadImageNewModel = createModel(context, () => UploadImageNewModel());
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

    limitInputFocusNode?.dispose();
    limitInputTextController?.dispose();

    uploadImageNewModel.dispose();
    navbarMobileModel.dispose();
  }
}
