import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';




class InkWellButton extends StatelessWidget {
  final TextEditingController ctrl;
  final bool readOnly;
  final bool hasBorder;
  double? width;
  double? height;
  Color? fontColor;
  Color? bgColor;
  Color? cursorColor;
  Color? borderColor;
  Color? splashColor;
  Color? hoverColor;
  final VoidCallback? onTap;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? sText;
  final FocusNode? focusNode;
  final FocusNode? fnNext;


  InkWellButton({
    Key? key,
    required this.ctrl,
    this.readOnly = true,
    this.hasBorder = false,
    this.width,
    this.height,
    this.onTap,
    this.fontColor,
    this.bgColor,
    this.cursorColor,
    this.borderColor,
    this.splashColor,
    this.hoverColor,
    this.focusNode,
    this.fnNext,
    this.leadingIcon,
    this.trailingIcon,
    this.sText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.bgColor == null) this.bgColor = Color.fromRGBO(250, 255, 255, 1);
    if (this.cursorColor == null)      this.cursorColor = Color.fromRGBO(221, 221, 221, 1);
    if (fontColor == null) fontColor = Color.fromRGBO(100, 100, 100, 1);
    if (borderColor == null) borderColor = Color.fromRGBO(221, 221, 221, 1);
    if (splashColor == null) splashColor = Colors.blue.shade200;
    if (hoverColor == null) hoverColor = Colors.blue.shade50;

    if (width == null || width == 0) width = double.infinity;
    if (height == null) height = 60;

    return Row(
      children: [
        Expanded(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                // customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                borderRadius: BorderRadius.circular(15.0),
                onTap: onTap,
                // onTap: ()=>{},
                splashColor: splashColor,
                hoverColor: hoverColor,
                child: Container(
                  width :width,
                  height:height,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0,color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: leadingIcon ==null ? Icon(Icons.list) : leadingIcon,
                    trailing: trailingIcon ==null ? Icon(Icons.arrow_drop_down) : trailingIcon ,
                    title: Text('Please select', style: TextStyle(color: Colors.blue),),
                  ),
                ),

              ),

            )
        ),
      ],
    );
  }
}


class customElevatedButton extends StatelessWidget {
  final TextEditingController? ctrl;
  final bool readOnly;
  final bool hasBorder;
  final bool showCursor;
  double? width;
  double? height;
  double dhorizontal;
  Color? fontColor;
  Color? bgColor;
  Color? cursorColor;
  Color? borderColor;
  Color? splashColor;
  Color? hoverColor;
  final VoidCallback? onTap;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String sText;
  final FocusNode? focusNode;
  final FocusNode? fnNext;


  customElevatedButton({
    Key? key,
    this.ctrl,
    this.readOnly = true,
    this.hasBorder = true,
    this.showCursor = false,
    this.width,
    this.height,
    this.dhorizontal = 0,
    this.onTap,
    this.fontColor,
    this.bgColor,
    this.cursorColor,
    this.borderColor,
    this.splashColor,
    this.hoverColor,
    this.focusNode,
    this.fnNext,
    this.leadingIcon,
    this.trailingIcon,
    this.sText ="Please select",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.bgColor == null) this.bgColor = Color.fromRGBO(250, 255, 255, 1);
    if (this.cursorColor == null)      this.cursorColor = Color.fromRGBO(221, 221, 221, 1);
    if (fontColor == null) fontColor = Color.fromRGBO(100, 100, 100, 1);
    if (borderColor == null) borderColor = Colors.grey.shade200;
    // if (borderColor == null) borderColor = Color.fromRGBO(221, 221, 221, 1);
    if (splashColor == null) splashColor = Colors.blue.shade200;
    if (hoverColor == null) hoverColor = Colors.blue.shade50;
    if (width == null || width == 0) width = double.infinity;
    if (height == null) height = 50;


    return Row(
      children: [
        Expanded(
          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:  EdgeInsets.zero,
                // padding: EdgeInsets.symmetric(
                //     horizontal: dhorizontal),
                backgroundColor: Colors.grey.shade200,
                textStyle: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade50),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Colors.transparent,
                elevation: 1
            ),
            child: Container(
              child: ListTile(
                leading: leadingIcon ==null ? Icon(Icons.list , color: Colors.blue.shade400) : leadingIcon,
                trailing: trailingIcon ==null ? Icon(Icons.arrow_drop_down , color: Colors.blue.shade400) : trailingIcon ,
                title: TextFormField(
                  textAlign : TextAlign.center,

                  textAlignVertical: TextAlignVertical.center,
                  readOnly : readOnly,
                  focusNode: focusNode,
                  showCursor: showCursor,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.all(5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: hasBorder
                          ? BorderSide(color: borderColor ?? Colors.transparent)
                          : BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    focusedBorder: OutlineInputBorder(
                      borderSide: hasBorder
                          ? BorderSide(color: borderColor ?? Colors.transparent)
                          : BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    //hintStyle: Const.FONT14_NORMAL,
                  ),

                  onTap: onTap,
                  controller:ctrl,
                  style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'tsn'),),
              ),
            ),
            onPressed: onTap,
          ),
        ),
      ],
    );
  }
}