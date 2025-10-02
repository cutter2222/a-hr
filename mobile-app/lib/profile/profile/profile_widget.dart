import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_logout_widget.dart';
import '/components/bottom_upload_file_widget.dart';
import '/components/icon_list_item_widget.dart';
import '/components/navbar_widget.dart';
import '/components/profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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
        body: Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: Lottie.asset(
                'assets/jsons/stars_lottie.json',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 180.0,
                fit: BoxFit.contain,
                animate: true,
              ),
            ),
            FutureBuilder<List<UsersRow>>(
              future: UsersTable().querySingleRow(
                queryFn: (q) => q.eqOrNull(
                  'id',
                  currentUserUid,
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
                List<UsersRow> queryUsersUsersRowList = snapshot.data!;

                final queryUsersUsersRow = queryUsersUsersRowList.isNotEmpty
                    ? queryUsersUsersRowList.first
                    : null;

                return Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.profileAvatarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ProfileAvatarWidget(
                                imagePath: queryUsersUsersRow?.photoUrl,
                                firstName: queryUsersUsersRow?.firstName,
                                lastName: queryUsersUsersRow?.lastName,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 48.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  ProfileEditWidget.routeName,
                                  queryParameters: {
                                    'usersRow': serializeParam(
                                      queryUsersUsersRow,
                                      ParamType.SupabaseRow,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: wrapWithModel(
                                model: _model.iconListItemModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: IconListItemWidget(
                                  icon: Icon(
                                    FFIcons.kfileEdit,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  text: 'Мои данные',
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                ProfileResumeWidget.routeName,
                                queryParameters: {
                                  'usersRow': serializeParam(
                                    queryUsersUsersRow,
                                    ParamType.SupabaseRow,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: wrapWithModel(
                              model: _model.iconListItemModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: IconListItemWidget(
                                icon: Icon(
                                  FFIcons.klistChecklist,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                text: 'Мое резюме',
                              ),
                            ),
                          ),
                          if (false)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: BottomUploadFileWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: wrapWithModel(
                                model: _model.iconListItemModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: IconListItemWidget(
                                  icon: Icon(
                                    Icons.file_copy,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  text: 'Загрузка Media',
                                ),
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(ProfileAboutWidget.routeName);
                            },
                            child: wrapWithModel(
                              model: _model.iconListItemModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: IconListItemWidget(
                                icon: Icon(
                                  FFIcons.kinfoCircle,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                text: 'О приложении',
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BottomLogoutWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(
                                  () => _model.bottomLogout = value));

                              _shouldSetState = true;
                              if (_model.bottomLogout!) {
                                context.goNamedAuth(OnboardingWidget.routeName,
                                    context.mounted);

                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();
                              } else {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.iconListItemModel5,
                              updateCallback: () => safeSetState(() {}),
                              child: IconListItemWidget(
                                icon: Icon(
                                  FFIcons.klogOut,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                text: 'Выйти',
                              ),
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 134.0))
                            .addToEnd(SizedBox(height: 130.0)),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 52.0),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: NavbarWidget(
                    index: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
