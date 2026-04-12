import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/features/auth/login_screen.dart';
import 'package:fresh_box/features/auth/sing_up_screen.dart';
import 'package:fresh_box/features/cart/cart_screen.dart';
import 'package:fresh_box/features/home/favorites_screen.dart';
import 'package:fresh_box/features/home/home_screen.dart';
import 'package:fresh_box/features/home/orders_screen.dart';
import 'package:fresh_box/features/home/popular_screen.dart';
import 'package:fresh_box/features/home/product_details_screen.dart';
import 'package:fresh_box/features/main/main_screen.dart';
import 'package:fresh_box/features/notifcations/notifications_screen.dart';
import 'package:fresh_box/features/onboarding/onboarding_screen.dart';
import 'package:fresh_box/features/payment/payment_failed_screen.dart';
import 'package:fresh_box/features/payment/payment_screen.dart';
import 'package:fresh_box/features/payment/payment_successful_screen.dart';
import 'package:fresh_box/features/search/search_screen.dart';
import 'package:fresh_box/features/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = <GetPage<dynamic>>[
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.singUp, page: () => SingUpScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(name: AppRoutes.main, page: () => MainScreen()),
    GetPage(name: AppRoutes.orders, page: () => OrdersScreen()),
    GetPage(name: AppRoutes.favorites, page: () => FavoritesScreen()),
    GetPage(name: AppRoutes.notifications, page: () => NotificationsScreen()),
    GetPage(name: AppRoutes.cart, page: () => CartScreen()),
    GetPage(name: AppRoutes.popular, page: () => PopularScreen()),
    GetPage(name: AppRoutes.productDetails, page: () => ProductDetailsScreen()),
    GetPage(name: AppRoutes.payment, page: () => PaymentScreen()),
    GetPage(name: AppRoutes.paymentSuccessful, page: () => PaymentSuccessfulScreen()),
    GetPage(name: AppRoutes.paymentFailed, page: () => PaymentFailedScreen()),
    GetPage(name: AppRoutes.search, page: () => SearchScreen()),
  ];
}
