import 'package:flutter/material.dart';
import 'package:jitta_ranking/utils/global_ui.dart';
import 'package:jitta_ranking/utils/style_css.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogAlert {


  void warningAlertDialog(String middleText, BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (x) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Row(
            children: [

              Flexible(
                child: Text(
                  "Warrning Massage",
                  style: StyleCss.txt18BlackNormal,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      middleText,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: StyleCss.txt16RedNormal,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                      style: const ButtonStyle(),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                      label: Text(
                        "ปิด",
                        style: StyleCss.txt16GreyNormal,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
