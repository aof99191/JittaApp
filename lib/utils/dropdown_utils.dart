import 'package:flutter/material.dart';
import 'package:jitta_ranking/config/data_drop_down_config.dart';
import 'package:jitta_ranking/utils/global_ui.dart';


class DropDownCustom {
  static Color bgColor = const Color.fromRGBO(250, 255, 255, 1);
  static Color bgBorder = const Color.fromRGBO(221, 221, 221, 1);
  static EdgeInsets contentPadding =
  const EdgeInsets.symmetric(vertical: 10, horizontal: 10);



  static Widget dropDownStdFormString({
    required List<DataDDConfig> items,
    required String valDrop,
    Function(String?)? onChange,
  }) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      dropdownColor: GlobalUI.bgColorField,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.list),
        border: const OutlineInputBorder(),
        enabledBorder:
        const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color:Colors.grey,
              width: 2.0,
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color:Colors.blue.shade800,
              width: 2.0,
            )
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((value) {
        return DropdownMenuItem<String>(
          value: value.sValue,
          child: Text(
            value.sLabel,
            // style: StyleCss.txt16BlackNormal,
          ),
        );
      }).toList(),
      value: valDrop,
      onChanged: onChange,
    );


  }

  static Widget dropDownStdFormSInt({
    required List<DataNumberConfig> items,
    required int valDrop,
    Function(int?)? onChange,
  }) {
    return DropdownButtonFormField<int>(
      isExpanded: true,
      dropdownColor: GlobalUI.bgColorField,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.list),
        border: const OutlineInputBorder(),
        enabledBorder:
        const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color:Colors.grey,
              width: 2.0,
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color:Colors.blue.shade800,
              width: 2.0,
            )
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((value) {
        return DropdownMenuItem<int>(
          value: value.ivalue,
          child: Text(
            value.sLabel,
            // style: StyleCss.txt16BlackNormal,
          ),
        );
      }).toList(),
      value: valDrop,
      onChanged: onChange,
    );


  }
}