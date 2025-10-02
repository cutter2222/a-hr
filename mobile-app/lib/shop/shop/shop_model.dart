import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choice_chips_widget.dart';
import '/components/coins_item_widget.dart';
import '/components/navbar_widget.dart';
import '/components/shop_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'shop_widget.dart' show ShopWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ShopModel extends FlutterFlowModel<ShopWidget> {
  ///  Local state fields for this page.

  int? categoryId;

  ///  State fields for stateful widgets in this page.

  // Model for CoinsItem component.
  late CoinsItemModel coinsItemModel;
  // Model for ChoiceChips component.
  late ChoiceChipsModel choiceChipsModel1;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    coinsItemModel = createModel(context, () => CoinsItemModel());
    choiceChipsModel1 = createModel(context, () => ChoiceChipsModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    coinsItemModel.dispose();
    choiceChipsModel1.dispose();
    navbarModel.dispose();
  }
}
