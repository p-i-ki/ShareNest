import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_nest/core/routes/names.dart';
import 'package:share_nest/features/auth/pages/otp_page.dart';
import 'package:share_nest/features/auth/pages/sign_in_page.dart';
import 'package:share_nest/features/home/pages/add_product.dart';
import 'package:share_nest/features/home/pages/home_page.dart';
import 'package:share_nest/features/home/pages/product_detail_page.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}

class AppPages {
  static List<PageEntity> route() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL_ROUTE,
        page: const SignInPage(),
      ),
      PageEntity(
        route: AppRoutes.OTP,
        page: const OtpPage(),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
      ),
      PageEntity(
        route: AppRoutes.PRODUCT_DETAIL,
        page: const ProductDetailPage(),
      ),
      PageEntity(
        route: AppRoutes.ADD_PRODUCT,
        page: const AddProduct(),
      ),
      // PageEntity(
      //   route: AppRoutes.Course_video_play,
      //   page: const VideoPlaySection(),
      //   bloc: BlocProvider(create: (_) => getIt<CourseSectionBloc>()),
      // ),
    ];
  }

//storing all the blocs at one place..
  static List<BlocProvider> allBlocProviders(BuildContext context) {
    List<BlocProvider> blocProviders = <BlocProvider>[];
    for (var pageEntity in route()) {
      if (pageEntity.bloc != null) {
        blocProviders.add(pageEntity.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    if (settings.name != null) {
      var result = route().where((element) => settings.name == element.route);
      if (result.isNotEmpty) {
        print('Valid route name ${settings.name}'); // Debugging line
        try {
          // final storageServices = GetIt.instance<StorageServices>();
          // // print("StorageServices instance accessed"); // Debugging line

          // bool deviceFirstOpen = storageServices.getDeviceFirstOpen();
          // bool isLoggedIn = storageServices.getIsLoggedIn();
          // print("Device first open  $deviceFirstOpen");
          // print("User Logged in  $isLoggedIn");
          // if (settings.name == AppRoutes.GET_STARTED &&
          //     deviceFirstOpen &&
          //     isLoggedIn) {
          //   return MaterialPageRoute(
          //     builder: (_) =>
          //         const HomeScreen(), // Replace with actual home page
          //   );
          // }
          // print(result.first.page);
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        } catch (e) {
          print('Error accessing StorageServices: $e');
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text(
                  'Initialization Error',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
          );
        }
      }
    }
    print('Invalid route name ${settings.name}');
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(
            'Page Does Not Exist',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
