import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_blue_widget.dart';
import '/components/missions_list_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'branches_model.dart';
export 'branches_model.dart';

class BranchesWidget extends StatefulWidget {
  const BranchesWidget({
    super.key,
    required this.viewUsers,
  });

  final ViewUsersRow? viewUsers;

  static String routeName = 'Branches';
  static String routePath = '/branches';

  @override
  State<BranchesWidget> createState() => _BranchesWidgetState();
}

class _BranchesWidgetState extends State<BranchesWidget> {
  late BranchesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BranchesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.viewUsers?.branchOrderIndex != null) {
        _model.index = widget!.viewUsers!.branchOrderIndex!;
        safeSetState(() {});
      } else {
        return;
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  buttonSize: 50.0,
                  icon: Icon(
                    FFIcons.kchevronLeft,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                Expanded(
                  child: Text(
                    'Ветка',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<BranchesRow>>(
                future: BranchesTable().queryRows(
                  queryFn: (q) => q
                      .or("role.eq.${widget!.viewUsers?.role}, role.eq.${UserRole.all.name}")
                      .order('order_index', ascending: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 28.0,
                        height: 28.0,
                        child: SpinKitPulse(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 28.0,
                        ),
                      ),
                    );
                  }
                  List<BranchesRow> branchBranchesRowList = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final childBranches =
                                      branchBranchesRowList.toList();

                                  return Container(
                                    width: double.infinity,
                                    height: 250.0,
                                    child: CarouselSlider.builder(
                                      itemCount: childBranches.length,
                                      itemBuilder:
                                          (context, childBranchesIndex, _) {
                                        final childBranchesItem =
                                            childBranches[childBranchesIndex];
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              childBranchesItem.imageUrl,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/alabuga-app-3e3kcu/assets/shqudt2jd2kp/icon.jpeg',
                                            ),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.contain,
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselSliderController(),
                                      options: CarouselOptions(
                                        initialPage: max(
                                            0,
                                            min(
                                                valueOrDefault<int>(
                                                  widget!.viewUsers
                                                      ?.branchOrderIndex,
                                                  0,
                                                ),
                                                childBranches.length - 1)),
                                        viewportFraction: 0.5,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.6,
                                        enableInfiniteScroll: true,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: false,
                                        onPageChanged: (index, _) async {
                                          _model.carouselCurrentIndex = index;
                                          _model.index =
                                              _model.carouselCurrentIndex;
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          branchBranchesRowList
                                              .elementAtOrNull(_model.index)
                                              ?.name,
                                          'null',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            branchBranchesRowList
                                                .elementAtOrNull(_model.index)
                                                ?.description,
                                            'null',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      FutureBuilder<List<ViewMissionsRow>>(
                                        future: ViewMissionsTable().queryRows(
                                          queryFn: (q) => q,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 28.0,
                                                height: 28.0,
                                                child: SpinKitPulse(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 28.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ViewMissionsRow>
                                              viewMissionsViewMissionsRowList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible: viewMissionsViewMissionsRowList
                                                  .where((e) => e
                                                      .requiredBranchIds
                                                      .contains(
                                                          branchBranchesRowList
                                                              .elementAtOrNull(
                                                                  _model.index)
                                                              ?.id))
                                                  .toList()
                                                  .isNotEmpty,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Вам будут доступны следующие миссии',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final childViewMissions =
                                                              viewMissionsViewMissionsRowList
                                                                  .where((e) => e
                                                                      .requiredBranchIds
                                                                      .contains(branchBranchesRowList
                                                                          .elementAtOrNull(
                                                                              _model.index)
                                                                          ?.id))
                                                                  .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: List.generate(
                                                                childViewMissions
                                                                    .length,
                                                                (childViewMissionsIndex) {
                                                              final childViewMissionsItem =
                                                                  childViewMissions[
                                                                      childViewMissionsIndex];
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    MissionsListItemWidget(
                                                                  key: Key(
                                                                      'Keyvh2_${childViewMissionsIndex}_of_${childViewMissions.length}'),
                                                                  index: 0,
                                                                  isUnlocked:
                                                                      childViewMissionsItem
                                                                          .isUnlocked,
                                                                  viewMissionsRow:
                                                                      childViewMissionsItem,
                                                                ),
                                                              );
                                                            }).divide(SizedBox(
                                                                height: 16.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ]
                                        .addToStart(SizedBox(height: 16.0))
                                        .addToEnd(SizedBox(height: 128.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!(isWeb
                            ? MediaQuery.viewInsetsOf(context).bottom > 0
                            : _isKeyboardVisible))
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 50.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.mediumImpact();
                                  await UsersTable().update(
                                    data: {
                                      'branch_id': branchBranchesRowList
                                          .elementAtOrNull(_model.index)
                                          ?.id,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      currentUserUid,
                                    ),
                                  );
                                  context.safePop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Ваша ветка обновлена!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );

                                  safeSetState(() {});
                                },
                                child: wrapWithModel(
                                  model: _model.buttonBlueModel,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: ButtonBlueWidget(
                                    name: widget!.viewUsers?.branchId != null
                                        ? 'Сменить ветку'
                                        : 'Выбрать ветку',
                                    isInactive: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ].addToStart(SizedBox(height: 60.0)),
        ),
      ),
    );
  }
}
