import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Messages extends StatefulWidget {
  Messages({@required this.uid});
  final String uid;

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/login');
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
                          'پیغام ها',
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
                              Stack(
                                //HERE BLYAT
                                children: [
                                  Column(
                                    children: [
                                      Bubble(
                                        message:
                                            'درخواست شما از طرف مدیر پذیرفته شد',
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Bubble(
                                        message:
                                            'نوع درخواست: تاسیساتی \nشرح: تست\nنام: تست\nپیشنهاد: تست',
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: RaisedButton(
                                              elevation: 5.0,
                                              onPressed: _message,
                                              padding: EdgeInsets.all(15.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              color: Colors.green.shade400,
                                              child: Text(
                                                'قبول',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: RaisedButton(
                                              elevation: 5.0,
                                              onPressed: _message,
                                              padding: EdgeInsets.all(15.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              color: Colors.red.shade400,
                                              child: Text(
                                                'رد',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: RaisedButton(
                                              elevation: 5.0,
                                              onPressed: _message,
                                              padding: EdgeInsets.all(15.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              color: Colors.yellow.shade400,
                                              child: Text(
                                                'مدیر',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Bubble(
                                        message:
                                            'نوع درخواست: تاسیساتی \nشرح: تست\nنام: تست\nپیشنهاد: تست',
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: RaisedButton(
                                              elevation: 5.0,
                                              onPressed: _message,
                                              padding: EdgeInsets.all(15.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              color: Colors.green.shade400,
                                              child: Text(
                                                'قبول',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: RaisedButton(
                                              elevation: 5.0,
                                              onPressed: _message,
                                              padding: EdgeInsets.all(15.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              color: Colors.red.shade400,
                                              child: Text(
                                                'رد',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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

class HomeButton extends StatelessWidget {
  HomeButton(
      {@required this.color,
      @required this.title,
      @required this.icon,
      @required this.toWhere});

  final Color color;
  final String title;
  final String icon;
  final String toWhere;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 105.0,
        height: 112.0,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            Navigator.pushNamed(context, toWhere);
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(icon),
                width: 40,
                height: 40,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class Bubble extends StatefulWidget {
  String message;

  Bubble({this.message});

  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 120,
          width: 345,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100 / 3),
              bottomRight: Radius.circular(100 / 3),
              topLeft: Radius.circular(100 / 3),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.message,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0, top: 4),
          child: Text(
            'همین الان',
            style: TextStyle(color: Colors.grey.shade800, fontSize: 11),
          ),
        )
      ],
    );
  }
}
