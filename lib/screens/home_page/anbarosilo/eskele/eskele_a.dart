import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:corpapp/utilities/global.dart';

class EskeleA extends StatefulWidget {
  @override
  _EskeleAState createState() => _EskeleAState();
}

class _EskeleAState extends State<EskeleA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: returnFloatingActionButton(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo.shade400,
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
                      Colors.indigo.shade400,
                      Colors.indigo.shade300,
                      Colors.indigo.shade200,
                      Colors.indigo.shade100,
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
                          'اسکله A',
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
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  Text(
                                    "A1",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "A2",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "A3",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(
                                children: [
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(
                                children: [
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(
                                children: [
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "20",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              TableRow(children: [
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "40",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                          CustomizedTable(
                            items: [
                              TableRow(children: [
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "45",
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                            height: 10,
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 10,
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
