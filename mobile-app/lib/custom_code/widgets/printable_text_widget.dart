// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class PrintableTextWidget extends StatefulWidget {
  const PrintableTextWidget({
    super.key,
    this.width,
    this.height, // Используется для ограничения контейнера 3
    this.text = '',
    this.textColor,
    this.textSize,
    this.speed = 50.0,
    this.fontWeight = 400,
    this.fontName,
    this.position = 'C',
  });

  final double? width;
  final double? height;
  final String text;
  final Color? textColor;
  final double? textSize;
  final double speed;
  final int fontWeight;
  final String? fontName;
  final String position;

  @override
  State<PrintableTextWidget> createState() => _PrintableTextWidgetState();
}

class _PrintableTextWidgetState extends State<PrintableTextWidget>
    with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController _cursorController;
  late ScrollController _scrollController;
  int _currentCharIndex = 0;
  String _displayedText = '';
  double _calculatedHeight = 0.0;
  final GlobalKey _textKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // Контроллер для печати текста
    _textController = AnimationController(
      duration: Duration(
          milliseconds: (500 - (widget.speed.clamp(0.0, 100.0) * 4.5)).round()),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed && mounted) {
          if (_currentCharIndex < widget.text.length) {
            setState(() {
              _displayedText = widget.text.substring(0, ++_currentCharIndex);
            });
            _textController
              ..reset()
              ..forward();
            // Автоматическая прокрутка к нижней части
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                );
              }
            });
          } else {
            _textController
                .stop(); // Останавливаем анимацию после полной печати
          }
        }
      });

    // Контроллер для мигания курсора
    _cursorController = AnimationController(
      duration:
          const Duration(milliseconds: 1000), // Медленное мигание (1 секунда)
      vsync: this,
    )..repeat(reverse: true); // Постоянное мигание

    if (widget.text.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _updateHeight());
      _textController.forward();
    }
  }

  void _updateHeight() {
    if (mounted) {
      final RenderBox? renderBox =
          _textKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          _calculatedHeight =
              renderBox.size.height + 72; // 24px сверху + 48px снизу
        });
      }
    }
  }

  @override
  void didUpdateWidget(PrintableTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.speed != widget.speed ||
        oldWidget.text != widget.text ||
        oldWidget.textSize != widget.textSize ||
        oldWidget.fontWeight != widget.fontWeight ||
        oldWidget.fontName != widget.fontName ||
        oldWidget.width != widget.width) {
      _textController.duration = Duration(
          milliseconds: (500 - (widget.speed.clamp(0.0, 100.0) * 4.5)).round());
      if (oldWidget.text != widget.text ||
          oldWidget.textSize != widget.textSize ||
          oldWidget.fontWeight != widget.fontWeight ||
          oldWidget.fontName != widget.fontName ||
          oldWidget.width != widget.width) {
        _currentCharIndex = 0;
        _displayedText = '';
        WidgetsBinding.instance.addPostFrameCallback((_) => _updateHeight());
        if (_textController.isAnimating) {
          _textController
            ..stop()
            ..reset()
            ..forward();
        } else if (widget.text.isNotEmpty) {
          _textController.forward();
        }
      }
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _cursorController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: widget.textColor ?? Colors.black,
      fontSize: widget.textSize ?? 16.0,
      fontFamily: widget.fontName?.isNotEmpty == true ? widget.fontName : null,
      fontWeight: FontWeight.values.firstWhere(
        (w) => w.value == widget.fontWeight,
        orElse: () => FontWeight.w400,
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = widget.width ?? constraints.maxWidth;
        final availableHeight = widget.height ?? _calculatedHeight;
        return Container(
          width: availableWidth,
          height: availableHeight,
          child: Center(
            child: SingleChildScrollView(
              controller: _scrollController,
              primary: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    24.0, 24.0, 24.0, 48.0), // Увеличенный отступ снизу
                child: Stack(
                  children: [
                    // Невидимый RichText для расчёта высоты
                    Offstage(
                      child: RichText(
                        key: _textKey,
                        textAlign: _getTextAlign(),
                        softWrap: true,
                        maxLines: null,
                        text: TextSpan(
                          text: widget.text,
                          style: textStyle,
                        ),
                      ),
                    ),
                    // Анимированный текст с курсором в конце
                    RichText(
                      textAlign: _getTextAlign(),
                      softWrap: true,
                      maxLines: null,
                      text: TextSpan(
                        children: [
                          // Анимированный текст
                          TextSpan(
                            text: _displayedText,
                            style: textStyle,
                          ),
                          // Курсор в конце
                          WidgetSpan(
                            child: AnimatedBuilder(
                              animation: _cursorController,
                              builder: (_, __) => Opacity(
                                opacity: _cursorController.value,
                                child: Container(
                                  width: 2,
                                  height: (widget.textSize ?? 16.0) + 4,
                                  color: widget.textColor ?? Colors.black,
                                  margin: const EdgeInsets.only(
                                      left: 4), // Отступ слева от текста
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  TextAlign _getTextAlign() {
    return switch (widget.position) {
      'L' => TextAlign.left,
      'R' => TextAlign.right,
      _ => TextAlign.center,
    };
  }
}
