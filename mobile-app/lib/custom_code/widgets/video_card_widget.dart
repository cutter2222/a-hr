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

import 'package:video_player/video_player.dart';

class VideoCardWidget extends StatefulWidget {
  const VideoCardWidget({
    super.key,
    this.width,
    this.height,
    this.videoPath,
    this.isPlaying,
    this.loadWidget,
  });

  final double? width;
  final double? height;
  final String? videoPath;
  final bool? isPlaying;
  final Widget Function()? loadWidget;

  @override
  State<VideoCardWidget> createState() => _VideoCardWidgetState();
}

class _VideoCardWidgetState extends State<VideoCardWidget>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isVideoReady = false;
  double _loaderOpacity = 1.0;
  String? _errorMessage;

  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    if (widget.videoPath != null && widget.videoPath!.isNotEmpty) {
      _controller = VideoPlayerController.network(widget.videoPath!)
        ..initialize().then((_) {
          if (!mounted) return;
          setState(() {
            _isInitialized = true;
            _errorMessage = null;
          });
          _controller.setLooping(true);
          if (widget.isPlaying == true) {
            _controller.addListener(_checkVideoReady);
          } else {
            setState(() {
              _isVideoReady = true;
              _loaderOpacity = 0.0;
            });
            _animationController!.forward();
          }
        }).catchError((error) {
          if (!mounted) return;
          setState(() {
            _errorMessage = 'Не удалось загрузить видео: $error';
            _loaderOpacity = 0.0;
          });
          debugPrint(_errorMessage);
        });
    } else {
      setState(() {
        _errorMessage = 'Неверный путь к видео';
        _loaderOpacity = 0.0;
      });
    }
  }

  void _checkVideoReady() {
    // Проверяем, готово ли видео к воспроизведению
    final buffered = _controller.value.buffered;
    final duration = _controller.value.duration ??
        const Duration(seconds: 10); // Запасная длительность
    final bufferedDuration =
        buffered.isNotEmpty ? buffered.last.end : Duration.zero;
    final isBufferedEnough = bufferedDuration >= const Duration(seconds: 1) ||
        bufferedDuration >= duration;
    final isPlayingStarted = _controller.value.position > Duration.zero;
    final isVideoPlaying = _controller.value.isPlaying;

    if (isBufferedEnough &&
        !_controller.value.isBuffering &&
        isPlayingStarted &&
        isVideoPlaying) {
      setState(() {
        _isVideoReady = true;
        _loaderOpacity = 0.0;
      });
      _animationController!.forward();
      _controller.removeListener(_checkVideoReady);

      // Отладочные логи
      debugPrint('Video Ready: Position=${_controller.value.position}, '
          'Buffered=$bufferedDuration, Duration=$duration, '
          'IsPlaying=${_controller.value.isPlaying}, IsBuffering=${_controller.value.isBuffering}');
    } else {
      // Запускаем воспроизведение, если достаточно забуферизировано и не воспроизводится
      if (isBufferedEnough &&
          !_controller.value.isBuffering &&
          !isVideoPlaying) {
        _controller.play();
      }
      // Показываем заглушку, пока видео не готово
      if (!_isVideoReady) {
        setState(() {
          _loaderOpacity = 1.0;
        });
      }
      // Диагностические логи
      debugPrint('Video Not Ready: Position=${_controller.value.position}, '
          'Buffered=$bufferedDuration, Duration=$duration, '
          'IsPlaying=${_controller.value.isPlaying}, IsBuffering=${_controller.value.isBuffering}');
    }
  }

  @override
  void didUpdateWidget(VideoCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoPath != oldWidget.videoPath) {
      _controller.removeListener(_checkVideoReady);
      _controller.dispose();
      _animationController!.reset();
      _isInitialized = false;
      _isVideoReady = false;
      _loaderOpacity = 1.0;
      _errorMessage = null;
      _initializeVideoPlayer();
    } else if (widget.isPlaying != oldWidget.isPlaying) {
      if (widget.isPlaying == true && _isInitialized) {
        if (_isVideoReady && !_controller.value.isBuffering) {
          _controller.play();
        } else if (!_isVideoReady) {
          _controller.addListener(_checkVideoReady);
        }
      } else {
        _controller.pause();
        setState(() {
          _loaderOpacity = _isVideoReady ? 0.0 : 1.0;
        });
        if (!_isVideoReady) {
          _animationController!.forward();
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_checkVideoReady);
    _controller.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final containerWidth = widget.width ?? double.infinity;
    final containerHeight = widget.height ?? 200.0;

    // Ограничиваем размеры для loadWidget
    final effectiveWidth = containerWidth.isFinite
        ? containerWidth
        : MediaQuery.of(context).size.width;
    final effectiveHeight = containerHeight.isFinite ? containerHeight : 200.0;

    // Используем реальное соотношение сторон видео
    final aspectRatio = _isInitialized ? _controller.value.aspectRatio : 16 / 9;

    // Масштабируем по ширине контейнера
    final scaledWidth = effectiveWidth;
    final scaledHeight = scaledWidth / aspectRatio;

    return Container(
      width: containerWidth,
      height: containerHeight,
      color: Colors.black,
      child: Stack(
        children: [
          // Показываем VideoPlayer только когда видео полностью готово
          if (_isInitialized &&
              widget.videoPath != null &&
              _errorMessage == null &&
              _isVideoReady)
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: scaledWidth,
                  height: scaledHeight,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          // Показываем сообщение об ошибке, если есть
          if (_errorMessage != null)
            Center(
              child: Text(
                _errorMessage!,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).error,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          // Показываем заглушку, пока видео не готово
          AnimatedOpacity(
            opacity: _loaderOpacity,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            child: SizedBox(
              width: effectiveWidth,
              height: effectiveHeight,
              child: Center(
                child: widget.loadWidget != null
                    ? widget.loadWidget!()
                    : CircularProgressIndicator(
                        strokeCap: StrokeCap.round,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
