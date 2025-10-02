import '/components/app_bar_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/components/upload_image_new_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'branches_add_widget.dart' show BranchesAddWidget;
import 'package:flutter/material.dart';

class BranchesAddModel extends FlutterFlowModel<BranchesAddWidget> {
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
  // State field(s) for RoleInput widget.
  String? roleInputValue;
  FormFieldController<String>? roleInputValueController;
  // State field(s) for OrderInput widget.
  FocusNode? orderInputFocusNode;
  TextEditingController? orderInputTextController;
  String? Function(BuildContext, String?)? orderInputTextControllerValidator;
  // Model for uploadImage_new component.
  late UploadImageNewModel uploadImageNewModel;
  // State field(s) for StatusInput widget.
  String? statusInputValue;
  FormFieldController<String>? statusInputValueController;
  bool isDataUploading_uploadDataCgk = false;
  FFUploadedFile uploadedLocalFile_uploadDataCgk =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataCgk = '';

  bool isDataUploading_uploadDataZis = false;
  FFUploadedFile uploadedLocalFile_uploadDataZis =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataZis = '';

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

    orderInputFocusNode?.dispose();
    orderInputTextController?.dispose();

    uploadImageNewModel.dispose();
    navbarMobileModel.dispose();
  }
}
