import 'package:flutter/material.dart';

class StyleCss {
  static Divider dh10 = const Divider(
    height: 10,
  );

  static Divider dh20 = const Divider(
    height: 20,
  );


  // customSizedBox
  static SizedBox customSizedBox(
      {required double height, required double width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  //width
  static SizedBox w10 = const SizedBox(
    width: 10,
  );

  static SizedBox w5 = const SizedBox(
    width: 5,
  );

  static SizedBox w8 = const SizedBox(
    width: 8,
  );

  //height
  static SizedBox h20 = const SizedBox(
    height: 20,
  );

  static SizedBox h10 = const SizedBox(
    height: 10,
  );

  static SizedBox h6 = const SizedBox(
    height: 6,
  );

  static SizedBox h4 = const SizedBox(
    height: 4,
  );
  static SizedBox h8 = const SizedBox(
    height: 8,
  );
  static SizedBox h16 = const SizedBox(
    height: 16,
  );
  static SizedBox h70 = const SizedBox(
    height: 70,
  );


  static TextStyle txtNav16 = const TextStyle(
    fontFamily: 'tsn',
    color: Color(0xFFFFFFFF),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
  );

  static TextStyle txt16BlackNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
  );

  static TextStyle txt18BlackNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
    height: 1.5,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle txt20BlackNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
  );

  static TextStyle txt24BlackNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
  );


  static TextStyle txt16GreyNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
    height: 1.5,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle txt16BlueNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.blue,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
    height: 1.5,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle txt14redNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.redAccent,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
    height: 1.5,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle txt16RedNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
  );

  static TextStyle txt20RedNormal = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.red,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
  );


  static TextStyle txt18redBold = const TextStyle(
    fontFamily: 'tsn',
    color: Colors.redAccent,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    letterSpacing: 1.627907,
    height: 1.5,
    textBaseline: TextBaseline.alphabetic,
  );


}
