import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Mohavate extends StatefulWidget {
  @override
  _MohavateState createState() => _MohavateState();
}

class _MohavateState extends State<Mohavate> {
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                children: [
                                  TableRow(
                                      children: [
                                        Text("ظرفیت متر مربع",textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
                                        Text("نام محوطه", textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
                                        Text("موقعیت", textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
                                        Text("نام محوطه", textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
                                        Text("ردیف", textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
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
                                        TableCell(child: Text("1",textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("محوطه E", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("ضلع شرقی انبار 1", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("محوطه کالای خطرناک", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("56254m^2", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                      ]
                                  ),
                                  TableRow(
                                      children: [
                                        TableCell(child: Text("2",textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("محوطه A-B-C", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("روبروی اسکله 4 الی 6", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("محوطه کالای متفرقه", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("56254m^2", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                      ]
                                  ),
                                  TableRow(
                                      children: [
                                        TableCell(child: Text("3",textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("محوطه L", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("پشت اسکله 9‍", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("کانتینری", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("56254m^2", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                      ]
                                  ),
                                  TableRow(
                                      children: [
                                        TableCell(child: Text("4",textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("محوطه F2", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("پشت انبار 8", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("کک نفتی", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("56254m^2", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                      ]
                                  ),
                                  TableRow(
                                      children: [
                                        TableCell(child: Text("۵",textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("محوطه K5", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("روبه روی محوطه کک نفتی", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("آهن قراضه", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                        TableCell(child: Text("56254m^2", textAlign: TextAlign.center,textDirection: TextDirection.rtl, style: TextStyle(fontSize: 14),)),
                                      ]
                                  ),
                                ],
                              ),
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

class HomeButton extends StatelessWidget {
  HomeButton(
      {@required this.color,
        @required this.title,
        @required this.icon,
        @required this.toWhere});

  final Color color;
  final String title;
  final String icon;
  final String toWhere;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 105.0,
        height: 112.0,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            Navigator.pushNamed(context, toWhere);
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
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
