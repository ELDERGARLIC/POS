import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:corpapp/utilities/global.dart';

class Vehicle {
  String name;
  String owner;
  String status;
  Vehicle({this.name, this.owner, this.status});
}

class Tajhizati extends StatefulWidget {
  final List<dynamic> tajhizat;
  Tajhizati({this.tajhizat});
  @override
  _TajhizatiState createState() => _TajhizatiState();
}

class _TajhizatiState extends State<Tajhizati> {
  List<Vehicle> silosList = <Vehicle>[];
  List<BodyEl> widgetsList = <BodyEl>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.tajhizat.length; i++) {
      silosList.add(Vehicle(
        name: widget.tajhizat[i]['name'],
        owner: widget.tajhizat[i]['owner'],
        status: widget.tajhizat[i]['status'],
      ));
    }
    for (int i = 0; i < silosList.length; i++) {
      widgetsList.add(BodyEl(
        name: silosList[i].name,
        owner: silosList[i].owner,
        status: silosList[i].status,
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
                          'تجهیزات',
                          textDirection: TextDirection.rtl,
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
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: [
                                  TableRow(children: [
                                    Text(
                                      "وضعیت",
                                      textScaleFactor: 1.5,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "مالک",
                                      textScaleFactor: 1.5,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "نام",
                                      textScaleFactor: 1.5,
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            Column(
                              children: widgetsList,
                            )
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

class BodyEl extends StatelessWidget {
  final String name;
  final String owner;
  final String status;
  BodyEl({this.name, this.owner, this.status});

  @override
  Widget build(BuildContext context) {
    return CustomizedTable(
      items: [
        TableRow(
          children: [
            Text(
              name,
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
            Text(
              owner,
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
            Text(
              status,
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomizedTable extends StatelessWidget {
  CustomizedTable({@required this.items});

  final List<TableRow> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                textDirection: TextDirection.rtl,
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder(
                  horizontalInside: BorderSide(
                    width: 1,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
                children: items,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
