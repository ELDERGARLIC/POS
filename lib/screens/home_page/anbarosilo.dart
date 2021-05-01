import 'package:corpapp/screens/home_page/anbarosilo/anbarha.dart';
import 'package:corpapp/screens/home_page/anbarosilo/mohavate.dart';
import 'package:corpapp/screens/home_page/anbarosilo/siloha.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corpapp/utilities/global.dart';

class AnbaroSilo extends StatefulWidget {
  @override
  _AnbaroSiloState createState() => _AnbaroSiloState();
}

class _AnbaroSiloState extends State<AnbaroSilo> {
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
                          'انبار و سیلو',
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
                                  icon: 'assets/logos/anbarlist.png',
                                  title: 'انبار ',
                                  color: Colors.white,
                                  toWhere: () async {
                                    final http.Response anbarResponse =
                                        await http.get(
                                      'http://94.130.230.203:8585/resource/storages',
                                      headers: {
                                        'authorization': loggedUser.token,
                                      },
                                    );
                                    List<dynamic> calledSilosJson =
                                        jsonDecode(anbarResponse.body);
                                    print(calledSilosJson);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Anbarha(
                                          anbarha: calledSilosJson,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                HomeButton(
                                  icon: 'assets/logos/eskele.png',
                                  title: 'کانتینری',
                                  color: Colors.white,
                                  toWhere: () {
                                    Navigator.pushNamed(context, '/eskele');
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                HomeButton(
                                  icon: 'assets/logos/silo.png',
                                  title: 'سیلو ',
                                  color: Colors.white,
                                  toWhere: () async {
                                    final http.Response silosResponse =
                                        await http.get(
                                      'http://94.130.230.203:8585/resource/silos',
                                      headers: {
                                        'authorization': loggedUser.token,
                                      },
                                    );
                                    List<dynamic> calledSilosJson =
                                        jsonDecode(silosResponse.body);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Siloha(
                                          silos: calledSilosJson,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                HomeButton(
                                  icon: 'assets/logos/mohavate.png',
                                  title: 'محوطه',
                                  color: Colors.white,
                                  toWhere: () async {
                                    final http.Response silosResponse =
                                        await http.get(
                                      'http://94.130.230.203:8585/resource/areas',
                                      headers: {
                                        'authorization': loggedUser.token,
                                      },
                                    );
                                    List<dynamic> calledSilosJson =
                                        jsonDecode(silosResponse.body);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Mohavate(
                                          mohavateha: calledSilosJson,
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
  final Function toWhere;

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
          onPressed: toWhere,
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
