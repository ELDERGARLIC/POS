import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/global.dart';

class Anbare1 extends StatefulWidget {
  @override
  _Anbare1State createState() => _Anbare1State();
}

class _Anbare1State extends State<Anbare1> {
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
                          'انبار 1',
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
