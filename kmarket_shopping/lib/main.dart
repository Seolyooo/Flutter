import 'package:flutter/material.dart';
import 'package:kmarket_shopping/providers/auth_provider.dart';
import 'package:kmarket_shopping/screens/main/main_tab.dart';
import 'package:kmarket_shopping/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(MyApp());


  runApp(
    //최초 앱 실행할때 로그인 엽 체크 authprovider
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => AuthProvider()),

      ],
      child: MyApp(),
    )

  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SpalshScreen(),
    );
  }


}