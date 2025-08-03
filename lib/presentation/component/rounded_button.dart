// material
import 'package:flutter/material.dart';
import 'package:great_talk/presentation/util/texts.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton({
    super.key,
    required this.text,
    this.press,
    this.buttonColor,
    this.textColor,
    this.icon,
    this.widthRate = 0.85,
    this.enabled = true,
  });

  final String text;
  final double widthRate;
  final Function()? press;
  final Color? buttonColor, textColor;
  final Widget? icon;
  final bool enabled;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.enabled) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.enabled) {
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (widget.enabled) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final effectiveButtonColor =
        widget.enabled
            ? (widget.buttonColor ?? Theme.of(context).primaryColor)
            : Colors.grey[300]!;
    final effectiveTextColor =
        widget.enabled
            ? (widget.textColor ?? Theme.of(context).scaffoldBackgroundColor)
            : Colors.grey[600];

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: size.width * widget.widthRate,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow:
                  widget.enabled
                      ? [
                        BoxShadow(
                          color: effectiveButtonColor.withAlpha(40),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: effectiveButtonColor.withAlpha(20),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                        ),
                        const BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        ),
                      ]
                      : [
                        BoxShadow(
                          color: Colors.grey.withAlpha(20),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ],
            ),
            child: GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              onTapCancel: _onTapCancel,
              onTap: widget.enabled ? widget.press : null,
              child: Container(
                decoration: BoxDecoration(
                  color: effectiveButtonColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color:
                        widget.enabled
                            ? effectiveButtonColor.withAlpha(40)
                            : Colors.grey.withAlpha(40),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child:
                      widget.icon != null
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                alignment: Alignment.center,
                                child: widget.icon!,
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                child: BasicBoldText(
                                  widget.text,
                                  textColor: effectiveTextColor,
                                ),
                              ),
                            ],
                          )
                          : Center(
                            child: BasicBoldText(
                              widget.text,
                              textColor: effectiveTextColor,
                            ),
                          ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
