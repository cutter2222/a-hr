import '/components/app_bar_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/components/upload_image_new_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'rewards_add_widget.dart' show RewardsAddWidget;
import 'package:flutter/material.dart';

class RewardsAddModel extends FlutterFlowModel<RewardsAddWidget> {
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
  // State field(s) for HowToGetInput widget.
  FocusNode? howToGetInputFocusNode;
  TextEditingController? howToGetInputTextController;
  String? Function(BuildContext, String?)? howToGetInputTextControllerValidator;
  // Model for uploadImage_new component.
  late UploadImageNewModel uploadImageNewModel;
  // State field(s) for RankInput widget.
  String? rankInputValue;
  FormFieldController<String>? rankInputValueController;
  bool isDataUploading_uploadDataOdy = false;
  FFUploadedFile uploadedLocalFile_uploadDataOdy =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataOdy = '';

  bool isDataUploading_uploadDataSave = false;
  FFUploadedFile uploadedLocalFile_uploadDataSave =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataSave = '';

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

    howToGetInputFocusNode?.dispose();
    howToGetInputTextController?.dispose();

    uploadImageNewModel.dispose();
    navbarMobileModel.dispose();
  }
}
