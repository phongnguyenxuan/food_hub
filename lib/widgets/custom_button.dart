import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.child,
      required this.color,
      required this.radius,
      this.padding,
      this.borderColor,
      this.boxShadow,
      this.onTap,
      this.shadowColor,
      this.elevation,
      this.buttonKey});
  final Widget child;
  final Color color;
  final EdgeInsets? padding;
  final double radius;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final void Function()? onTap;
  final Color? shadowColor;
  final double? elevation;
  final GlobalKey? buttonKey;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double buttonHeight = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        buttonHeight = widget.buttonKey?.currentContext?.size?.height ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: widget.buttonKey,
      onPressed: widget.onTap,
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(widget.padding),
          backgroundColor: MaterialStatePropertyAll(widget.color),
          shadowColor: MaterialStatePropertyAll(widget.shadowColor),
          elevation: MaterialStatePropertyAll(widget.elevation),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: widget.buttonKey != null
                  ? BorderRadius.circular(
                      buttonHeight == 0 ? 100 : buttonHeight / 2)
                  : BorderRadius.circular(widget.radius),
              side: widget.borderColor != null
                  ? BorderSide(color: widget.borderColor!)
                  : BorderSide.none)),
          minimumSize: const MaterialStatePropertyAll(Size(38, 38))),
      child: widget.child,
    );
  }
}
