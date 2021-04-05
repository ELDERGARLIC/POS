import 'package:flutter/material.dart';
import 'package:corpapp/screens/home_page.dart';
import 'package:corpapp/screens/login_screen.dart';

import 'screens/home_page/modiriyat.dart';
import 'screens/login_screen.dart';
import 'screens/under_const.dart';
import 'screens/home_page/modiriyat/sokhan.dart';
import 'screens/home_page/amaliyat.dart';
import 'screens/home_page/ertebat_ba_modir.dart';
import 'screens/splash.dart';

import 'screens/home_page/anbarosilo.dart';
import 'screens/home_page/anbarosilo/anbarha.dart';
import 'screens/home_page/anbarosilo/eskele.dart';
import 'screens/home_page/anbarosilo/mohavate.dart';
import 'screens/home_page/anbarosilo/siloha.dart';

import 'screens/home_page/anbarosilo/eskele/eskele_a.dart';
import 'screens/home_page/anbarosilo/eskele/eskele_b.dart';
import 'screens/home_page/anbarosilo/eskele/eskele_c.dart';
import 'screens/home_page/anbarosilo/eskele/eskele_d.dart';
import 'screens/home_page/anbarosilo/eskele/eskele_e.dart';

import 'screens/home_page/anbarosilo/anbarha/anbare1.dart';
import 'screens/home_page/anbarosilo/anbarha/anbare2.dart';
import 'screens/home_page/anbarosilo/anbarha/anbare3.dart';
import 'screens/home_page/anbarosilo/anbarha/anbare4.dart';

import 'screens/home_page/anbarosilo/siloha/mohtaviyatesilo.dart';

import 'screens/home_page/omran.dart';
import 'screens/home_page/profile.dart';
import 'screens/home_page/tajhizati.dart';
import 'screens/morekhasi.dart';

import 'screens/liste_darkhast/liste_darkhast_page.dart';

import 'screens/testapi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS',
      initialRoute: '/splash',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/modiriyat': (context) => Modiriyat(),
        '/under': (context) => UnderConst(),
        '/sokhan': (context) => Sokhan(),
        '/splash': (context) => Splash(),
        '/anbarosilo': (context) => AnbaroSilo(),
        '/anbarha': (context) => Anbarha(),
        '/eskele': (context) => Eskele(),
        '/mohavate': (context) => Mohavate(),
        '/siloha': (context) => Siloha(),
        '/eskeleA': (context) => EskeleA(),
        '/eskeleB': (context) => EskeleB(),
        '/eskeleC': (context) => EskeleC(),
        '/eskeleD': (context) => EskeleD(),
        '/eskeleE': (context) => EskeleE(),
        '/anbare1': (context) => Anbare1(),
        '/anbare2': (context) => Anbare2(),
        '/anbare3': (context) => Anbare3(),
        '/anbare4': (context) => Anbare4(),
        '/mohtaviyatesiloha': (context) => MohtaviyateSiloha(),
        '/omran': (context) => Omran(),
        '/listeDarkhast': (context) => ListeDarkhastPage(),
        '/profile': (context) => Profile(),
        '/morekhasi': (context) => Morekhasi(),
        '/amaliyat': (context) => Amaliyat(),
        '/ertebat': (context) => ErtebatBaModir(),
        '/tajhizati': (context) => Tajhizati(),
        '/test': (context) => TestAPI(),
      },
    );
  }
}
