import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/constants.dart';
import 'package:corpapp/utilities/global.dart';
import 'package:jalali_calendar/jalali_calendar.dart';
import 'package:persian_date/persian_date.dart';

class Amaliyat extends StatefulWidget {
  @override
  _AmaliyatState createState() => _AmaliyatState();
}

class _AmaliyatState extends State<Amaliyat> {
  PersianDate persianDate = PersianDate(format: "yyyy/mm/dd");
  String pickedDate = '';

  Future _selectEndDate() async {
    String picked = await jalaliCalendarPicker(
      context: context,
      convertToGregorian: false,
      selectedFormat: "dd-mm-yyyy",
    );
    if (picked != null) setState(() => pickedDate = picked);
  }

  String mored = "";
  TextEditingController janeshinCodeController = new TextEditingController();
  TextEditingController tajhizatController = new TextEditingController();
  TextEditingController nameKeshtiController = new TextEditingController();
  TextEditingController nirooController = new TextEditingController();
  TextEditingController janeshinFamlilyController = new TextEditingController();
  TextEditingController tonajController = new TextEditingController();
  TextEditingController baskoolController = new TextEditingController();
  String hint = "لطفا نوع عملیات خود را انتخاب کنید";
  String hint2 = "نوع کالا";
  String hint3 = "نوع انبار";
  String hint4 = "نوع تجهیزات";
  String hint5 = "نوع نیرو";
  @override
  void initState() {
    super.initState();
    print(
      "Parse TO Format ${persianDate.gregorianToJalali("2019-02-20T00:19:54.000Z", "yyyy-m-d hh:nn")}",
    );
    pickedDate = persianDate.gregorianToJalali(
      DateTime.now().toString(),
      "dd-mm-yyyy",
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget TajhizatBox = Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 160,
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 50.0,
              child: TextField(
                controller: tajhizatController,
                textAlign: TextAlign.end,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  suffixIcon: Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                    textDirection: TextDirection.rtl,
                  ),
                  hintText: 'تعداد',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            SizedBox(
              width: 62,
            ),
            DropdownButton<String>(
              hint: Text(
                hint4,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              items: <String>[
                'تجهیزات 1',
                'تجهیزات 2',
                'تجهیزات 3',
                'تجهیزات 4',
              ].map(
                (String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                },
              ).toList(),
              onChanged: (x) {
                setState(
                  () {
                    hint4 = x;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );

    Widget NirooBox = Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 160,
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 50.0,
              child: TextField(
                controller: nirooController,
                textAlign: TextAlign.end,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  suffixIcon: Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                    textDirection: TextDirection.rtl,
                  ),
                  hintText: 'تعداد',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            SizedBox(
              width: 84,
            ),
            DropdownButton<String>(
              hint: Text(
                hint5,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              items: <String>[
                'نیرو 1',
                'نیرو 2',
                'نیرو 3',
                'نیرو 4',
              ].map(
                (String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                },
              ).toList(),
              onChanged: (x) {
                setState(
                  () {
                    hint5 = x;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );

    List<Widget> tajhizatList = [TajhizatBox];
    List<Widget> nirooList = [NirooBox];
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'عملیات',
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
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Text(
                                      'نوع عملیات',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: RaisedButton(
                                        elevation: 5.0,
                                        onPressed: () {},
                                        padding: EdgeInsets.all(15.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.white,
                                        child: DropdownButton<String>(
                                          hint: Text(
                                            hint,
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          items: <String>[
                                            'بارگیری',
                                            'تخلیه',
                                            'حمل یکسره',
                                          ].map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: new Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (x) {
                                            setState(() {
                                              hint = x;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 12.0,
                                      top: 15,
                                    ),
                                    child: Text(
                                      'اطلاعات کشتی',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 160,
                                              alignment: Alignment.centerLeft,
                                              decoration: kBoxDecorationStyle,
                                              height: 50.0,
                                              child: TextField(
                                                controller:
                                                    nameKeshtiController,
                                                textAlign: TextAlign.end,
                                                keyboardType:
                                                    TextInputType.text,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'OpenSans',
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 14.0),
                                                  suffixIcon: Icon(
                                                    Icons.arrow_forward_sharp,
                                                    color: Colors.white,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                  hintText: 'نام کشتی',
                                                  hintStyle: kHintTextStyle,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 24,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              height: 65.0,
                                              width: 160,
                                              child: RaisedButton(
                                                elevation: 5.0,
                                                onPressed: () {
                                                  setState(() {
                                                    _selectEndDate();
                                                  });
                                                },
                                                padding: EdgeInsets.all(10.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                color: Colors.white,
                                                child: Text(
                                                  "تاریخ ورود:\t\t$pickedDate",
                                                  textAlign: TextAlign.center,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: TextStyle(
                                                    color: Color(0xFF527DAA),
                                                    letterSpacing: 1.5,
                                                    fontSize: 11.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'OpenSans',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 160,
                                              alignment: Alignment.centerLeft,
                                              decoration: kBoxDecorationStyle,
                                              height: 50.0,
                                              child: TextField(
                                                controller: baskoolController,
                                                textAlign: TextAlign.end,
                                                keyboardType:
                                                    TextInputType.text,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'OpenSans',
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 14.0),
                                                  suffixIcon: Icon(
                                                    Icons.arrow_forward_sharp,
                                                    color: Colors.white,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                  hintText: 'باسکول',
                                                  hintStyle: kHintTextStyle,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 24,
                                            ),
                                            Container(
                                              width: 160,
                                              alignment: Alignment.centerLeft,
                                              decoration: kBoxDecorationStyle,
                                              height: 50.0,
                                              child: TextField(
                                                controller: tonajController,
                                                textAlign: TextAlign.end,
                                                keyboardType:
                                                    TextInputType.text,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'OpenSans',
                                                ),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 14.0),
                                                  suffixIcon: Icon(
                                                    Icons.arrow_forward_sharp,
                                                    color: Colors.white,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                  hintText: 'تناژ',
                                                  hintStyle: kHintTextStyle,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 160,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: RaisedButton(
                                                elevation: 5.0,
                                                onPressed: () {},
                                                padding: EdgeInsets.all(15.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                color: Colors.white,
                                                child: DropdownButton<String>(
                                                  hint: Text(
                                                    hint2,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  items: <String>[
                                                    'کالا-1',
                                                    'کالا-2',
                                                    'کالا-3',
                                                  ].map((String value) {
                                                    return new DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: new Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (x) {
                                                    setState(() {
                                                      hint2 = x;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 24,
                                            ),
                                            Container(
                                              width: 160,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: RaisedButton(
                                                elevation: 5.0,
                                                onPressed: () {},
                                                padding: EdgeInsets.all(15.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                color: Colors.white,
                                                child: DropdownButton<String>(
                                                  hint: Text(
                                                    hint3,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  items: <String>[
                                                    'سیلو',
                                                    'کانتینری',
                                                    'انبار',
                                                    'محوطه',
                                                  ].map((String value) {
                                                    return new DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: new Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (x) {
                                                    setState(() {
                                                      hint3 = x;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("LOL");
                                      setState(() {
                                        tajhizatList.add(TajhizatBox);
                                        print(tajhizatList.length);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 12.0, top: 10, bottom: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Icon(Icons.add),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'تجهیزات',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'OpenSans',
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: tajhizatList,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("LOL");
                                      setState(() {
                                        tajhizatList.add(TajhizatBox);
                                        print(tajhizatList.length);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 12.0, top: 10, bottom: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Icon(Icons.add),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'نیرو',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'OpenSans',
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: nirooList,
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
                                        //TODO: IMPLEMENT THE API HERE
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
