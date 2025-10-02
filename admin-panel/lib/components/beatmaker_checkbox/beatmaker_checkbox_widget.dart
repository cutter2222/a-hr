import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'beatmaker_checkbox_model.dart';
export 'beatmaker_checkbox_model.dart';

class BeatmakerCheckboxWidget extends StatefulWidget {
  const BeatmakerCheckboxWidget({
    super.key,
    required this.usersRow,
  });

  final UsersRow? usersRow;

  @override
  State<BeatmakerCheckboxWidget> createState() =>
      _BeatmakerCheckboxWidgetState();
}

class _BeatmakerCheckboxWidgetState extends State<BeatmakerCheckboxWidget> {
  late BeatmakerCheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeatmakerCheckboxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (_model.isCheck) {
          return Icon(
            Icons.check_box,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 28.0,
          );
        } else {
          return Icon(
            Icons.check_box_outline_blank_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 28.0,
          );
        }
      },
    );
  }
}
