import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/global.dart';
import 'package:corpapp/services/change_state/change_state_networking.dart';
import 'package:corpapp/utilities/constants.dart';

class DarkhastDetailsGeneral extends StatefulWidget {
  DarkhastDetailsGeneral({this.dataMap});
  final dataMap;
  @override
  _DarkhastDetailsGeneralState createState() => _DarkhastDetailsGeneralState();
}

class _DarkhastDetailsGeneralState extends State<DarkhastDetailsGeneral> {
  bool _radCheck = false;
  bool erjaCheck = false;
  bool _tayidCheck = false;
  String state = "";
  TextEditingController gozareshController = new TextEditingController();
  TextEditingController pishnehadController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo.shade400,
      ),
      endDrawer: returnDrawer(context),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.indigo.shade400,
                      Colors.indigo.shade300,
                      Colors.indigo.shade200,
                      Colors.indigo.shade100,
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'جزئیات',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InfoCard(
                                typeOfDarkhast:
                                    widget.dataMap["morede_darkhasti"],
                                tarikh: widget.dataMap["date"],
                                saat: widget.dataMap["time"],
                                sharh: widget.dataMap["sharh"],
                                pishnehad: widget.dataMap["pishnahad"],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key key,
    @required this.typeOfDarkhast,
    @required this.tarikh,
    @required this.saat,
    @required this.sharh,
    @required this.pishnehad,
  }) : super(key: key);

  final String typeOfDarkhast;
  final String tarikh;
  final String saat;
  final String sharh;
  final String pishnehad;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 280,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                top: 10,
                left: 10,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'نوع درخواست: $typeOfDarkhast',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'تاریخ $tarikh',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'ساعت $saat',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'شرح درخواست:',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    '$sharh',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'پیشنهاد:',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    '$pishnehad',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              child: Image.asset(
                'assets/logos/$typeOfDarkhast.png',
                width: 40,
                height: 40,
              ),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    @required this.color,
    @required this.title,
    @required this.checkbox,
  });

  final Color color;
  final String title;
  final Checkbox checkbox;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 160.0,
        height: 65.0,
        child: RaisedButton(
          elevation: 2.0,
          onPressed: () {},
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
              checkbox,
            ],
          ),
        ),
      ),
    );
  }
}
