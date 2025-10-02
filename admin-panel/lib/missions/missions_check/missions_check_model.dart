import '/backend/supabase/supabase.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'missions_check_widget.dart' show MissionsCheckWidget;
import 'package:flutter/material.dart';

class MissionsCheckModel extends FlutterFlowModel<MissionsCheckWidget> {
  ///  Local state fields for this page.

  String statusFilter = 'pending';

  ///  State fields for stateful widgets in this page.

  // Model for NavbarDesktop component.
  late NavbarDesktopModel navbarDesktopModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ViewUserMissionsRow>();
  // Model for NavbarMobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navbarDesktopModel = createModel(context, () => NavbarDesktopModel());
    navbarMobileModel = createModel(context, () => NavbarMobileModel());
  }

  @override
  void dispose() {
    navbarDesktopModel.dispose();
    paginatedDataTableController.dispose();
    navbarMobileModel.dispose();
  }
}
