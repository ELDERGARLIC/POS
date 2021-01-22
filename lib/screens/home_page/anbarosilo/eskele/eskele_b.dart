import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class EskeleB extends StatefulWidget {
  @override
  _EskeleBState createState() => _EskeleBState();
}

class _EskeleBState extends State<EskeleB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                launch(
                    'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
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
                          'اسکله B',
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
                            children:<Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("B1",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("B2",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("B3",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("B4",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("45",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("45",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("45",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("45",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("20",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                    TableRow(
                                        children: [
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("40",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Table(
                                  textDirection: TextDirection.rtl,
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border:TableBorder.all(width: 2.0,color: Colors.white54),
                                  children: [
                                    TableRow(
                                        children: [
                                          Text("45",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("45",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("45",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                          Text("45",textScaleFactor: 1.5, textAlign: TextAlign.center,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                            ]
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

