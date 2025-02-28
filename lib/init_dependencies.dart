import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class Global {
  static Future<void> init() async {
    // _initAuth();
    // // Initialize and register StorageServices with Get It
    // final storageServices = await StorageServices().init();
    // getIt.registerSingleton<StorageServices>(storageServices);
    // // Register Dio with base options
    // getIt.registerSingleton<Dio>(Dio(BaseOptions(
    //   baseUrl: AppConstants.SERVER_API_URL,
    //   connectTimeout: const Duration(seconds: 200),
    //   receiveTimeout: const Duration(seconds: 200),
    //   headers: {},
    //   contentType: "application/json; charset=utf-8",
    //   responseType: ResponseType.json,
    // )));
    // // Register HttpUtil with the injected Dio instance
    // getIt.registerLazySingleton<HttpUtil>(() => HttpUtil(dio: getIt<Dio>()));
    // // For memory optimization we need to add only one initialization , either for student or instructor..
    // _initStudentHomePage();
    // _initStudentCourseSection();
    // _initCreateCourse();
  }
}
