import '/backend/supabase/supabase.dart';
import '/components/list_item/list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'dialog_show_user_info_model.dart';
export 'dialog_show_user_info_model.dart';

class DialogShowUserInfoWidget extends StatefulWidget {
  const DialogShowUserInfoWidget({
    super.key,
    required this.user,
  });

  final UsersRow? user;

  @override
  State<DialogShowUserInfoWidget> createState() =>
      _DialogShowUserInfoWidgetState();
}

class _DialogShowUserInfoWidgetState extends State<DialogShowUserInfoWidget> {
  late DialogShowUserInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogShowUserInfoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 420.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 420.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Данные пользователя',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelMediumIsCustom,
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
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 6.0)),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.listItemModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Имя',
                                  value: widget.user?.firstName,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Фамилия',
                                  value: widget.user?.lastName,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Email',
                                  value: widget.user?.email,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Опыт',
                                  value: widget.user?.xpPoints.toString(),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Уровень',
                                  value: widget.user?.level.toString(),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel6,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Роль',
                                  value: widget.user?.role,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel7,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Дата рождения',
                                  value: dateTimeFormat(
                                      "dd.MM.y", widget.user?.birthDate),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel8,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Компания',
                                  value: widget.user?.companyName,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel9,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Должность',
                                  value: widget.user?.companyPosition,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel10,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Начало работы в компании',
                                  value: dateTimeFormat("dd.MM.y",
                                      widget.user?.companyStartDate),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel11,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Монет',
                                  value: widget.user?.coins.toString(),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel12,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Никнейм',
                                  value: widget.user?.nickname,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel13,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Город',
                                  value: widget.user?.city,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel14,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Личные качества',
                                  value: widget.user?.qualities,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel15,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Хобби',
                                  value: widget.user?.hobby,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel16,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Основное образование',
                                  value: widget.user?.education,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel17,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Доп образование',
                                  value: widget.user?.training,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel18,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'Опыт работы',
                                  value: widget.user?.worked,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.listItemModel19,
                                updateCallback: () => safeSetState(() {}),
                                child: ListItemWidget(
                                  label: 'О себе',
                                  value: widget.user?.aboutMe,
                                ),
                              ),
                            ]
                                .addToStart(SizedBox(height: 24.0))
                                .addToEnd(SizedBox(height: 24.0)),
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
      ),
    );
  }
}
