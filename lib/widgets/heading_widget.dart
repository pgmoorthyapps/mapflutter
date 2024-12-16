import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? vMargin;
  final double? hMargin;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  const HeadingWidget(
      {this.title,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.vMargin,
      this.hMargin,
      this.textAlign,
      this.maxLines,
      this.overflow,
      this.decoration,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: vMargin ?? 8.0, horizontal: hMargin ?? 0.0),
      child: Text(
        title.toString(),
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
            decoration: decoration,
            fontSize: fontSize ?? 16.0,
            fontWeight: fontWeight ?? FontWeight.bold,
            // color: color ?? AppColors.primary
            )
            ,
      ),
    );
  }
}
