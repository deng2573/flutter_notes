import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// 按下时高亮
class TouchableHighlight extends StatefulWidget {
  const TouchableHighlight({
    Key? key,
    required this.child,
    this.onPressed,
    this.color = const Color(0xFFFFFFFF),
    this.activeColor = const Color(0xFFDEDEDE),
    this.style = const TextStyle(),
    this.activeStyle = const TextStyle(),
    this.disabled = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  final TextStyle style;
  final TextStyle activeStyle;
  final Color activeColor;
  final bool disabled;
  @override
  _TouchableHighlightState createState() => _TouchableHighlightState();
}

class _TouchableHighlightState extends State<TouchableHighlight> {
  @override
  void initState() {
    super.initState();
    bg = widget.color;
    _style = widget.style;
  }

  late Color bg;
  late TextStyle _style;

  _onTapDown(e) {
    if (widget.disabled) return;
    setState(() {
      bg = widget.activeColor;
      _style = widget.activeStyle;
    });
  }

  _onTapUp(e) {
    if (widget.disabled) {
      return;
    }

    setState(() {
      bg = widget.color;
      _style = widget.style;
    });

    if (widget.onPressed != null) {
      widget.onPressed?.call();
    }
  }

  _onTapCancel() {
    if (widget.disabled) {
      return;
    }

    setState(() {
      bg = widget.color;
      _style = widget.style;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Container(
        color: bg,
        child: DefaultTextStyle(
          style: _style,
          child: widget.child,
        ),
      ),
    );
  }
}

/// 按下时不透明度发生变化
class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({
    Key? key,
    required this.child,
    this.onPressed,
    this.opacity = 0.5,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final double opacity;

  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  double opacity = 1;

  _onTapDown(e) {
    setState(() {
      opacity = widget.opacity;
    });
  }

  _onTapUp(e) {
    setState(() {
      opacity = 1;
    });
    if (widget.onPressed != null) {
      widget.onPressed?.call();
    }
  }

  _onTapCancel() {
    setState(() {
      opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: opacity,
        child: widget.child,
      ),
    );
  }
}

/// 按下时不透明度发生变化
class ScaleTap extends StatefulWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget? child;
  final Duration duration;
  final double scaleMinValue;
  final Curve? scaleCurve;
  final Curve? opacityCurve;
  final double opacityMinValue;

  const ScaleTap({
    Key? key,
    this.onPressed,
    this.onLongPress,
    this.child,
    this.duration = const Duration(milliseconds: 300),
    this.scaleMinValue = 0.95,
    this.opacityMinValue = 1.0,
    this.scaleCurve,
    this.opacityCurve,
  }) : super(key: key);

  @override
  _ScaleTapState createState() => _ScaleTapState();
}

class _ScaleTapState extends State<ScaleTap>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: widget.scaleMinValue,
    ).animate(CurvedAnimation(
      curve: _computedScaleCurve,
      parent: _animationController,
    ));
    _opacity = Tween<double>(
      begin: 1.0,
      end: widget.opacityMinValue,
    ).animate(CurvedAnimation(
      curve: _computedOpacityCurve,
      parent: _animationController,
    ));
  }

  @override
  void didUpdateWidget(covariant ScaleTap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _animationController.duration = widget.duration;
    }
    if (widget.scaleMinValue != oldWidget.scaleMinValue) {
      _scale = Tween<double>(
        begin: 1.0,
        end: widget.scaleMinValue,
      ).animate(CurvedAnimation(
        curve: _computedScaleCurve,
        parent: _animationController,
      ));
    }
    if (widget.opacityMinValue != oldWidget.opacityMinValue) {
      _opacity = Tween<double>(
        begin: 1.0,
        end: widget.opacityMinValue,
      ).animate(CurvedAnimation(
        curve: _computedOpacityCurve,
        parent: _animationController,
      ));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Curve get _computedScaleCurve {
    return widget.scaleCurve ?? CurveSpring();
  }

  Curve get _computedOpacityCurve {
    return widget.opacityCurve ?? Curves.ease;
  }

  void _onTapDown(_) {
    _animationController.forward();
  }

  void _onTapUp(_) {
    _animationController.reverse();
  }

  void _onTapCancel(_) {
    _onTapUp(_);
  }

  Widget _container({required Widget child}) {
    if (widget.onPressed != null || widget.onLongPress != null) {
      return Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: _onTapDown,
        onPointerCancel: _onTapCancel,
        onPointerUp: _onTapUp,
        onPointerMove: _onTapCancel,
        child: GestureDetector(
          onTap: widget.onPressed,
          onLongPress: widget.onLongPress,
          child: child,
        ),
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return _container(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) {
          return Opacity(
            opacity: _opacity.value,
            child: Transform.scale(
              alignment: Alignment.center,
              scale: _scale.value,
              child: child,
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}

class CurveSpring extends Curve {
  final SpringSimulation sim;

  CurveSpring() : sim = _sim(70, 20);

  @override
  double transform(double t) => sim.x(t) + t * (1 - sim.x(1.0));
}

SpringSimulation _sim(double stiffness, double damping) => SpringSimulation(
      SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: stiffness,
        ratio: 0.7,
      ),
      0.0,
      1.0,
      0.0,
    );
