import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/splash_screen.dart'; // ✅ استدعاء شاشة البداية
import 'package:store_app/screens/login_view.dart';
import 'package:store_app/screens/signup_view.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';
import 'package:provider/provider.dart';
import 'package:store_app/services/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ✅ تهيئة Firebase

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: StoreApp(),
    ),
  );
}

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => SplashScreen(), // ✅ جعلها الصفحة الأساسية
        LoginView.id: (context) => LoginView(),
        HomePage.id: (context) => HomePage(),
        SignupView.id: (context) => SignupView(),
      },
      initialRoute: SplashScreen.id, // ✅ تحديد شاشة البداية
      onGenerateRoute: (settings) {
        if (settings.name == UpdateProductPage.id) {
          if (settings.arguments is ProductModel) {
            final product = settings.arguments as ProductModel;
            return MaterialPageRoute(
              builder: (context) => UpdateProductPage(product: product),
            );
          } else {
            return _errorRoute();
          }
        }
        return _errorRoute();
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Page not found!'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
