import 'package:corpapp/screens/home_page/omran.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:corpapp/screens/messages.dart';

class HomePage extends StatefulWidget {
  HomePage({@required this.uid});
  final String uid;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          'خانه',
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
                                children: [
                                  HomeButton(
                                      icon: 'assets/logos/amaliyat.png',
                                      title: ' عملیات',
                                      color: Colors.white,
                                      toWhere: '/under'),
                                  HomeButton(
                                      icon: 'assets/logos/anbar.png',
                                      title: 'انبار و سیلو',
                                      color: Colors.white,
                                      toWhere: '/anbarosilo'),
                                  HomeButton(
                                    icon: 'assets/logos/omran.png',
                                    title: 'عمران',
                                    color: Colors.white,
                                    toWhere: '/omran',
                                    widget: widget.uid,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  HomeButton(
                                      icon: 'assets/logos/modiriyat.png',
                                      title: 'سیستم مدیریت',
                                      color: Colors.white,
                                      toWhere: '/modiriyat'),
                                  HomeButton(
                                      icon: 'assets/logos/kharid.png',
                                      title: 'خرید',
                                      color: Colors.white,
                                      toWhere: '/under'),
                                  HomeButton(
                                      icon: 'assets/logos/modir.png',
                                      title: 'ارتباط با مدیر',
                                      color: Colors.white,
                                      toWhere: '/under'),
                                ],
                              ),
                              Column(
                                children: [
                                  HomeButton(
                                      icon: 'assets/logos/amoozesh.png',
                                      title: 'آموزش',
                                      color: Colors.white,
                                      toWhere: '/under'),
                                  HomeButton(
                                      icon: 'assets/logos/profile.png',
                                      title: 'پروفایل',
                                      color: Colors.white,
                                      toWhere: '/under'),
                                  HomeButton(
                                      icon: 'assets/logos/exit.png',
                                      title: 'خروج',
                                      color: Colors.white,
                                      toWhere: '/login'),
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
  HomeButton({
    @required this.color,
    @required this.title,
    @required this.icon,
    @required this.toWhere,
    this.widget,
  });

  final Color color;
  final String title;
  final String icon;
  final String toWhere;
  final String widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 100.0,
        height: 130.0,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            if (toWhere == '/omran') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Omran(
                    uid: widget,
                  ),
                ),
              );
            } else {
              Navigator.pushNamed(context, toWhere);
            }
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
