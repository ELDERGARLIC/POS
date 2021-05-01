import 'package:corpapp/screens/home_page/anbarosilo/anbarha/anbar_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corpapp/utilities/global.dart';

class Anbarha extends StatefulWidget {
  final List<dynamic> anbarha;
  Anbarha({this.anbarha});

  @override
  _AnbarhaState createState() => _AnbarhaState();
}

class _AnbarhaState extends State<Anbarha> {
  List<Anbars> widgetsList = <Anbars>[];
  List<AnbarClass> anbarList = <AnbarClass>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.anbarha.length; i++) {
      anbarList.add(AnbarClass(
          id: widget.anbarha[i]['_id'], name: widget.anbarha[i]['name']));
    }
    for (int i = 0; i < anbarList.length; i++) {
      widgetsList.add(Anbars(
        onvan: anbarList[i].name,
        toWhere: () async {
          final http.Response anbarResponse = await http.post(
            'http://94.130.230.203:8585/resource/fullstorage',
            headers: {
              'authorization': loggedUser.token,
            },
            body: {
              'storage': anbarList[i].id,
              'all': '1',
              'free': '0',
            },
          );
          List<dynamic> calledSilosJson = jsonDecode(anbarResponse.body);
          print(widget.anbarha[i]['_id']);
          print(calledSilosJson);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnbarDetails(
                anbars: calledSilosJson,
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
                          'انبار',
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

class Anbars extends StatelessWidget {
  Anbars({@required this.onvan, @required this.toWhere});

  final String onvan;
  final Function toWhere;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 340.0,
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
                Container(
                  child: Image.asset('assets/logos/anbarlist.png'),
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  onvan,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
