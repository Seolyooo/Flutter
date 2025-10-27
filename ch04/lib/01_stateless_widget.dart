/*
* 이름 설유진 
* 2025/10/27
* Stateless 정적 위셋 싯습
*/
import 'package:flutter/material.dart';


void main(){

  runApp(MyApp());
  
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('01.Stateless 위젯 실습'),
        ),
        body: StatelessTest(),
      ),
    );
  }
}

//StatelessWidget 은 상태(속성)가 변경되어도 화면이 다시 갱신되지 않음
class StatelessTest extends StatelessWidget{
  StatelessTest({super.key});

  //속성이 변경되더라도 해당 속성을 참조하는 text 위젯을 재빌드 되지 않음
  int counter = 0;

  void _increment(){
    counter++;
    print('counter : $counter');
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('카운터 : $counter',style: TextStyle(fontSize: 24),),
        ElevatedButton(
            onPressed: _increment,
            child: const Text('카운트')
        )
      ],
    );
  }



}

