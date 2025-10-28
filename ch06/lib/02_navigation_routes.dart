/*
  날짜 : 2025/10/28
  이름 : 설유진
  내용 : 6장 Navigation 기본 실습
 */
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/first',



        routes: {
          '/first': (context)=> const FirstScreen(),
          '/second': (context)=> const SecondScreen(),
          '/third': (context)=> const ThirdScreen(),
        },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('01.route 네비게이션 기본 실습')),
        body: Column(
          children: [
            const Text('First Screen', style: TextStyle(fontSize: 36),),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context,'/second');

                },
                child: const Text('Second Screen 이동')
            )
          ],
        )
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('02. 네비게이션  route 기본 실습')),
        body: Column(
          children: [
            const Text('Second Screen', style: TextStyle(fontSize: 36),),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  // 현재 화면 위젯 스텍 제거, 뒤로가기
                    Navigator.pop(context);                },
                child: const Text('First Screen 이동')
            ),
            ElevatedButton(
                onPressed: (){
                  // 현재 화면 위젯 스텍 제거, 뒤로가기
                  Navigator.pushNamed(context, '/third');

                },
                child: const Text('Third Screen 이동')
            )
          ],
        )
    );
  }
}


class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('01.Flutter 네비게이션 기본 실습')),
        body: Column(
          children: [
            const Text('Third Screen', style: TextStyle(fontSize: 36),),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Second Screen 이동')
            )
          ],
        )
    );
  }
}
