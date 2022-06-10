import 'dart:math' as math show sin, pi;

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Loading {
  static show({String msg = ''}) {
    SmartDialog.showLoading(
      msg: msg,
      maskColor: Colors.black12,
      builder: (context) => LoadingWiget(msg: msg),
    );
  }

  static dismiss() {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }
}

class LoadingWiget extends StatelessWidget {
  const LoadingWiget({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 18),
              const Ball3OpacityLoading(),
              if (msg.isNotEmpty) LoadingText(msg: msg),
              SizedBox(height: msg.isNotEmpty ? 10 : 18),
            ],
          ),
        ),
      ],
    );
  }
}

class LoadingText extends StatelessWidget {
  const LoadingText({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        msg,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Ball3OpacityLoading extends StatefulWidget {
  final Duration duration;
  final Curve curve;

  const Ball3OpacityLoading(
      {Key? key,
      this.duration = const Duration(milliseconds: 1400),
      this.curve = Curves.linear})
      : super(key: key);

  @override
  _Ball3OpacityLoadingState createState() => _Ball3OpacityLoadingState();
}

class _Ball3OpacityLoadingState extends State<Ball3OpacityLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation> _animations = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
    List.generate(3, (index) {
      _animations.add(DelayTween(begin: 0.2, end: 1.0, delay: 0.2 * index)
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve)));
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _animations[index].value,
                child: const SizedBox(
                  width: 8,
                  height: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

class DelayTween extends Tween<double> {
  final double delay;

  DelayTween({required double begin, required double end, required this.delay})
      : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
