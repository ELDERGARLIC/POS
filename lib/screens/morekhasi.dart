import 'package:corpapp/services/morekhasi/morekhasi_networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/constants.dart';
import 'package:corpapp/utilities/global.dart';
import 'package:jalali_calendar/jalali_calendar.dart';
import 'package:persian_date/persian_date.dart';

class Morekhasi extends StatefulWidget {
  @override
  _MorekhasiState createState() => _MorekhasiState();
}

class _MorekhasiState extends State<Morekhasi> {
  PersianDate persianDate = PersianDate(format: "yyyy/mm/dd  \n DD  , d  MM  ");
  String pickedStartDate = '';
  String pickedEndDate = '';

  Future _selectStartDate() async {
    String picked = await jalaliCalendarPicker(
      context: context,
      convertToGregorian: false,
    );
    if (picked != null) setState(() => pickedStartDate = picked);
  }

  Future _selectEndDate() async {
    String picked = await jalaliCalendarPicker(
      context: context,
      convertToGregorian: false,
    );
    if (picked != null) setState(() => pickedEndDate = picked);
  }

  bool _estelajiCheck = false;
  bool _biHoghooghCheck = false;
  String mored = "";
  TextEditingController janeshinCodeController = new TextEditingController();
  TextEditingController janeshinNameController = new TextEditingController();
  TextEditingController janeshinFamlilyController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print(
      "Parse TO Format ${persianDate.gregorianToJalali("2019-02-20T00:19:54.000Z", "yyyy-m-d hh:nn")}",
    );
    pickedStartDate = persianDate.gregorianToJalali(
      DateTime.now().toString(),
      "yyyy-m-d",
    );
    pickedEndDate = persianDate.gregorianToJalali(
      DateTime.now().toString(),
      "yyyy-m-d",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF73AEF5),
      ),
      endDrawer: returnDrawer(context),
      floatingActionButton: returnFloatingActionButton(context),
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
                          'درخواست مرخصی',
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
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Text(
                                      'نوع مرخصی',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CustomCheckBox(
                                        color: Colors.white,
                                        title: "استعلاجی",
                                        checkbox: Checkbox(
                                          value: _estelajiCheck,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                _estelajiCheck = value;
                                                if (value == true) {
                                                  _biHoghooghCheck = false;
                                                  mored = "استعلاجی";
                                                }
                                                print(mored);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      CustomCheckBox(
                                        color: Colors.white,
                                        title: "بی حقوق",
                                        checkbox: Checkbox(
                                          value: _biHoghooghCheck,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                _biHoghooghCheck = value;
                                                if (value == true) {
                                                  _estelajiCheck = false;
                                                  mored = "بی حقوق";
                                                }
                                                print(mored);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 12.0,
                                      top: 15,
                                    ),
                                    child: Text(
                                      'تاریخ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          width: 160.0,
                                          height: 65.0,
                                          child: RaisedButton(
                                            elevation: 5.0,
                                            onPressed: () {
                                              setState(() {
                                                _selectStartDate();
                                                print(pickedStartDate);
                                              });
                                            },
                                            padding: EdgeInsets.all(15.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            color: Colors.white,
                                            child: Text(
                                              "از تاریخ:\t\t$pickedStartDate",
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
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        width: 160.0,
                                        height: 65.0,
                                        child: RaisedButton(
                                          elevation: 5.0,
                                          onPressed: () {
                                            setState(() {
                                              _selectEndDate();
                                              print(pickedEndDate);
                                            });
                                          },
                                          padding: EdgeInsets.all(15.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          color: Colors.white,
                                          child: Text(
                                            "تا تاریخ:\t\t$pickedEndDate",
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
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, top: 25, bottom: 10),
                                    child: Text(
                                      'کد پرسنلی جانشین',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Container(
                                      width: 350,
                                      alignment: Alignment.centerLeft,
                                      decoration: kBoxDecorationStyle,
                                      height: 60.0,
                                      child: TextField(
                                        controller: janeshinCodeController,
                                        textAlign: TextAlign.end,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'OpenSans',
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              EdgeInsets.only(top: 14.0),
                                          suffixIcon: Icon(
                                            Icons.message,
                                            color: Colors.white,
                                            textDirection: TextDirection.rtl,
                                          ),
                                          hintText:
                                              'لطفا کد پرسنلی جانشین خود را وارد کنید',
                                          hintStyle: kHintTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, top: 10, bottom: 10),
                                    child: Text(
                                      'نام جانشین',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Container(
                                      width: 350,
                                      alignment: Alignment.centerLeft,
                                      decoration: kBoxDecorationStyle,
                                      height: 60.0,
                                      child: TextField(
                                        controller: janeshinNameController,
                                        textAlign: TextAlign.end,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'OpenSans',
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              EdgeInsets.only(top: 14.0),
                                          suffixIcon: Icon(
                                            Icons.message,
                                            color: Colors.white,
                                            textDirection: TextDirection.rtl,
                                          ),
                                          hintText:
                                              'لطفا نام جانشین خود را وارد کنید',
                                          hintStyle: kHintTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, top: 10, bottom: 10),
                                    child: Text(
                                      'نام خانوادگی جانشین',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Container(
                                      width: 350,
                                      alignment: Alignment.centerLeft,
                                      decoration: kBoxDecorationStyle,
                                      height: 60.0,
                                      child: TextField(
                                        controller: janeshinFamlilyController,
                                        textAlign: TextAlign.end,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'OpenSans',
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              EdgeInsets.only(top: 14.0),
                                          suffixIcon: Icon(
                                            Icons.message,
                                            color: Colors.white,
                                            textDirection: TextDirection.rtl,
                                          ),
                                          hintText:
                                              'لطفا نام خانوادگی جانشین خود را وارد کنید',
                                          hintStyle: kHintTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 135,
                                      vertical: 20,
                                    ),
                                    child: RaisedButton(
                                      elevation: 5.0,
                                      onPressed: () async {
                                        dynamic data = await getMorekhasiData(
                                          context,
                                          mored,
                                          pickedStartDate,
                                          pickedEndDate,
                                          janeshinCodeController.text,
                                          janeshinNameController.text,
                                          janeshinFamlilyController.text,
                                        );
                                        print(data);
                                      },
                                      padding: EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      color: Colors.white,
                                      child: Icon(Icons.send),
                                    ),
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

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    @required this.color,
    @required this.title,
    @required this.checkbox,
  });

  final Color color;
  final String title;
  final Checkbox checkbox;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        width: 160.0,
        height: 65.0,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {},
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
              checkbox,
            ],
          ),
        ),
      ),
    );
  }
}
