import 'package:get/get.dart';
import 'package:yoked/App/Home/View/home_view.dart';
import 'package:yoked/App/Home/View/product_discription_view.dart';
import 'package:yoked/App/Splash/View/splash_view.dart';
import 'package:yoked/App/Splash/ViewModel/splash_view_model.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splashView,
      page: () => SplashView(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashViewModel>(
          () => SplashViewModel(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.homeView,
      page: () => HomeView(),
      transition: Transition.fadeIn,
      // binding: BindingsBuilder(() {
      //   Get.lazyPut<SplashViewModel>(
      //     () => SplashViewModel(),
      //   );
      // }),
    ),
    GetPage(
      name: AppRoutes.productDiscriptionView,
      page: () => ProductDiscriptionView(),
      transition: Transition.fadeIn,
      // binding: BindingsBuilder(() {
      //   Get.lazyPut<SplashViewModel>(
      //     () => SplashViewModel(),
      //   );
      // }),
    ),
  ];
}
