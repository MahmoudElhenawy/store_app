import 'dart:async';
import 'package:flutter/material.dart';
import 'package:store_app/screens/login_view.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; //  يتحكم في مدة وتوقيت الأنيميشن
  late Animation<double> _animation; //  يتحكم في تأثير الأنيميشن

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2), //  مدة الأنيميشن (ثانيتين)
      vsync:
          this, //  تحسين الأداء بمنع تشغيل الأنيميشن عندما لا يكون على الشاشة
    );

    _animation = CurvedAnimation(
      parent: _controller, //  ربط الأنيميشن بالمتحكم
      curve: Curves.easeInOut, //  تأثير ناعم للأنيميشن (البداية والنهاية بطيئة)
    );

    _controller.forward(); //  تشغيل الأنيميشن فورًا عند فتح الصفحة
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginView.id);
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // تحرير الموارد بعد الانتهاء من الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEB423F),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _animation, // ربط اللوجو بالأنيميشن لجعله يكبر تدريجيًا
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                FadeTransition(
                  opacity: _animation, // ظهور النص تدريجيًا مع الأنيميشن
                  child: Text(
                    "Store App",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
