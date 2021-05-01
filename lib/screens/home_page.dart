import 'package:corpapp/screens/home_page/amaliyat.dart';
import 'package:corpapp/screens/home_page/tajhizati.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corpapp/utilities/global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeButton> firstRow = [
    HomeButton(
        icon: 'assets/logos/profile.png',
        title: 'پروفایل',
        color: Colors.white,
        toWhere: '/profile'),
    HomeButton(
        icon: 'assets/logos/تجهیزاتی.png',
        title: 'تجهیزات',
        color: Colors.white,
        toWhere: '/tajhizati'),
    HomeButton(
        icon: 'assets/logos/exit.png',
        title: 'خروج',
        color: Colors.white,
        toWhere: '/login'),
  ];
  List<HomeButton> centralRow = [
    HomeButton(
        icon: 'assets/logos/modiriyat.png',
        title: 'سیستم مدیریت یکپارچه',
        color: Colors.white,
        toWhere: '/modiriyat'),
    HomeButton(
        icon: 'assets/logos/kharid.png',
        title: 'خرید',
        color: Colors.white,
        toWhere: '/kharid'),
    HomeButton(
        icon: 'assets/logos/modir.png',
        title: 'ارتباط با مدیر',
        color: Colors.white,
        toWhere: '/ertebat'),
  ];
  List<HomeButton> lastRow = [
    HomeButton(
        icon: 'assets/logos/amaliyat.png',
        title: ' عملیات',
        color: Colors.white,
        toWhere: '/amaliyat'),
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
    ),
  ];

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
              Positioned(
                top: 125,
                right: -110,
                child: Opacity(
                  opacity: 0.60,
                  child: Image.asset(
                    'assets/logos/background.png',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 1.5,
                    color: Colors.blue.shade900,
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
                                children: lastRow,
                              ),
                              Column(
                                children: centralRow,
                              ),
                              Column(
                                children: firstRow,
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
  });

  final Color color;
  final String title;
  final String icon;
  final String toWhere;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        width: 110.0,
        height: 135.0,
        // ignore: deprecated_member_use
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () async {
            if (toWhere == '/login') {
              logOutFunction(context);
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pop(context);
              });
            } else if (toWhere == '/tajhizati') {
              final http.Response silosResponse = await http.post(
                'http://94.130.230.203:8585/operation/getvehicle',
                headers: {
                  'authorization': loggedUser.token,
                },
                body: {
                  'all': '1',
                },
              );
              List<dynamic> calledSilosJson = jsonDecode(silosResponse.body);
              print(calledSilosJson);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Tajhizati(
                    tajhizat: calledSilosJson,
                  ),
                ),
              );
            } else if (toWhere == '/amaliyat') {
              List<Vehicle> vehiclesList = <Vehicle>[];
              final http.Response silosResponse = await http.post(
                'http://94.130.230.203:8585/operation/getvehicle',
                headers: {
                  'authorization': loggedUser.token,
                },
                body: {
                  'all': '1',
                },
              );
              List<dynamic> calledSilosJson = jsonDecode(silosResponse.body);
              print(calledSilosJson);
              for (int i = 0; i < calledSilosJson.length; i++) {
                if (calledSilosJson[i]['status'] == 'آزاد') {
                  vehiclesList.add(
                    Vehicle(
                      name: calledSilosJson[i]['name'],
                      owner: calledSilosJson[i]['owner'],
                      status: calledSilosJson[i]['status'],
                      id: calledSilosJson[i]['_id'],
                    ),
                  );
                }
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Amaliyat(
                    vehiclesList: vehiclesList,
                  ),
                ),
              );
            } else {
              Navigator.pushNamed(context, toWhere);
            }
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15.0), //TODO: maybe change this!
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
