import 'package:corpapp/screens/home_page/anbarosilo/siloha/mohtaviyatesilo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corpapp/utilities/global.dart';

class MohavateDetails extends StatefulWidget {
  MohavateDetails({this.mohavates});
  final List<dynamic> mohavates;
  @override
  _MohavateDetailsState createState() => _MohavateDetailsState();
}

class _MohavateDetailsState extends State<MohavateDetails> {
  List<MohavateElement> mohavateList = <MohavateElement>[];
  List<MohavateContainer> widgetsList = <MohavateContainer>[];

  @override
  void initState() {
    super.initState();
    print(widget.mohavates.length);
    for (int i = 0; i < widget.mohavates.length; i++) {
      mohavateList.add(MohavateElement(
        temp: widget.mohavates[i]['temp'],
        id: widget.mohavates[i]['_id'],
        tonnage: widget.mohavates[i]['tonnage'],
        contenttype: widget.mohavates[i]['contenttype'],
        name: widget.mohavates[i]['name'],
        free: widget.mohavates[i]['free'],
        freespace: widget.mohavates[i]['freespace'],
      ));
    }
    for (int i = 0; i < mohavateList.length; i++) {
      widgetsList.add(MohavateContainer(
        contenttype: mohavateList[i].contenttype,
        tonnage: mohavateList[i].tonnage,
        name: mohavateList[i].name,
        temp: mohavateList[i].temp,
        freespace: mohavateList[i].freespace,
        id: mohavateList[i].id,
        free: mohavateList[i].free,
        color: mohavateList[i].free ? Colors.white : Colors.red.shade100,
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

class MohavateContainer extends StatelessWidget {
  MohavateContainer({
    @required this.tonnage,
    @required this.contenttype,
    @required this.freespace,
    @required this.name,
    @required this.temp,
    @required this.free,
    @required this.id,
    @required this.color,
  });

  final String tonnage;
  final String contenttype;
  final String freespace;
  final String name;
  final String temp;
  final bool free;
  final String id;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 300.0,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            print("Pressed!");
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/logos/mohavate.png'),
                width: 45,
                height: 45,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.0,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    "محتویات: $contenttype",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.0,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    "تناژ قابل ذخیره سازی: $tonnage",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.0,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    "تناژ خالی: $freespace",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.0,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Text(
                    "دما: $temp",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.0,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
