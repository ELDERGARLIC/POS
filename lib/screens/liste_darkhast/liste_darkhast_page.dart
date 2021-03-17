import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/services/liste_darkhast/liste_darkhast_networking.dart';
import 'package:corpapp/utilities/global.dart';
import 'package:corpapp/screens/liste_darkhast/darkhast_details.dart';
import 'package:corpapp/screens/liste_darkhast/darkhast_details_manager.dart';
import 'package:corpapp/screens/liste_darkhast/darkhast_details_general.dart';

class ListeDarkhastPage extends StatefulWidget {
  ListeDarkhastPage({this.listeDarkhast});
  final listeDarkhast;
  @override
  _ListeDarkhastPageState createState() => _ListeDarkhastPageState();
}

class _ListeDarkhastPageState extends State<ListeDarkhastPage> {
  List<MessegeCard> listOfWidgets = [];

  @override
  void initState() {
    for (int i = 1; i < widget.listeDarkhast.length; i++) {
      listOfWidgets.add(MessegeCard(
        typeOfDarkhast: widget.listeDarkhast[i.toString()]["morede_darkhasti"],
        tarikh: widget.listeDarkhast[i.toString()]["date"],
        saat: widget.listeDarkhast[i.toString()]["time"],
        dataMap: widget.listeDarkhast[i.toString()],
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF73AEF5),
      ),
      endDrawer: returnDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getListeDarkhast(context).whenComplete(() => Navigator.pop(context));
        },
        backgroundColor: Color(0xFF61A4F1),
        child: Stack(
          children: [
            Icon(Icons.refresh),
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
                          'پیغام ها',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: listOfWidgets,
                              ),
                            ],
                          ),
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

class MessegeCard extends StatelessWidget {
  const MessegeCard({
    Key key,
    @required this.typeOfDarkhast,
    @required this.tarikh,
    @required this.saat,
    @required this.dataMap,
  }) : super(key: key);

  final String typeOfDarkhast;
  final String tarikh;
  final String saat;
  final dataMap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(dataMap);
        if (loggedUser.post == "مدیر عامل") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DarkhastDetailsManager(
                dataMap: dataMap,
              ),
            ),
          );
        } else if (loggedUser.post == "مدير عمران") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DarkhastDetails(
                dataMap: dataMap,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DarkhastDetailsGeneral(
                dataMap: dataMap,
              ),
            ),
          );
        }
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Icon(Icons.more_vert),
            ),
            Container(
              width: 275,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 10,
                  left: 10,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      typeOfDarkhast,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'تاریخ $tarikh',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'ساعت $saat',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                child: Image.asset(
                  'assets/logos/$typeOfDarkhast.png',
                  width: 40,
                  height: 40,
                ),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
