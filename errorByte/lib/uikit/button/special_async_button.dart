import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import '../../core/base/base_singleton.dart';

class SpecialAsyncButton extends StatelessWidget with BaseSingleton {
  final Future<void> Function(AsyncButtonStateController) onTap;
  final String buttonLabel;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final double? elevation;
  final BorderRadiusGeometry borderRadius;
  final Color? buttonLabelColor;
  SpecialAsyncButton({
    super.key,
    required this.onTap,
    required this.buttonLabel,
    this.padding,
    this.bgColor,
    this.elevation,
    this.borderRadius = BorderRadius.zero,
    this.buttonLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return AsyncElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: bgColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      loadingStyle: AsyncButtonStateStyle(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        widget: SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      successStyle: AsyncButtonStateStyle(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        widget: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.check),
            SizedBox(width: 4),
            Text('Success!')
          ],
        ),
      ),
      failureStyle: AsyncButtonStateStyle(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
        ),
        widget: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.error),
            SizedBox(width: 4),
            Text('Error!'),
          ],
        ),
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(color: buttonLabelColor),
      ),
    );
  }
}
