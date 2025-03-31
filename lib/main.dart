import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'app/common/theme/app_theme.dart';
import 'app/globals/global_keys.dart' as global;
import 'app/globals/providers.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // /// for initialize firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Right after creation client connects to the backend and authenticates the user.
  // You can set `options: StreamVideoOptions(autoConnect: false)` if you want to disable auto-connect.

  defaultInkWellSplashColor = Colors.transparent;
  defaultInkWellHighlightColor = Colors.transparent;

  await initialize();

  // await Firebase.initializeApp();

  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };

  // /// Get FCM Token
  // fcmToken = (await FirebaseMessaging.instance.getToken())!;
  // log("FCM Token :: $fcmToken");
  // FirebaseMessaging.onBackgroundMessage(backgroundNotification);

  // Called when the app is in foreground (open)
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   await backgroundNotification(message);
  // });

  // Initialize GetStorage
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
        (value) => runApp(const AIMAApp()),
  );
}

class AIMAApp extends StatelessWidget {
  const AIMAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.getAllProviders(),
      child: MaterialApp(
        title: "Aun Pets",
        debugShowCheckedModeBanner: false,
        navigatorObservers: [global.routeObserver], // Add the routeObserver here
        theme: MyMaterialTheme.lightTheme,
        navigatorKey: navigatorKey,
        onGenerateRoute: RouteGenerator().generateRoute,
        initialRoute: Routes.SPLASH,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          );
        },
      ),
    );
  }
}

class AppNavigatorContext {
  static BuildContext? get context => navigatorKey.currentContext;

  static NavigatorState? get navigator => navigatorKey.currentState;
}
