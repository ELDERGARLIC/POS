import 'package:corpapp/screens/home_page/anbarosilo/siloha/mohtaviyatesilo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corpapp/utilities/global.dart';

class Silo {
  String id;
  String name;
  String dateK;
  String dateS;
  String dateG;
  String temp;
  String apiCallDate;
  String creationDate;
  Silo({
    this.id,
    this.name,
    this.dateK,
    this.dateS,
    this.dateG,
    this.temp,
    this.apiCallDate,
    this.creationDate,
  });
}

class Siloha extends StatefulWidget {
  Siloha({this.silos});
  final List<dynamic> silos;
  @override
  _SilohaState createState() => _SilohaState();
}

class _SilohaState extends State<Siloha> {
  List<Silo> silosList = <Silo>[];
  List<SpecialContainer> widgetsList = <SpecialContainer>[];

  @override
  void initState() {
    super.initState();
    print(widget.silos.length);
    for (int i = 0; i < widget.silos.length; i++) {
      silosList.add(Silo(
        temp: widget.silos[i]['temp'],
        id: widget.silos[i]['_id'],
        dateG: widget.silos[i]['dateG'],
        dateS: widget.silos[i]['dateS'],
        name: widget.silos[i]['name'],
        dateK: widget.silos[i]['dateK'],
        creationDate: widget.silos[i]['createdAt'],
        apiCallDate: widget.silos[i]['updatedAt'],
      ));
    }
    for (int i = 0; i < silosList.length; i++) {
      widgetsList.add(SpecialContainer(
        dateK: silosList[i].dateK,
        dateS: silosList[i].dateS,
        dateG: silosList[i].dateG,
        name: silosList[i].name,
        temp: silosList[i].temp,
        updateAt: silosList[i].apiCallDate,
        id: silosList[i].id,
        toWhere: () async {
          final http.Response silosResponse = await http.post(
            'http://94.130.230.203:8585/resource/fullsilo',
            headers: {
              'authorization': loggedUser.token,
            },
            body: {
              'silo': silosList[i].id,
              'all': '1',
              'free': '0',
            },
          );
          List<dynamic> calledSilosJson = jsonDecode(silosResponse.body);
          print(silosResponse.body);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MohtaviyateSiloha(
                silos: calledSilosJson,
              ),
            ),
          );
        },
      ));
    }
  }

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
                          'لیست سیلوها',
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
                              children: widgetsList,
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

class SpecialContainer extends StatelessWidget {
  SpecialContainer({
    @required this.dateK,
    @required this.dateS,
    @required this.dateG,
    @required this.name,
    @required this.temp,
    @required this.updateAt,
    @required this.toWhere,
    @required this.id,
  });

  final String dateK;
  final String dateS;
  final String dateG;
  final String name;
  final String temp;
  final String updateAt;
  final String id;
  final Function toWhere;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 320.0,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: toWhere,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    child: Image.asset('assets/logos/silo.png'),
                    width: 45,
                    height: 45,
                  ),
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Color(0xFF527DAA),
                    letterSpacing: 1.0,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
                Container(
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              dateK.substring(0, 10),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14.0,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              dateS.substring(0, 10),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14.0,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              dateG.substring(0, 10),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14.0,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              temp,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14.0,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              updateAt.substring(0, 10),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14.0,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 42,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "تاریخ کف روبی:",
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 14.0,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            "تاریخ سمپاشی:",
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 14.0,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            "تاریخ قرص گذاری:",
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 14.0,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            "دما:",
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 14.0,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Text(
                            "تاریخ و زمان آپدیت این سیلو:",
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Color(0xFF527DAA),
                              fontSize: 14.0,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
