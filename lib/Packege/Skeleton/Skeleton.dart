import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/rendering.dart';

enum Direction { ltr, rtl, ttb, btt }
@immutable
class Skeleton extends StatefulWidget {
  final Widget child;
  final Duration period;
  final Direction direction;
  final Gradient gradient;
  final int loop;
  final bool enabled;

  const Skeleton({
    Key key,
    @required this.child,
    @required this.gradient,
    this.direction = Direction.ltr,
    this.period = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
  }) : super(key: key);


  Skeleton.fromColors({
    Key key,
    @required this.child,
    @required Color baseColor,
    @required Color highlightColor,
    this.period = const Duration(milliseconds: 1500),
    this.direction = Direction.ltr,
    this.loop = 0,
    this.enabled = true,
  })  : gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        baseColor,
        baseColor,
        highlightColor,
        baseColor,
        baseColor
      ],
      stops: const <double>[
        0.0,
        0.35,
        0.5,
        0.65,
        1.0
      ]),
        super(key: key);

  @override
  _SkeletonState createState() => _SkeletonState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Gradient>('gradient', gradient,
        defaultValue: null));
    properties.add(EnumProperty<Direction>('direction', direction));
    properties.add(
        DiagnosticsProperty<Duration>('period', period, defaultValue: null));
    properties
        .add(DiagnosticsProperty<bool>('enabled', enabled, defaultValue: null));
  }
}

class _SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }
        _count++;
        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_count < widget.loop) {
          _controller.forward(from: 0.0);
        }
      });
    if (widget.enabled) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(Skeleton oldWidget) {
    if (widget.enabled) {
      _controller.forward();
    } else {
      _controller.stop();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget child) => _Make_Skeleton(
        child: child,
        direction: widget.direction,
        gradient: widget.gradient,
        percent: _controller.value,
        enabled: widget.enabled,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class _Make_Skeleton extends SingleChildRenderObjectWidget {
  final double percent;
  final Direction direction;
  final Gradient gradient;
  final bool enabled;

  const _Make_Skeleton({
    Widget child,
    this.percent,
    this.direction,
    this.gradient,
    this.enabled,
  }) : super(child: child);

  @override
  _SkeletonFilter createRenderObject(BuildContext context) {
    return _SkeletonFilter(percent, direction, gradient, enabled);
  }

  @override
  void updateRenderObject(BuildContext context, _SkeletonFilter shimmer) {
    shimmer.percent = percent;
    shimmer.enabled = enabled;
  }
}

class _SkeletonFilter extends RenderProxyBox {
  final Paint _clearPaint = Paint();
  final Paint _gradientPaint;
  final Gradient _gradient;
  final Direction _direction;
  bool enabled;
  double _percent;
  Rect _rect;

  _SkeletonFilter(this._percent, this._direction, this._gradient, this.enabled)
      : _gradientPaint = Paint()..blendMode = BlendMode.srcIn;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percent(double newValue) {
    if (newValue == _percent) {
      return;
    }
    _percent = newValue;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    assert(needsCompositing);

    context.canvas.saveLayer(offset & child.size, _clearPaint);
    context.paintChild(child, offset);

    final double width = child.size.width;
    final double height = child.size.height;
    Rect rect;
    double dx, dy;
    if (_direction == Direction.rtl) {
      dx = _offset(width, -width, _percent);
      dy = 0.0;
      rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
    } else if (_direction == Direction.ttb) {
      dx = 0.0;
      dy = _offset(-height, height, _percent);
      rect = Rect.fromLTWH(offset.dx, offset.dy - height, width, 3 * height);
    } else if (_direction == Direction.btt) {
      dx = 0.0;
      dy = _offset(height, -height, _percent);
      rect = Rect.fromLTWH(offset.dx, offset.dy - height, width, 3 * height);
    } else {
      dx = _offset(-width, width, _percent);
      dy = 0.0;
      rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
    }
    if (_rect != rect) {
      _gradientPaint.shader = _gradient.createShader(rect);
      _rect = rect;
    }
    context.canvas.translate(dx, dy);
    context.canvas.drawRect(rect, _gradientPaint);
    context.canvas.restore();
  }

  double _offset(double start, double end, double percent) {
    return start + (end - start) * percent;
  }
}

