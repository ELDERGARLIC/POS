import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:corpapp/utilities/global.dart';

class EskeleC extends StatefulWidget {
  @override
  _EskeleCState createState() => _EskeleCState();
}

class _EskeleCState extends State<EskeleC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: returnFloatingActionButton(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow.shade600,
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
                      Colors.yellow.shade600,
                      Colors.yellow.shade500,
                      Colors.yellow.shade400,
                      Colors.yellow.shade300,
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
                          'اسکله C',
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
                                    "C1",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "C2",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "C3",
                                    textScaleFactor: 1.5,
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              ],
                            ),
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
                            ],
                          ),
                        ]),
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
