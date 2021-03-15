import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/global.dart';

class Anbarha extends StatefulWidget {
  @override
  _AnbarhaState createState() => _AnbarhaState();
}

class _AnbarhaState extends State<Anbarha> {
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
                              children: [
                                SpecialContainer(
                                  radif: '1',
                                  onvan: 'انبار 1',
                                  masahat: '12000m²',
                                  zarfiyat: '25000',
                                  tool: '200',
                                  arz: '60',
                                  ertefa: '6.5',
                                  toWhere: '/anbare1',
                                ),
                                SpecialContainer(
                                  radif: '2',
                                  onvan: 'انبار 2',
                                  masahat: '10000m²',
                                  zarfiyat: '20000',
                                  tool: '100',
                                  arz: '100',
                                  ertefa: '6.5',
                                  toWhere: '/anbare2',
                                ),
                                SpecialContainer(
                                  radif: '3',
                                  onvan: 'انبار 3',
                                  masahat: '10000m²',
                                  zarfiyat: '20000',
                                  tool: '100',
                                  arz: '100',
                                  ertefa: '6.5',
                                  toWhere: '/anbare3',
                                ),
                                SpecialContainer(
                                  radif: '4',
                                  onvan: 'انبار 4',
                                  masahat: '10000m²',
                                  zarfiyat: '20000',
                                  tool: '100',
                                  arz: '100',
                                  ertefa: '6.5',
                                  toWhere: '/anbare4',
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

class SpecialContainer extends StatelessWidget {
  SpecialContainer(
      {@required this.radif,
      @required this.onvan,
      @required this.masahat,
      @required this.zarfiyat,
      @required this.tool,
      @required this.arz,
      @required this.ertefa,
      @required this.toWhere});

  final String radif;
  final String onvan;
  final String masahat;
  final String zarfiyat;
  final String tool;
  final String arz;
  final String ertefa;
  final String toWhere;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 340.0,
        height: 170.0,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            Navigator.pushNamed(context, toWhere);
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Text(
                              "ارتفاع حداقل",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              "عرض",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              "طول",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              "ظرفیت تناژ اسمی",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              "مساحت",
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    textDirection: TextDirection.rtl,
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder(
                      verticalInside: BorderSide(
                        width: 2,
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Text(
                              masahat,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              zarfiyat,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              tool,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              arz,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          TableCell(
                            child: Text(
                              ertefa,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
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
