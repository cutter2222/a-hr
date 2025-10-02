import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_branch_item_model.dart';
export 'home_branch_item_model.dart';

class HomeBranchItemWidget extends StatefulWidget {
  const HomeBranchItemWidget({
    super.key,
    this.viewUsersRow,
  });

  final ViewUsersRow? viewUsersRow;

  @override
  State<HomeBranchItemWidget> createState() => _HomeBranchItemWidgetState();
}

class _HomeBranchItemWidgetState extends State<HomeBranchItemWidget> {
  late HomeBranchItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeBranchItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          BranchesWidget.routeName,
          queryParameters: {
            'viewUsers': serializeParam(
              widget!.viewUsersRow,
              ParamType.SupabaseRow,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: double.infinity,
        height: 120.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).containerAccent
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(-1.0, -0.34),
            end: AlignmentDirectional(1.0, 0.34),
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            width: double.infinity,
            height: 256.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: AlignmentDirectional(0.0, -1.0),
                image: Image.asset(
                  'assets/images/bg_shop_1.webp',
                ).image,
              ),
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Builder(
              builder: (context) {
                if ((widget!.viewUsersRow != null) &&
                    (widget!.viewUsersRow?.branchName != null &&
                        widget!.viewUsersRow?.branchName != '')) {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          valueOrDefault<String>(
                            widget!.viewUsersRow?.branchImageUrl,
                            'null',
                          ),
                          width: 44.0,
                          height: 44.0,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.viewUsersRow?.branchName,
                            'null',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/branch_icon.webp',
                          width: 44.0,
                          height: 44.0,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Выбрать ветку',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
