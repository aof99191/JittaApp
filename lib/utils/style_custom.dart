import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyleCustom {
  static Color baseColor = const Color(0xFF42A5F5);


  static RichText txtBoldNormal(
      {required String boldText, required String normalText, bool? normalRed, int? maxLine, String? linkURL, TextAlign? textAlign}) {
    var normalTextColor = Colors.black;
    var maxLineData = 3;
    if (normalRed != null) {
      normalTextColor = Colors.red;
    }
    if(maxLine != null){
      maxLineData = maxLine;
    }
    return RichText(
      textWidthBasis: TextWidthBasis.parent,
      softWrap: true,
      // textAlign: TextAlign.start,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLineData,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontFamily: 'tsn',
        ),
        children: [
          TextSpan(
              text: boldText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
          TextSpan(text: normalText, style: TextStyle(color: normalTextColor)),
        ],
      ),
    );
  }
}
