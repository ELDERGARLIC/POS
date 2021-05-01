import 'package:corpapp/services/opreation/opreation_networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/constants.dart';
import 'package:corpapp/utilities/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jalali_calendar/jalali_calendar.dart';
import 'package:persian_date/persian_date.dart';

// Temps
List<String> tempSelectedElements = <String>[];

// Global Variables
String resourceName;
String resourcePart;
TextEditingController tonnageController = new TextEditingController();
TextEditingController baskolController = new TextEditingController();
TextEditingController shipContentController = new TextEditingController();
TextEditingController shipNameController = new TextEditingController();
TextEditingController nirooController = new TextEditingController();
String resourceType = "نوع انبار";
String title = "لطفا نوع عملیات خود را انتخاب کنید";
String humans;
String vehicleids;

// OTG Variables
List<AnbarClass> anbarList = <AnbarClass>[];
List<MainWidget> anbarMainMenuList = <MainWidget>[];

List<AnbarElements> anbarElementsList = <AnbarElements>[];
List<ElementWidget> anbarSecondaryMenuList = <ElementWidget>[];

List<MohavateClass> mohavateList = <MohavateClass>[];
List<MainWidget> mohavateMainMenuList = <MainWidget>[];

List<MohavateElement> mohavateElementsList = <MohavateElement>[];
List<ElementWidget> mohavateSecondaryMenuList = <ElementWidget>[];

List<SiloClass> siloList = <SiloClass>[];
List<MainWidget> siloMainMenuList = <MainWidget>[];

List<SiloElements> siloElementsList = <SiloElements>[];
List<ElementWidget> siloSecondaryMenuList = <ElementWidget>[];

List<String> dropDownList = <String>[];
List<Vehicle> vehiclesGlobalList = <Vehicle>[];

class Amaliyat extends StatefulWidget {
  Amaliyat({this.vehiclesList});
  final List<Vehicle> vehiclesList;

  @override
  _AmaliyatState createState() => _AmaliyatState();
}

class _AmaliyatState extends State<Amaliyat> {
  // Shamsi DatePicker Independencies
  PersianDate persianDate = PersianDate(format: "yyyy/mm/dd");
  String pickedDate = '';

  Future _selectDate() async {
    String picked = await jalaliCalendarPicker(
      context: context,
      convertToGregorian: false,
      selectedFormat: "yyyy/mm/dd",
    );
    if (picked != null) setState(() => pickedDate = picked);
  }

  List<HumanWidget> humanList = <HumanWidget>[];
  List<ResourceWidget> resourceList = <ResourceWidget>[];

