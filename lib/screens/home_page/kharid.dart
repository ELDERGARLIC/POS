import 'package:corpapp/services/kharid/kharid_networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/services/omran/omran_networking.dart';
import 'package:corpapp/utilities/constants.dart';
import 'package:corpapp/utilities/global.dart';

class Kharid extends StatefulWidget {
  @override
  _KharidState createState() => _KharidState();
}

class _KharidState extends State<Kharid> {
  bool kharid2Check = false;
  bool kharid3Check = false;
  bool kharid1Check = false;
  String mored = "";
  TextEditingController darkhastController = new TextEditingController();
  TextEditingController pishnehadController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF73AEF5),
      ),
      endDrawer: returnDrawer(context),
      floatingActionButton: returnFloatingActionButton(context),
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
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
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
                          'خرید',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Text(
                                      'نوع خرید',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CustomCheckBox(
                                        color: Colors.white,
                                        title: "خرید 2",
                                        checkbox: Checkbox(
                                          value: kharid2Check,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                kharid2Check = value;
                                                if (value == true) {
                                                  kharid1Check = false;
                                                  kharid3Check = false;
                                                  mored = "خرید 2";
                                                }
                                                print(mored);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      CustomCheckBox(
                                        color: Colors.white,
                                        title: "خرید ۱",
                                        checkbox: Checkbox(
                                          value: kharid1Check,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                kharid1Check = value;
                                                if (value == true) {
                                                  kharid2Check = false;
                                                  kharid3Check = false;
                                                  mored = "خرید ۱";
                                                }
                                                print(mored);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomCheckBox(
                                    color: Colors.white,
                                    title: "خرید 3",
                                    checkbox: Checkbox(
                                      value: kharid3Check,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            kharid3Check = value;
                                            if (value == true) {
                                              kharid2Check = false;
                                              kharid1Check = false;
                                              mored = "خرید 3";
                                            }
                                            print(mored);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 12.0,
                                      top: 25,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'شرح درخواست خرید',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Container(
                                      width: 350,
                                      alignment: Alignment.centerLeft,
                                      decoration: kBoxDecorationStyle,
                                      height: 60.0,
                                      child: TextField(
                                        controller: darkhastController,
                                        textAlign: TextAlign.end,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'OpenSans',
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              EdgeInsets.only(top: 14.0),
                                          suffixIcon: Icon(
                                            Icons.message,
                                            color: Colors.white,
                                            textDirection: TextDirection.rtl,
                                          ),
                                          hintText:
                                              'لطفا درخواست خود را وارد کنید',
                                          hintStyle: kHintTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 0.0, top: 25, bottom: 10),
                                    child: Text(
                                      'پیشنهاد واحد درخواست کننده',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Container(
                                      width: 350,
                                      alignment: Alignment.centerLeft,
                                      decoration: kBoxDecorationStyle,
                                      height: 60.0,
                                      child: TextField(
                                        controller: pishnehadController,
                                        textAlign: TextAlign.end,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'OpenSans',
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              EdgeInsets.only(top: 14.0),
                                          suffixIcon: Icon(
                                            Icons.message,
                                            color: Colors.white,
                                            textDirection: TextDirection.rtl,
                                          ),
                                          hintText:
                                              'لطفا پیشنهاد خود را وارد کنید',
                                          hintStyle: kHintTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 135,
                                      vertical: 20,
                                    ),
                                    child: RaisedButton(
                                      elevation: 5.0,
                                      onPressed: () async {
                                        dynamic data = await getKharidData(
                                          context,
                                          mored, // bools
                                          darkhastController
                                              .text, // firstTextBox
                                          pishnehadController
                                              .text, // secondTextBox
                                        );
                                        print(data);
                                      },
                                      padding: EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      color: Colors.white,
                                      child: Icon(Icons.send),
                                    ),
                                  ),
                                ],
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
          elevation: 5.0,
          onPressed: () {},
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
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
                  fontSize: 12.0,
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
