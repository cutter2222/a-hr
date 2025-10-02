import '/backend/supabase/supabase.dart';
import '/components/home_reward_row_item_widget.dart';
import '/components/level_progress_widget.dart';
import '/components/profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'profile_details_model.dart';
export 'profile_details_model.dart';

class ProfileDetailsWidget extends StatefulWidget {
  const ProfileDetailsWidget({
    super.key,
    required this.userId,
  });

  final String? userId;

  static String routeName = 'ProfileDetails';
  static String routePath = '/profileDetails';

  @override
  State<ProfileDetailsWidget> createState() => _ProfileDetailsWidgetState();
}

class _ProfileDetailsWidgetState extends State<ProfileDetailsWidget> {
  late ProfileDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

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
                    'Данные пользователя',
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
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    buttonSize: 50.0,
                    icon: Icon(
                      FFIcons.kshareIOSExport,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await Share.share(
                        'Я покоряю космос вместе с Alabuga App',
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<ViewUsersRow>>(
                future: ViewUsersTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'id',
                    widget!.userId,
                  ),
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
                  List<ViewUsersRow> viewUsersViewUsersRowList = snapshot.data!;

                  final viewUsersViewUsersRow =
                      viewUsersViewUsersRowList.isNotEmpty
                          ? viewUsersViewUsersRowList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.profileAvatarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ProfileAvatarWidget(
                                      imagePath:
                                          viewUsersViewUsersRow?.photoUrl,
                                      firstName:
                                          viewUsersViewUsersRow?.firstName,
                                      lastName: viewUsersViewUsersRow?.lastName,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.levelProgressModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: LevelProgressWidget(
                                      viewUsers: viewUsersViewUsersRow!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder<List<UserRewardsRow>>(
                            future: UserRewardsTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'user_id',
                                widget!.userId,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 28.0,
                                    height: 28.0,
                                    child: SpinKitPulse(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 28.0,
                                    ),
                                  ),
                                );
                              }
                              List<UserRewardsRow>
                                  userRewardsUserRewardsRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible:
                                      userRewardsUserRewardsRowList.isNotEmpty,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 42.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      RewardsWidget.routeName);
                                                },
                                                child: Text(
                                                  'Артефакты',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      RewardsWidget.routeName);
                                                },
                                                child: Text(
                                                  'Все',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
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
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child:
                                            FutureBuilder<List<ViewRewardsRow>>(
                                          future: ViewRewardsTable().queryRows(
                                            queryFn: (q) => q.inFilterOrNull(
                                              'id',
                                              userRewardsUserRewardsRowList
                                                  .map((e) => e.rewardId)
                                                  .withoutNulls
                                                  .toList(),
                                            ),
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
                                            List<ViewRewardsRow>
                                                rowViewRewardsRowList =
                                                snapshot.data!;

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                        rowViewRewardsRowList
                                                            .length, (rowIndex) {
                                                  final rowViewRewardsRow =
                                                      rowViewRewardsRowList[
                                                          rowIndex];
                                                  return HomeRewardRowItemWidget(
                                                    key: Key(
                                                        'Keyuzr_${rowIndex}_of_${rowViewRewardsRowList.length}'),
                                                    isUnlocked:
                                                        rowViewRewardsRow
                                                            .isEarned,
                                                    viewRewards:
                                                        rowViewRewardsRow,
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(width: 16.0))
                                                    .addToStart(
                                                        SizedBox(width: 16.0))
                                                    .addToEnd(
                                                        SizedBox(width: 16.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ]
                            .addToStart(SizedBox(height: 24.0))
                            .addToEnd(SizedBox(height: 128.0)),
                      ),
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
