import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_nest/core/app_constants/app_const.dart';
import 'package:share_nest/core/routes/pages.dart';
import 'package:share_nest/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(AppConst.dWidth, AppConst.dHeight),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ShareNest',
            theme: ThemeData(
              // fontFamily: 'myfontsdroid',
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(253, 245, 231, 1),
              ),
              useMaterial3: true,
            ),
            onGenerateRoute: (settings) => AppPages.generateRoute(settings),
          );
        });
  }
}
