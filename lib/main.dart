import 'package:ekrut_test/controller/home_controller.dart';
import 'package:ekrut_test/controller/role_controller.dart';
import 'package:ekrut_test/view/pages/create_role_page.dart';
import 'package:ekrut_test/view/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RoleProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(color: Colors.black))),
        // home: const HomePage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/create_role': (context) => const CreateRolePage()
        },
      ),
    );
  }
}
