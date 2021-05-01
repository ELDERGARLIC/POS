import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/global.dart';

class Eskele extends StatefulWidget {
  @override
  _EskeleState createState() => _EskeleState();
}

class _EskeleState extends State<Eskele> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: returnFloatingActionButton(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF73AEF5),
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
                          'کانتینری',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                HomeButton(
                                    icon: 'assets/logos/eskele.png',
                                    title: 'اسکله A',
                                    color: Colors.white,
                                    toWhere: '/eskeleA'),
                                HomeButton(
                                    icon: 'assets/logos/eskele.png',
                                    title: 'اسکله B',
                                    color: Colors.white,
                                    toWhere: '/eskeleB'),
                                HomeButton(
                                    icon: 'assets/logos/eskele.png',
                                    title: 'اسکله C',
                                    color: Colors.white,
                                    toWhere: '/eskeleC'),
                                HomeButton(
                                    icon: 'assets/logos/eskele.png',
                                    title: 'اسکله D',
                                    color: Colors.white,
                                    toWhere: '/eskeleD'),
                                HomeButton(
                                    icon: 'assets/logos/eskele.png',
                                    title: 'اسکله E',
                                    color: Colors.white,
                                    toWhere: '/eskeleE'),
                              ],
                            ),
                          ],
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
        width: 300.0,
        height: 120.0,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    letterSpacing: 10,
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
