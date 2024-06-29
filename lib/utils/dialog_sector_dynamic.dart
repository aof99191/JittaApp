import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jitta_ranking/models/sector_model.dart';
import 'package:jitta_ranking/utils/style_css.dart';


class DialogSectorDynamic extends StatefulWidget {
  final String _sTitle;
  final String _radioValueEum;
  final List<ListJittaSectorType> _listdata;

  DialogSectorDynamic(this._sTitle , this._radioValueEum , this._listdata );

  @override
  _DialogSectorDynamic createState() => _DialogSectorDynamic();
}


class _DialogSectorDynamic extends State<DialogSectorDynamic>
    with SingleTickerProviderStateMixin{

  List<ListJittaSectorType> listRadiodata = [];
  String sTitle = "";
  String radioValueEum = "";
  String radiolabel = "Please select";

  @override
  void initState() {
    sTitle = widget._sTitle;
    radioValueEum = widget._radioValueEum;
    listRadiodata = widget._listdata;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(sTitle),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:  Column(
          children: listRadiodata.map((e) {
            return RadioListTile<String>(
              title: Text(e.name.toString()),
              value: e.id.toString(),
              groupValue: radioValueEum,
              onChanged: (val) {

                setState(() {
                  debugPrint('VAL = $val');
                  radioValueEum = '$val';
                  radiolabel = e.name.toString();
                });

              },

            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel",
            style: StyleCss.txt16BlueNormal,
          ),
        ),
        TextButton(
          onPressed: () {
            Map<String, dynamic> m = {};
            m['value'] = radioValueEum;
            m['display'] = radiolabel;
            Navigator.pop(context, m);
            // Navigator.pop(context);
          },
          child: Text("Done",
            style: StyleCss.txt16BlueNormal,
          ),
        ),

      ],
    );
  }
}
