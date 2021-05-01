import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/global.dart';

class AnbarDetails extends StatefulWidget {
  AnbarDetails({this.anbars});
  final List<dynamic> anbars;

  @override
  _AnbarDetailsState createState() => _AnbarDetailsState();
}

class _AnbarDetailsState extends State<AnbarDetails> {
  List<AnbarElements> anbarList = <AnbarElements>[];
  List<AnbarContainer> widgetsList = <AnbarContainer>[];

  @override
  void initState() {
    super.initState();
    print(widget.anbars.length);
    for (int i = 0; i < widget.anbars.length; i++) {
      anbarList.add(AnbarElements(
        id: widget.anbars[i]['_id'],
        name: widget.anbars[i]['name'],
        free: widget.anbars[i]['free'],
        contenttype: widget.anbars[i]['contenttype'],
        length: widget.anbars[i]['length'],
        width: widget.anbars[i]['width'],
      ));
    }
    for (int i = 0; i < anbarList.length; i++) {
      widgetsList.add(AnbarContainer(
        icon: 'assets/logos/anbarlist.png',
        contenttype: anbarList[i].contenttype,
        color: anbarList[i].free ? Colors.white : Colors.red.shade100,
        name: anbarList[i].name,
        width: anbarList[i].width.toString(),
        length: anbarList[i].length.toString(),
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

class AnbarContainer extends StatelessWidget {
  AnbarContainer({
    @required this.color,
    @required this.contenttype,
    @required this.icon,
    @required this.width,
    @required this.name,
    @required this.length,
  });

  final Color color;
  final String contenttype;
  final String icon;
  final String width;
  final String length;
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
                    "طول: $width",
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
                    "عرض: $length",
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
