import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.color,
    required this.title,
    this.titleWidget,
     this.width,
    this.height,
    this.onTap,
    this.titleColor,
    this.titleFS,
    this.borderRadius,
    this.padding,
    this.fontWeight,
  }) : super(key: key);

  final Color? color;
  final String title;
  final Widget? titleWidget;
  final Color? titleColor;
  final double? width;
  final double? titleFS;
  final double? height;
  final Function()? onTap;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10.0),
        shape: borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
              )
            : null,
        backgroundColor: color ?? AppColors.primary,
        minimumSize: width != null ? Size(width!, height ?? 40.0): null,
        maximumSize:  width != null ? Size(width!, height ?? 40.0): null,
      ),
      onPressed: onTap,
      child: 
      // Center(
      //   child:
         titleWidget ?? Text(
          title,
          style: TextStyle(
            fontSize: titleFS ?? 16.0,
            color: titleColor ?? AppColors.light,
            fontWeight: fontWeight,
          ),
        // ),
      ),
    );
  }
}
