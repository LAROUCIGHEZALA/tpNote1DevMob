import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';

import 'note.dart';

void main()  {

  runApp( MyApp());



}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/note': (context) => note(),

      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Image.asset('images/inde.png'),
            Text('prise de note',style: TextStyle(fontSize: 30,color:Colors.pink),)
          ],

        ),

        nextScreen: new _MyHomePageState(),
      splashIconSize: 250,
      duration:4000,
      splashTransition: SplashTransition.scaleTransition,
    );




  }
}

class _MyHomePageState extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    return Scaffold(



      appBar: AppBar(

        title: Text("welecom to my page"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) {
              Navigator.pushNamed(context, value.toString());
            },
            itemBuilder: (BuildContext bc) {
              return const [
                PopupMenuItem(
                  child: Text("ajouter une note"),
                  value: '/note',
                ),

               ];},)],

      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
