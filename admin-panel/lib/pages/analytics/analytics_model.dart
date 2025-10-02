import '/components/chart_widget.dart';
import '/components/navbar_desktop/navbar_desktop_widget.dart';
import '/components/navbar_mobile/navbar_mobile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'analytics_widget.dart' show AnalyticsWidget;
import 'package:flutter/material.dart';

class AnalyticsModel extends FlutterFlowModel<AnalyticsWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  DateTime? endDate;

  String tab = 'users';

  List<double> test = [];
  void addToTest(double item) => test.add(item);
  void removeFromTest(double item) => test.remove(item);
  void removeAtIndexFromTest(int index) => test.removeAt(index);
  void insertAtIndexInTest(int index, double item) => test.insert(index, item);
  void updateTestAtIndex(int index, Function(double) updateFn) =>
      test[index] = updateFn(test[index]);

  List<DateTime> test2 = [];
  void addToTest2(DateTime item) => test2.add(item);
  void removeFromTest2(DateTime item) => test2.remove(item);
  void removeAtIndexFromTest2(int index) => test2.removeAt(index);
  void insertAtIndexInTest2(int index, DateTime item) =>
      test2.insert(index, item);
  void updateTest2AtIndex(int index, Function(DateTime) updateFn) =>
      test2[index] = updateFn(test2[index]);

  ///  State fields for stateful widgets in this page.

  // Model for NavbarDesktop component.
  late NavbarDesktopModel navbarDesktopModel;
  // Model for Chart component.
  late ChartModel chartModel;
  // Model for NavbarMobile component.
  late NavbarMobileModel navbarMobileModel;

  @override
  void initState(BuildContext context) {
    navbarDesktopModel = createModel(context, () => NavbarDesktopModel());
    chartModel = createModel(context, () => ChartModel());
    navbarMobileModel = createModel(context, () => NavbarMobileModel());
  }

  @override
  void dispose() {
    navbarDesktopModel.dispose();
    chartModel.dispose();
    navbarMobileModel.dispose();
  }
}
