import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/global.dart';

class Kandoo {
  String name;
  String id;
  bool free;
  String contenttype;
  String tonnage;
  String freespace;
  Kandoo(
      {this.name,
      this.contenttype,
      this.free,
      this.freespace,
      this.id,
      this.tonnage});
}

class MohtaviyateSiloha extends StatefulWidget {
  MohtaviyateSiloha({this.silos});
  final List<dynamic> silos;

  @override
  _MohtaviyateSilohaState createState() => _MohtaviyateSilohaState();
}

class _MohtaviyateSilohaState extends State<MohtaviyateSiloha> {
  List<Kandoo> silosList = <Kandoo>[];
  List<StorageContainer> widgetsList = <StorageContainer>[];

  @override
  void initState() {
    super.initState();
    print(widget.silos.length);
    for (int i = 0; i < widget.silos.length; i++) {
      silosList.add(Kandoo(
        id: widget.silos[i]['_id'],
        name: widget.silos[i]['name'],
        free: widget.silos[i]['free'],
        contenttype: widget.silos[i]['contenttype'],
        tonnage: widget.silos[i]['tonnage'],
        freespace: widget.silos[i]['freespace'],
      ));
    }
    for (int i = 0; i < silosList.length; i++) {
      widgetsList.add(StorageContainer(
        freespace: silosList[i].freespace,
        icon: 'assets/logos/anbarlist.png',
        contenttype: silosList[i].contenttype,
        color: silosList[i].free ? Colors.white : Colors.red.shade100,
        name: silosList[i].name,
        tonnage: silosList[i].tonnage,
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
                          'سیلو 6 (پدیدآوران)',
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

class StorageContainer extends StatelessWidget {
  StorageContainer({
    @required this.color,
    @required this.contenttype,
    @required this.icon,
    @required this.tonnage,
    @required this.name,
    @required this.freespace,
  });

  final Color color;
  final String contenttype;
  final String icon;
  final String tonnage;
  final String freespace;
  final String name;

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
                child: Image.asset(icon),
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
