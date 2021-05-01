import 'package:corpapp/screens/home_page/anbarosilo/anbarha/anbar_details.dart';
import 'package:corpapp/screens/home_page/anbarosilo/mohavate/mohavate_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corpapp/utilities/global.dart';

class Mohavate extends StatefulWidget {
  final List<dynamic> mohavateha;
  Mohavate({this.mohavateha});

  @override
  _MohavateState createState() => _MohavateState();
}

class _MohavateState extends State<Mohavate> {
  List<SpecialContainer> widgetsList = <SpecialContainer>[];
  List<MohavateClass> mohavateList = <MohavateClass>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.mohavateha.length; i++) {
      mohavateList.add(MohavateClass(
          id: widget.mohavateha[i]['_id'], name: widget.mohavateha[i]['name']));
    }
    for (int i = 0; i < mohavateList.length; i++) {
      widgetsList.add(SpecialContainer(
        onvan: mohavateList[i].name,
        toWhere: () async {
          final http.Response anbarResponse = await http.post(
            'http://94.130.230.203:8585/resource/fullarea',
            headers: {
              'authorization': loggedUser.token,
            },
            body: {
              'area': mohavateList[i].id,
              'all': '1',
              'free': '0',
            },
          );
          List<dynamic> calledSilosJson = jsonDecode(anbarResponse.body);
          print(widget.mohavateha[i]['_id']);
          print(calledSilosJson);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MohavateDetails(
                mohavates: calledSilosJson,
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
                          'محوطه',
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
  SpecialContainer({@required this.onvan, @required this.toWhere});

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
                  child: Image.asset('assets/logos/mohavate.png'),
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