  @override
  void initState() {
    super.initState();

    // Shamsi Initialization.
    print(
      "Parse TO Format ${persianDate.gregorianToJalali("2019-02-20T00:19:54.000Z", "yyyy-m-d hh:nn")}",
    );
    pickedDate = persianDate.gregorianToJalali(
      DateTime.now().toString(),
      "yyyy/mm/dd",
    );

    // Human and Resource Widgets filling stage.
    humanList.add(HumanWidget());
    resourceList.add(ResourceWidget());

    // Filling the vehicles dropdown with the vehicles.
    for (int i = 0; i < widget.vehiclesList.length; i++) {
      dropDownList.add(widget.vehiclesList[i].name);
    }
    vehiclesGlobalList = widget.vehiclesList;
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
                      // Gradient Background.
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
                // Body Starts Here!
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'نوع عملیات',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 4.0,
                                bottom: 4,
                                left: 12,
                                right: 12,
                              ),
                              child: Container(
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 20,
                                  ),
                                  elevation: 5.0,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.white,
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      title,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    items: <String>[
                                      'بارگیری',
                                      'تخلیه',
                                      'حمل یکسره',
                                    ].map(
                                      (String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (changedText) {
                                      setState(
                                        () {
                                          title = changedText;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
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
                            Column(
                              children: [
                                Container(
                                  height: 195,
                                  width: MediaQuery.of(context).size.width,
                                  child: GridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    crossAxisCount: 2,
                                    childAspectRatio: 3,
                                    children: <Widget>[
                                      Container(
                                        width: 160,
                                        alignment: Alignment.centerLeft,
                                        decoration: kBoxDecorationStyle,
                                        height: 50.0,
                                        child: TextField(
                                          controller: baskolController,
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
                                              Icons.arrow_forward_sharp,
                                              color: Colors.white,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            hintText: 'باسکول',
                                            hintStyle: kHintTextStyle,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 160,
                                        alignment: Alignment.centerLeft,
                                        decoration: kBoxDecorationStyle,
                                        height: 50.0,
                                        child: TextField(
                                          controller: shipContentController,
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
                                              Icons.arrow_forward_sharp,
                                              color: Colors.white,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            hintText: 'نوع بار کشتی',
                                            hintStyle: kHintTextStyle,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 160,
                                        alignment: Alignment.centerLeft,
                                        decoration: kBoxDecorationStyle,
                                        height: 50.0,
                                        child: TextField(
                                          controller: tonnageController,
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
                                              Icons.arrow_forward_sharp,
                                              color: Colors.white,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            hintText: 'تناژ',
                                            hintStyle: kHintTextStyle,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 160,
                                        alignment: Alignment.centerLeft,
                                        decoration: kBoxDecorationStyle,
                                        height: 50.0,
                                        child: TextField(
                                          controller: shipNameController,
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
                                              Icons.arrow_forward_sharp,
                                              color: Colors.white,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            hintText: 'نام کشتی',
                                            hintStyle: kHintTextStyle,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // Date Picker Widget
                                        width: 160.0,
                                        child: RaisedButton(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 2,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          color: Colors.white,
                                          elevation: 5.0,
                                          onPressed: () {
                                            setState(() {
                                              _selectDate();
                                              print(pickedDate);
                                            });
                                          },
                                          child: Text(
                                            'تاریخ ورود:\t$pickedDate',
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              color: Color(0xFF527DAA),
                                              letterSpacing: 1.5,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'OpenSans',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 160,
                                        child: RaisedButton(
                                          elevation: 5.0,
                                          onPressed: () {},
                                          padding: EdgeInsets.symmetric(
                                            vertical: 2,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          color: Colors.white,
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              resourceType,
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            items: <String>[
                                              'سیلو',
                                              'کانتینری',
                                              'انبار',
                                              'محوطه',
                                            ].map(
                                              (String value) {
                                                return new DropdownMenuItem<
                                                    String>(
                                                  value: value,
                                                  child: new Text(value),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (changedText) async {
                                              if (changedText == 'محوطه') {
                                                final http.Response
                                                    mohavateResponse =
                                                    await http.get(
                                                  'http://94.130.230.203:8585/resource/areas',
                                                  headers: {
                                                    'authorization':
                                                        loggedUser.token,
                                                  },
                                                );
                                                List<dynamic> areaha =
                                                    jsonDecode(
                                                        mohavateResponse.body);
                                                mohavateList.clear();
                                                mohavateMainMenuList.clear();
                                                for (int i = 0;
                                                    i < areaha.length;
                                                    i++) {
                                                  mohavateList.add(
                                                      MohavateClass(
                                                          id: areaha[i]['_id'],
                                                          name: areaha[i]
                                                              ['name']));
                                                }
                                                for (int i = 0;
                                                    i < mohavateList.length;
                                                    i++) {
                                                  mohavateMainMenuList.add(
                                                    MainWidget(
                                                      name:
                                                          mohavateList[i].name,
                                                      id: mohavateList[i].id,
                                                      icon: 'mohavate',
                                                    ),
                                                  );
                                                }
                                                print(areaha);
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            child:
                                                                Text('محوطه'),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children:
                                                                mohavateMainMenuList,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                              if (changedText == 'سیلو') {
                                                final http.Response
                                                    siloResponse =
                                                    await http.get(
                                                  'http://94.130.230.203:8585/resource/silos',
                                                  headers: {
                                                    'authorization':
                                                        loggedUser.token,
                                                  },
                                                );
                                                List<dynamic> siloha =
                                                    jsonDecode(
                                                        siloResponse.body);
                                                siloList.clear();
                                                siloMainMenuList.clear();
                                                for (int i = 0;
                                                    i < siloha.length;
                                                    i++) {
                                                  siloList.add(SiloClass(
                                                    temp: siloha[i]['temp'],
                                                    id: siloha[i]['_id'],
                                                    dateG: siloha[i]['dateG'],
                                                    dateS: siloha[i]['dateS'],
                                                    name: siloha[i]['name'],
                                                    dateK: siloha[i]['dateK'],
                                                    creationDate: siloha[i]
                                                        ['createdAt'],
                                                    apiCallDate: siloha[i]
                                                        ['updatedAt'],
                                                  ));
                                                }
                                                for (int i = 0;
                                                    i < siloList.length;
                                                    i++) {
                                                  siloMainMenuList.add(
                                                    MainWidget(
                                                      name: siloList[i].name,
                                                      id: siloList[i].id,
                                                      icon: 'silo',
                                                    ),
                                                  );
                                                }
                                                print(siloha);
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            child: Text('سیلو'),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children:
                                                                siloMainMenuList,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                              if (changedText == 'انبار') {
                                                final http.Response
                                                    anbarResponse =
                                                    await http.get(
                                                  'http://94.130.230.203:8585/resource/storages',
                                                  headers: {
                                                    'authorization':
                                                        loggedUser.token,
                                                  },
                                                );
                                                List<dynamic> anbarha =
                                                    jsonDecode(
                                                        anbarResponse.body);
                                                anbarList.clear();
                                                anbarMainMenuList.clear();
                                                for (int i = 0;
                                                    i < anbarha.length;
                                                    i++) {
                                                  anbarList.add(AnbarClass(
                                                      id: anbarha[i]['_id'],
                                                      name: anbarha[i]
                                                          ['name']));
                                                }
                                                for (int i = 0;
                                                    i < anbarList.length;
                                                    i++) {
                                                  anbarMainMenuList.add(
                                                    MainWidget(
                                                      name: anbarList[i].name,
                                                      id: anbarList[i].id,
                                                      icon: 'anbarlist',
                                                    ),
                                                  );
                                                }
                                                print(anbarha);
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                                'انبار ها'),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children:
                                                                anbarMainMenuList,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                              setState(
                                                () {
                                                  resourceType = changedText;
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 4.0,
                                    top: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            humanList.removeLast();
                                          });
                                        },
                                        child: Container(
                                          child: Icon(Icons.remove),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            humanList.add(HumanWidget());
                                          });
                                        },
                                        child: Container(
                                          child: Icon(Icons.add),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'نیروی انسانی',
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
                                Column(
                                  children: humanList,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 4.0,
                                    top: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            resourceList.removeLast();
                                          });
                                        },
                                        child: Container(
                                          child: Icon(Icons.remove),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            resourceList.add(ResourceWidget());
                                          });
                                        },
                                        child: Container(
                                          child: Icon(Icons.add),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '      تجهیزات',
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: resourceList,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 135,
                                    vertical: 20,
                                  ),
                                  child: RaisedButton(
                                    elevation: 5.0,
                                    onPressed: () async {
                                      List<String> temp = <String>[];
                                      for (int i = 0;
                                          i < humanList.length;
                                          i++) {
                                        for (int j = 0;
                                            j < int.parse(humanList[i].amount);
                                            j++) {
                                          temp.add(humanList[i].human);
                                        }
                                      }
                                      humans = temp.join(',');
                                      temp.clear();
                                      for (int i = 0;
                                          i < resourceList.length;
                                          i++) {
                                        temp.add(resourceList[i].id);
                                      }
                                      vehicleids = temp.join(',');
                                      print(title);
                                      print(shipContentController.text);
                                      print(shipNameController.text);
                                      print(tonnageController.text);
                                      print(baskolController.text);
                                      print(resourceType);
                                      print(resourceName);
                                      print(resourcePart);
                                      print(vehicleids);
                                      print(humans);
                                      dynamic data = await getAmaliyatData(
                                        context,
                                        title,
                                        shipContentController.text,
                                        shipNameController.text,
                                        tonnageController.text,
                                        baskolController.text,
                                        resourceType,
                                        resourceName,
                                        resourcePart,
                                        vehicleids,
                                        humans,
                                      );
                                      print(data);
                                    },
                                    padding: EdgeInsets.all(15.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    color: Colors.white,
                                    child: Icon(Icons.send),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
            ],
          ),
        ),
      ),
    );
  }
}

// Resources Elements Details Page Widget!
class ElementWidget extends StatefulWidget {
  ElementWidget({this.name, this.id});
  final String name;
  final String id;

  @override
  _ElementWidgetState createState() => _ElementWidgetState();
}

class _ElementWidgetState extends State<ElementWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: isChecked,
        title: Text(
          widget.name,
          textDirection: TextDirection.rtl,
        ),
        onChanged: (newBool) {
          setState(() {
            isChecked = newBool;

            if (newBool == true) {
              tempSelectedElements.add(widget.id);
            }
            if (newBool == false) {
              tempSelectedElements.remove(widget.id);
            }
            print(tempSelectedElements);
          });
        });
  }
}

// Resources Elements Main Page Widget!
class MainWidget extends StatefulWidget {
  MainWidget({this.name, this.id, this.icon});
  final String name;
  final String id;
  final String icon;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: Container(
          child: Image.asset('assets/logos/${widget.icon}.png'),
          width: 40,
          height: 40,
        ),
        title: Text(
          widget.name,
          textDirection: TextDirection.rtl,
        ),
        onTap: () async {
          if (widget.icon == 'anbarlist') {
            resourceName = widget.id;
            print(resourceName);
            final http.Response anbarResponse = await http.post(
              'http://94.130.230.203:8585/resource/fullstorage',
              headers: {
                'authorization': loggedUser.token,
              },
              body: {
                'storage': resourceName,
                'all': '1',
                'free': '0',
              },
            );
            List<dynamic> anbars = jsonDecode(anbarResponse.body);
            print(anbars);
            anbarSecondaryMenuList.clear();
            anbarElementsList.clear();
            tempSelectedElements.clear();
            Navigator.pop(context);

            for (int i = 0; i < anbars.length; i++) {
              anbarElementsList.add(AnbarElements(
                id: anbars[i]['_id'],
                name: anbars[i]['name'],
                free: anbars[i]['free'],
                contenttype: anbars[i]['contenttype'],
                length: anbars[i]['length'],
                width: anbars[i]['width'],
              ));
            }
            for (int i = 0; i < anbarElementsList.length; i++) {
              if (title == 'تخلیه' && anbarElementsList[i].free == true) {
                anbarSecondaryMenuList.add(
                  ElementWidget(
                    name: anbarElementsList[i].name,
                    id: anbarElementsList[i].id,
                  ),
                );
              } else if (title == 'بارگیری' &&
                  anbarElementsList[i].free == false) {
                anbarSecondaryMenuList.add(
                  ElementWidget(
                    name: anbarElementsList[i].name,
                    id: anbarElementsList[i].id,
                  ),
                );
              } else if (title == 'حمل یکسره') {
                anbarSecondaryMenuList.add(
                  ElementWidget(
                    name: anbarElementsList[i].name,
                    id: anbarElementsList[i].id,
                  ),
                );
              }
            }
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('انبار ها'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: anbarSecondaryMenuList,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          resourcePart = tempSelectedElements.join(",");
                          print(resourcePart);
                          print(resourceName);
                        },
                        child: Text('ارسال'),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (widget.icon == 'mohavate') {
            resourceName = widget.id;
            print(resourceName);
            final http.Response mohavateResponse = await http.post(
              'http://94.130.230.203:8585/resource/fullarea',
              headers: {
                'authorization': loggedUser.token,
              },
              body: {
                'area': resourceName,
                'all': '1',
                'free': '0',
              },
            );
            List<dynamic> mohavates = jsonDecode(mohavateResponse.body);
            print(mohavates);
            mohavateSecondaryMenuList.clear();
            mohavateElementsList.clear();
            tempSelectedElements.clear();
            Navigator.pop(context);

            for (int i = 0; i < mohavates.length; i++) {
              mohavateElementsList.add(MohavateElement(
                temp: mohavates[i]['temp'],
                id: mohavates[i]['_id'],
                tonnage: mohavates[i]['tonnage'],
                contenttype: mohavates[i]['contenttype'],
                name: mohavates[i]['name'],
                free: mohavates[i]['free'],
                freespace: mohavates[i]['freespace'],
              ));
            }
            for (int i = 0; i < mohavateElementsList.length; i++) {
              if (title == 'تخلیه' && mohavateElementsList[i].free == true) {
                mohavateSecondaryMenuList.add(
                  ElementWidget(
                    name: mohavateElementsList[i].name,
                    id: mohavateElementsList[i].id,
                  ),
                );
              } else if (title == 'بارگیری' &&
                  mohavateElementsList[i].free == false) {
                mohavateSecondaryMenuList.add(
                  ElementWidget(
                    name: mohavateElementsList[i].name,
                    id: mohavateElementsList[i].id,
                  ),
                );
              } else if (title == 'حمل یکسره') {
                mohavateSecondaryMenuList.add(
                  ElementWidget(
                    name: mohavateElementsList[i].name,
                    id: mohavateElementsList[i].id,
                  ),
                );
              }
            }
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('محوطه ها'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: mohavateSecondaryMenuList,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          resourcePart = tempSelectedElements.join(",");
                          print(resourcePart);
                          print(resourceName);
                        },
                        child: Text('ارسال'),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (widget.icon == 'silo') {
            resourceName = widget.id;
            print(resourceName);
            final http.Response siloResponse = await http.post(
              'http://94.130.230.203:8585/resource/fullsilo',
              headers: {
                'authorization': loggedUser.token,
              },
              body: {
                'silo': resourceName,
                'all': '1',
                'free': '0',
              },
            );
            List<dynamic> silos = jsonDecode(siloResponse.body);
            print(silos);
            siloSecondaryMenuList.clear();
            siloElementsList.clear();
            tempSelectedElements.clear();
            Navigator.pop(context);

            for (int i = 0; i < silos.length; i++) {
              siloElementsList.add(SiloElements(
                id: silos[i]['_id'],
                name: silos[i]['name'],
                free: silos[i]['free'],
                contenttype: silos[i]['contenttype'],
                tonnage: silos[i]['tonnage'],
                freespace: silos[i]['freespace'],
              ));
            }
            for (int i = 0; i < siloElementsList.length; i++) {
              if (title == 'تخلیه' && siloElementsList[i].free == true) {
                siloSecondaryMenuList.add(
                  ElementWidget(
                    name: siloElementsList[i].name,
                    id: siloElementsList[i].id,
                  ),
                );
              } else if (title == 'بارگیری' &&
                  siloElementsList[i].free == false) {
                siloSecondaryMenuList.add(
                  ElementWidget(
                    name: siloElementsList[i].name,
                    id: siloElementsList[i].id,
                  ),
                );
              } else if (title == 'حمل یکسره') {
                siloSecondaryMenuList.add(
                  ElementWidget(
                    name: siloElementsList[i].name,
                    id: siloElementsList[i].id,
                  ),
                );
              }
            }
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('سیلو ها'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: siloSecondaryMenuList,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          resourcePart = tempSelectedElements.join(",");
                          print(resourcePart);
                          print(resourceName);
                        },
                        child: Text('ارسال'),
                      )
                    ],
                  ),
                );
              },
            );
          }
        });
  }
}

// Human Widget
// ignore: must_be_immutable
class HumanWidget extends StatefulWidget {
  String amount = '1';
  String human;
  @override
  _HumanWidgetState createState() => _HumanWidgetState();
}

class _HumanWidgetState extends State<HumanWidget> {
  String hint = 'نوع نیرو';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(3),
          crossAxisSpacing: 50,
          childAspectRatio: 3,
          crossAxisCount: 2,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 50.0,
              child: TextField(
                onChanged: (newText) {
                  widget.amount = newText;
                },
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
            DropdownButton<String>(
              hint: Text(
                hint,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14),
              ),
              items: <String>[
                'بار شمار',
                'کارگر',
                'نگهبان',
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
                    hint = x;
                    widget.human = x;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Resource Widget
// ignore: must_be_immutable
class ResourceWidget extends StatefulWidget {
  String id;
  @override
  _ResourceWidgetState createState() => _ResourceWidgetState();
}

class _ResourceWidgetState extends State<ResourceWidget> {
  String hint = vehiclesGlobalList.length == 0
      ? 'موردی برای انتخاب وجود ندارد'
      : 'نوع تجهیزات';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 140,
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: DropdownButton<String>(
          hint: Text(
            hint,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 14),
          ),
          items: dropDownList.map(
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
                hint = x;
                widget.id = vehiclesGlobalList[dropDownList.indexOf(x)].id;
                print(vehiclesGlobalList[dropDownList.indexOf(x)].id);
                print(vehiclesGlobalList[dropDownList.indexOf(x)].name);
              },
            );
          },
        ),
      ),
    );
  }
}
