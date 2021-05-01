import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Sokhan extends StatefulWidget {
  @override
  _SokhanState createState() => _SokhanState();
}

class _SokhanState extends State<Sokhan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'سخن مدیرعامل',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.asset('assets/logos/modir.jpg'),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 400,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'شرکت پدید آوران امید ساحل بعنوان بزرگ ترین اپراتور بندری در شمال کشور، با هدف ارائه خدمات بارگیری و تخلیه و انبارداری در سال 1392 تاسیس گردیده و در این راستا خود را ملزم به شناسایی کلیه الزامات ملی و بین المللی مربوطه و و تطابق با آنها خصوصا الزامات سیستم های مدیریت کیفیت (ISO9001-2015) ، زیست محیطی (ISO14001-2014) و ایمنی و بهداشت (ISO45001-2018) دانسته و در این جهت خط مشی خود را به شرح زیر بیان می نماید :\n1- چابک سازی سیستم در راستای توسعه و بهبود سطح کمی و کیفی خدمات \n2- شناسایی دانش وتکنولوژی های بروز دنیا در زمینه های کاری و استفاده صحیح از آن ها \n3- توسعه نرم افزاری و مکانیزه شدن امور و فرآیندهای شرکت \n4- تلاش در بکارگیری نیروی متخصص و افزایش بهره وری نیروی انسانی در کليه سطوح \n5- افزایش سطح بهداشت و ایمنی در بنادر جهت پیشگیری از حوادث و صدمات انسانی به منظور کاهش یا کنترل خطرات و ریسک آنها \n6- رعایت اصول حفاظت محیط زیست و تلاش برای پیشگیری از آلودگی های ‌زیست محیطی در جهت مدیریت و بهینه‌سازی مصرف منابع \nاین خط مشی به کلیه پرسنل موسسه ابلاغ گردیده و مدیریت ارشد موسسه و همچنین کليه پرسنل موسسه خود را متعهد به اجرای دقيق مفاد اين خط مشی در کلیه امور و بهبود مداوم عملکرد خود در این راستا خواهند دانست.',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 11,
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
