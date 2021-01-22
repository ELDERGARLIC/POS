import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Anbare3 extends StatefulWidget {
  @override
  _Anbare3State createState() => _Anbare3State();
}

class _Anbare3State extends State<Anbare3> {
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
                          'انبار 3',
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
                                ),
                                StorageContainer(
                                  icon: 'assets/logos/anbarlist.png',
                                  mohtaviyat: 'ایتم',
                                  color: Colors.white,
                                  vazn: 'کیلو',
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

class StorageContainer extends StatelessWidget {
  StorageContainer(
      {@required this.color,
      @required this.mohtaviyat,
      @required this.icon,
      @required this.vazn});

  final Color color;
  final String mohtaviyat;
  final String icon;
  final String vazn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 100.0,
        height: 150.0,
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
                child: Image.asset(icon),
                width: 45,
                height: 45,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "محتویات: $mohtaviyat",
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
                      "وزن: $vazn",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
