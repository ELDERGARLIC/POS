import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/global.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String mored = "";
  TextEditingController darkhastController = new TextEditingController();
  TextEditingController pishnehadController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'پروفایل',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      'مشخصات فردی',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ProfileBox(
                                        color: Colors.white,
                                        title: "نام:",
                                        pWidth:
                                            MediaQuery.of(context).size.width,
                                        data: loggedUser.fName,
                                      ),
                                      ProfileBox(
                                        color: Colors.white,
                                        title: "نام خانوادگی:",
                                        pWidth:
                                            MediaQuery.of(context).size.width,
                                        data: loggedUser.lName,
                                      ),
                                      ProfileBox(
                                        color: Colors.white,
                                        title: "شغل:",
                                        pWidth:
                                            MediaQuery.of(context).size.width,
                                        data: loggedUser.post,
                                      ),
                                      ProfileBox(
                                        color: Colors.white,
                                        title: "کد ملی:",
                                        pWidth:
                                            MediaQuery.of(context).size.width,
                                        data: loggedUser.nationalId,
                                      ),
                                      ProfileBox(
                                        color: Colors.white,
                                        title: "شماره همراه:",
                                        pWidth:
                                            MediaQuery.of(context).size.width,
                                        data: loggedUser.phone,
                                      ),
                                      ProfileBox(
                                        color: Colors.white,
                                        title: "کد پرسنلی:",
                                        pWidth:
                                            MediaQuery.of(context).size.width,
                                        data: loggedUser.personalCode,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: RaisedButton(
                                            elevation: 5.0,
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                '/it',
                                              );
                                            },
                                            padding: EdgeInsets.all(15.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            color: Colors.white,
                                            child: Container(
                                              width: 150,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.settings,
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  Text(
                                                    "درخواست IT ",
                                                    textAlign: TextAlign.end,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      color: Color(0xFF527DAA),
                                                      letterSpacing: 1.5,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'OpenSans',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: RaisedButton(
                                            elevation: 5.0,
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                '/morekhasi',
                                              );
                                            },
                                            padding: EdgeInsets.all(15.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            color: Colors.white,
                                            child: Container(
                                              width: 150,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.settings,
                                                    color: Colors.blue.shade700,
                                                  ),
                                                  Text(
                                                    "درخواست مرخصی ",
                                                    textAlign: TextAlign.end,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                      color: Color(0xFF527DAA),
                                                      letterSpacing: 1.5,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'OpenSans',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 150,
                                      )
                                    ],
                                  ),
                                ],
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

class ProfileBox extends StatelessWidget {
  ProfileBox({
    @required this.color,
    @required this.title,
    @required this.data,
    @required this.pWidth,
  });

  final Color color;
  final String title;
  final String data;
  final double pWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        width: pWidth - 30,
        height: 65.0,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {},
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$title $data",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                ),
              ),
              /*
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Image.asset('assets/logos/profile.png'), //TODO: MAKE IT MORE BEAUTIFUL!
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
