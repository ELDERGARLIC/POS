import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:corpapp/utilities/constants.dart';
import 'package:corpapp/screens/messages.dart';

class Omran extends StatefulWidget {
  Omran({@required this.uid});
  final String uid;

  @override
  _OmranState createState() => _OmranState();
}

class _OmranState extends State<Omran> {
  bool _tajihizatiCheck = false;
  bool _abniyeCheck = false;
  bool _tasisatiCheck = false;
  TextEditingController darkhastController = new TextEditingController();
  TextEditingController pishnehadController = new TextEditingController();

  void _message() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(
                strokeWidth: 1,
              ),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(
      new Duration(seconds: 1),
      () {
        Navigator.pop(context); //pop dialog
      },
    );
    new Future.delayed(
      new Duration(seconds: 1),
      () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new Text(
                    "DONE!!",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            );
          },
        );
        new Future.delayed(
          new Duration(seconds: 1),
          () {
            Navigator.pop(context); //pop dialog
          },
        );
        new Future.delayed(
          new Duration(seconds: 1),
          () {
            Navigator.pop(context); //pop dialog
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF73AEF5),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset('assets/logos/pos.png'),
              decoration: BoxDecoration(
                color: Color(0xFF61A4F1),
              ),
            ),
            ListTile(
              title: Text(
                'ارتباط با ما',
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                Navigator.pop(context);
                launch('http://pos.co.ir/');
              },
            ),
            ListTile(
              title: Text(
                'پیغام ها',
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                Navigator.pop(context);
                launch('http://pos.co.ir/');
              },
            ),
            ListTile(
              title: Text(
                'خروج',
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          new CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                          new Text("Loading"),
                        ],
                      ),
                    );
                  },
                );
                new Future.delayed(
                  new Duration(seconds: 3),
                  () {
                    Navigator.pop(context); //pop dialog
                    Navigator.pushNamed(context, '/login');
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Messages(
                uid: widget.uid,
              ),
            ),
          );
        },
        backgroundColor: Color(0xFF61A4F1),
        child: Stack(
          children: [
            Icon(Icons.mail),
            Positioned(
              right: -0,
              top: -0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                          'عمران',
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
                                      'مورد درخواست شده',
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
                                        title: "تجهیزاتی",
                                        checkbox: Checkbox(
                                          value: _tajihizatiCheck,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                _tajihizatiCheck = value;
                                                print(_tajihizatiCheck);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      CustomCheckBox(
                                        color: Colors.white,
                                        title: "تاسیساتی",
                                        checkbox: Checkbox(
                                          value: _tasisatiCheck,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                _tasisatiCheck = value;
                                                print(_tasisatiCheck);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomCheckBox(
                                    color: Colors.white,
                                    title: "ابنیه و ساختمانی",
                                    checkbox: Checkbox(
                                      value: _abniyeCheck,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _abniyeCheck = value;
                                            print(_abniyeCheck);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, top: 25, bottom: 10),
                                    child: Text(
                                      'شرح درخواست',
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
                                      onPressed: _message,
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
                  letterSpacing: 1.5,
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
