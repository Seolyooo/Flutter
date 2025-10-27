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
        body: StatefulTest(),
      ),
    );
  }
}
class StatefulTest extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _StatefulTestState();
}


//Stateful 위젯은 상태를 통해 화면을 갱신하는 동작 위젯
class _StatefulTestState extends State<StatefulTest>{

  //상태 속성
  int counter = 0;

  void _increment(){

    //상태를 업데이트하고 build 재호출
    setState(() {
      counter++;
    });
    print('counter : $counter');
  }


  @override
  Widget build(BuildContext context) {

    print('build...');

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

