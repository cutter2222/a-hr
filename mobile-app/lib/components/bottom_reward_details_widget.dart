import '/backend/supabase/supabase.dart';
import '/components/bordered_container_widget.dart';
import '/components/choice_chips_widget.dart';
import '/components/reward_grid_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_reward_details_model.dart';
export 'bottom_reward_details_model.dart';

class BottomRewardDetailsWidget extends StatefulWidget {
  const BottomRewardDetailsWidget({
    super.key,
    required this.viewRewardsRow,
  });

  final ViewRewardsRow? viewRewardsRow;

  @override
  State<BottomRewardDetailsWidget> createState() =>
      _BottomRewardDetailsWidgetState();
}

class _BottomRewardDetailsWidgetState extends State<BottomRewardDetailsWidget> {
  late BottomRewardDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomRewardDetailsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 240.0,
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).bottomBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: Container(
                width: 32.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).inputBorder,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Информация об артефакте',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).inputBorder,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kcloseMD,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.rewardGridItemModel,
                        updateCallback: () => safeSetState(() {}),
                        child: RewardGridItemWidget(
                          index: 0,
                          isUnlocked: true,
                          viewRewards: widget!.viewRewardsRow!,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (widget!.viewRewardsRow?.isEarned ?? false) {
                              return wrapWithModel(
                                model: _model.choiceChipsModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ChoiceChipsWidget(
                                  text: 'У вас нет этого предмета',
                                  isPicked: false,
                                ),
                              );
                            } else {
                              return wrapWithModel(
                                model: _model.choiceChipsModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ChoiceChipsWidget(
                                  text: 'У вас есть этот предмет',
                                  isPicked: true,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    if (widget!.viewRewardsRow?.requiredRankId != null)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              child: Container(
                                width: 32.0,
                                height: 32.0,
                                decoration: BoxDecoration(),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    widget!.viewRewardsRow?.rankBadgeImageUrl,
                                    'null',
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Доступно для ранга',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget!.viewRewardsRow?.rankTitle,
                                          'null',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.borderedContainerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BorderedContainerWidget(
                          title: 'Редкость: ${valueOrDefault<String>(
                            widget!.viewRewardsRow?.rarityName,
                            'null',
                          )}',
                          text: valueOrDefault<String>(
                            widget!.viewRewardsRow?.description,
                            'null',
                          ),
                          color1: colorFromCssString(
                            widget!.viewRewardsRow!.rarityColor!,
                            defaultColor: FlutterFlowTheme.of(context).primary,
                          ),
                          color2: Color(0xFF90B2C1),
                          gradientAngle: 180.0,
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(height: 24.0))
                      .addToEnd(SizedBox(height: 60.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
