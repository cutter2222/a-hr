import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/choice_chips_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'shop_details_widget.dart' show ShopDetailsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopDetailsModel extends FlutterFlowModel<ShopDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChoiceChips component.
  late ChoiceChipsModel choiceChipsModel;
  // Model for ButtonBlue component.
  late ButtonBlueModel buttonBlueModel;
  // Stores action output result for [Custom Action - purchaseShopProduct] action in ButtonBlue widget.
  String? purchaseShopProduct;

  @override
  void initState(BuildContext context) {
    choiceChipsModel = createModel(context, () => ChoiceChipsModel());
    buttonBlueModel = createModel(context, () => ButtonBlueModel());
  }

  @override
  void dispose() {
    choiceChipsModel.dispose();
    buttonBlueModel.dispose();
  }
}
