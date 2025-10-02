import '/backend/supabase/supabase.dart';
import '/components/button_filter/button_filter_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'users_widget.dart' show UsersWidget;
import 'package:flutter/material.dart';

class UsersModel extends FlutterFlowModel<UsersWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavbarDesktop component.
  late NavbarDesktopModel navbarDesktopModel;
  // Model for ButtonFilter component.
  late ButtonFilterModel buttonFilterModel;
  // State field(s) for SearchInput widget.
  FocusNode? searchInputFocusNode;
  TextEditingController? searchInputTextController;
  String? Function(BuildContext, String?)? searchInputTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRow>();
  // Model for NavbarMobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navbarDesktopModel = createModel(context, () => NavbarDesktopModel());
    buttonFilterModel = createModel(context, () => ButtonFilterModel());
    navbarMobileModel = createModel(context, () => NavbarMobileModel());
  }

  @override
  void dispose() {
    navbarDesktopModel.dispose();
    buttonFilterModel.dispose();
    searchInputFocusNode?.dispose();
    searchInputTextController?.dispose();

    paginatedDataTableController.dispose();
    navbarMobileModel.dispose();
  }
}
