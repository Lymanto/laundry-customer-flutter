import 'package:customer/pages/add_review_screen.dart';
import 'package:customer/pages/detail_history_screen.dart';
import 'package:customer/pages/detail_screen.dart';
import 'package:customer/pages/edit_profile.dart';
import 'package:customer/pages/introduction_screen.dart';
import 'package:customer/pages/login_screen.dart';
import 'package:customer/pages/home/main_screen.dart';
import 'package:customer/pages/order_detail_screen.dart';
import 'package:customer/pages/order_screen.dart';
import 'package:customer/pages/promo_screen.dart';
import 'package:customer/pages/register_screen.dart';
import 'package:customer/pages/splash_screen.dart';
import 'package:customer/pages/success_screen.dart';
import 'package:customer/providers/auth_provider.dart';
import 'package:customer/providers/checkout_provider.dart';
import 'package:customer/providers/history_provider.dart';
import 'package:customer/providers/promo_provider.dart';
import 'package:customer/providers/review_provider.dart';
import 'package:customer/providers/store_provide.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => StoreProvider()),
        ChangeNotifierProvider(create: (context) => CheckoutProvider()),
        ChangeNotifierProvider(create: (context) => HistoryProvider()),
        ChangeNotifierProvider(create: (context) => PromoProvider()),
        ChangeNotifierProvider(create: (context) => ReviewProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/introduction': (context) => const IntroductionScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/main': (context) => const MainScreen(),
          '/add-review': (context) => const AddReviewScreen(),
          '/success': (context) => const SuccessScreen(),
        },
      ),
    );
  }
}
