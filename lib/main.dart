import 'package:firebase/layout/news_app_layout.dart';
import 'package:firebase/login/login_screen.dart';
import 'package:firebase/provider.dart';
import 'package:firebase/remote/cache_helper.dart';
import 'package:firebase/remote/dio_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getDate(key: "isDark")??false;
  runApp(
      ChangeNotifierProvider<MyProvider>(
          create: (_) => MyProvider()..changeThemeMode(fromShared: isDark),
     child: MyApp(isDark))
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;

     const MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (BuildContext context, value, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark),
            color: Colors.white,
            elevation: 0,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.deepOrange),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.deepOrange,
        ),
        darkTheme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: HexColor("333739"),
          appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor("333739"),
                statusBarIconBrightness: Brightness.light),
            backgroundColor: HexColor("333739"),
            elevation: 0,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: HexColor("333739"),
              type: BottomNavigationBarType.fixed,
              elevation: 20,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.deepOrange),
          scaffoldBackgroundColor: HexColor("333739"),
          primarySwatch: Colors.deepOrange,
        ),
        themeMode: value.isDark ? ThemeMode.dark : ThemeMode.light,
        home:  const Directionality(textDirection: TextDirection.rtl,child: NewsLayout())),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
