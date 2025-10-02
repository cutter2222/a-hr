import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/activity_item_widget.dart';
import '/components/calendar_date_item_widget.dart';
import '/components/choice_chips_widget.dart';
import '/components/message_widget.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'events_widget.dart' show EventsWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  Local state fields for this page.

  DateTime? currentDate;

  DateTime? datePicked;

  List<DateTime> dateList = [];
  void addToDateList(DateTime item) => dateList.add(item);
  void removeFromDateList(DateTime item) => dateList.remove(item);
  void removeAtIndexFromDateList(int index) => dateList.removeAt(index);
  void insertAtIndexInDateList(int index, DateTime item) =>
      dateList.insert(index, item);
  void updateDateListAtIndex(int index, Function(DateTime) updateFn) =>
      dateList[index] = updateFn(dateList[index]);

  int? initialIndex;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Model for ChoiceChips component.
  late ChoiceChipsModel choiceChipsModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    choiceChipsModel = createModel(context, () => ChoiceChipsModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    choiceChipsModel.dispose();
    expandableExpandableController.dispose();
    navbarModel.dispose();
  }
}
