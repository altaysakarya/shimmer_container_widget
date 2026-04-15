import 'package:flutter/material.dart';

class ShimmerContainer extends StatefulWidget {
  final Color? colorOne;
  final Color? colorTwo;
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final BoxDecoration? boxDecoration;
  final Duration? duration;
  const ShimmerContainer({
    super.key,
    this.width = double.infinity,
    this.height = 50,
    this.colorOne,
    this.colorTwo,
    this.borderRadius,
    this.boxDecoration,
    this.duration,
  });

  @override
  State<ShimmerContainer> createState() => _ShimmerContainerState();
}

class _ShimmerContainerState extends State<ShimmerContainer>
    with SingleTickerProviderStateMixin {
  late Color colorOne;
  late Color colorTwo;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool start = true;

  @override
  void initState() {
    super.initState();
    _initialize();
    _listen();
    _start();
  }

  void _start() => _animationController.forward();

  void _initialize() {
    colorOne = widget.colorOne ?? const Color(0xFFE5E5E5);
    colorTwo = widget.colorTwo ?? const Color(0xFFF0F0F0);
    _animationController = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 750));
    _animation =
        Tween<double>(begin: 0, end: 1.0).animate(_animationController);
  }

  void _listen() {
    _animationController.addStatusListener((status) {
      if (!mounted) return;

      if (status == AnimationStatus.completed) {
        start = false;
        _animationController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        start = true;
        _animationController.forward();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double kRadius = 8.0;
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: widget.boxDecoration != null
                  ? widget.boxDecoration?.copyWith(
                      color:
                          widget.boxDecoration?.color != null ? null : colorOne,
                      borderRadius:
                          widget.boxDecoration?.borderRadius != null ||
                                  (widget.boxDecoration?.shape ??
                                          BoxShape.rectangle) ==
                                      BoxShape.circle
                              ? null
                              : (widget.borderRadius ??
                                  BorderRadius.circular(kRadius)),
                    )
                  : BoxDecoration(
                      color: colorOne,
                      borderRadius: widget.borderRadius ??
                          BorderRadius.circular(kRadius)),
            ),
          ),
          Align(
            alignment: start ? Alignment.centerLeft : Alignment.centerRight,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return ClipRect(
                  child: Align(
                    alignment:
                        start ? Alignment.centerLeft : Alignment.centerRight,
                    widthFactor: _animation.value,
                    child: child,
                  ),
                );
              },
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: widget.boxDecoration != null
                    ? widget.boxDecoration?.copyWith(
                        color: widget.boxDecoration?.color != null
                            ? null
                            : colorTwo,
                        borderRadius:
                            widget.boxDecoration?.borderRadius != null ||
                                    (widget.boxDecoration?.shape ??
                                            BoxShape.rectangle) ==
                                        BoxShape.circle
                                ? null
                                : (widget.borderRadius ??
                                    BorderRadius.circular(kRadius)),
                      )
                    : BoxDecoration(
                        color: colorTwo,
                        borderRadius: widget.borderRadius ??
                            BorderRadius.circular(kRadius),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
