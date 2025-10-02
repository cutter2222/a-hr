import '/backend/supabase/supabase.dart';
import '/components/app_bar_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/components/upload_image_new_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'shop_add_widget.dart' show ShopAddWidget;
import 'package:flutter/material.dart';

class ShopAddModel extends FlutterFlowModel<ShopAddWidget> {
  ///  Local state fields for this page.

  int? category;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in ShopAdd widget.
  List<ShopCategoriesRow>? outputCategory;
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
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for PriceInput widget.
  FocusNode? priceInputFocusNode;
  TextEditingController? priceInputTextController;
  String? Function(BuildContext, String?)? priceInputTextControllerValidator;
  // State field(s) for StockInput widget.
  FocusNode? stockInputFocusNode;
  TextEditingController? stockInputTextController;
  String? Function(BuildContext, String?)? stockInputTextControllerValidator;
  // State field(s) for LimitInput widget.
  FocusNode? limitInputFocusNode;
  TextEditingController? limitInputTextController;
  String? Function(BuildContext, String?)? limitInputTextControllerValidator;
  // Model for uploadImage_new component.
  late UploadImageNewModel uploadImageNewModel;
  // State field(s) for StatusInput widget.
  bool? statusInputValue;
  FormFieldController<bool>? statusInputValueController;
  bool isDataUploading_uploadUpdate = false;
  FFUploadedFile uploadedLocalFile_uploadUpdate =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadUpdate = '';

  bool isDataUploading_uploadData5i7 = false;
  FFUploadedFile uploadedLocalFile_uploadData5i7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData5i7 = '';

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

    priceInputFocusNode?.dispose();
    priceInputTextController?.dispose();

    stockInputFocusNode?.dispose();
    stockInputTextController?.dispose();

    limitInputFocusNode?.dispose();
    limitInputTextController?.dispose();

    uploadImageNewModel.dispose();
    navbarMobileModel.dispose();
  }
}
