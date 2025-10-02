import '/backend/supabase/supabase.dart';
import '/components/button/button_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reward_rarities_widget.dart' show RewardRaritiesWidget;
import 'package:flutter/material.dart';

class RewardRaritiesModel extends FlutterFlowModel<RewardRaritiesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavbarDesktop component.
  late NavbarDesktopModel navbarDesktopModel;
  // Model for Button component.
  late ButtonModel buttonModel;
  // State field(s) for SearchInput widget.
  FocusNode? searchInputFocusNode;
  TextEditingController? searchInputTextController;
  String? Function(BuildContext, String?)? searchInputTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<RewardRaritiesRow>();
  // Model for NavbarMobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navbarDesktopModel = createModel(context, () => NavbarDesktopModel());
    buttonModel = createModel(context, () => ButtonModel());
    navbarMobileModel = createModel(context, () => NavbarMobileModel());
  }

  @override
  void dispose() {
    navbarDesktopModel.dispose();
    buttonModel.dispose();
    searchInputFocusNode?.dispose();
    searchInputTextController?.dispose();

    paginatedDataTableController.dispose();
    navbarMobileModel.dispose();
  }
}
