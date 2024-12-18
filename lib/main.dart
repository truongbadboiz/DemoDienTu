import 'package:appdientune/common/utils/environment.dart';
import 'package:appdientune/src/auth/controllers/password_notifier.dart';
import 'package:appdientune/src/categories/controllers/category_notifier.dart';
import 'package:appdientune/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:appdientune/src/home/controllers/home_tab_notifier.dart';
import 'package:appdientune/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:appdientune/src/products/controllers/colors_sizes_notifier.dart';
import 'package:appdientune/src/products/controllers/product_notifiler.dart';
import 'package:appdientune/src/splashscreen/views/splashscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'common/utils/app_routes.dart';
import 'common/utils/kstrings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // load the correct enviroment
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
      ChangeNotifierProvider(create: (_) => TabIndexNotifier()),
      ChangeNotifierProvider(create: (_) => CategoryNotifier()),
      ChangeNotifierProvider(create: (_) => HomeTableNotifier()),
      ChangeNotifierProvider(create: (_) => ProductNotifier()),
      ChangeNotifierProvider(create: (_) => ColorsSizesNotifier()),
      ChangeNotifierProvider(create: (_) => PasswordNotifier()),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize, // or ScreenUtil.document
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router (
      debugShowCheckedModeBanner: false,
      title: AppText.kAppName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
          routerConfig: router,
    );
  },
     child: const SplashScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
               Text(
              Environment.apiKey
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
