import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample/screens/for_you_screen.dart';
import 'package:sample/screens/trending_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 0), () async {
    // await for the Firebase initialization to occur
    // FirebaseApp app = await Firebase.initializeApp();
    // });

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle blackStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Southampton',
              style: blackStyle,
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Text(
                  'For you',
                  style: blackStyle,
                ),
                Text(
                  'Trending',
                  style: blackStyle,
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ForYouScreen(),
              TrendingScreen(),
            ],
          )),
    );
  }
}
