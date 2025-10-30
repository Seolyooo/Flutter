
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmarket_shopping/screens/main/main_tab.dart';

class SpalshScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SpalshScreenState();

}


class _SpalshScreenState extends State<SpalshScreen> {
  
  @override
  void initState() {
    super.initState();
    
    //3초후 메인 탭 이동
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MainTabScreen())
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png'),
              const SizedBox(height: 20,),
              CircularProgressIndicator()
            ],
          ),
        ),

      ),
    );
  }

}