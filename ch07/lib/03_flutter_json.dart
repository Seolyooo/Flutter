/*
*  설유진
*  2025/10/29
*  Future json 처리
* */

import 'dart:convert';

import 'package:flutter/material.dart';

class Todo{
  int id;
  String title;
  bool complete;

  //todo 여기 몰라
  //기본 생성자 ,이름이 있는 매개변수
  Todo({required this.id, required this.title, required this.complete});

  //factory 생성자 , json객체를 todo 객체로 변환
  factory Todo.fromJson(Map<String,dynamic> json){

    return Todo(
      id:json['id'],
      title:json['title'],
      complete:json['complete'],
    );
  }

  //Todo 객체 -> json 변환
  Map<String,dynamic> toJson(){
    return{
      "id":id,
      "title":title,
      "complete":complete,
    };
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, complete: $complete}';
  }


}



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('03.Future json 처리 실습'),),
        body: JsonScreen(),
      ),
    );
  }
}

class JsonScreen extends StatefulWidget{
  const JsonScreen({super.key});

  @override
  State<StatefulWidget> createState() => _JsonScreenState();

}

class _JsonScreenState extends State<JsonScreen>{

  //Json 문자열
  final String jsonString='''
   {
   "id" : 1,
   "title" : "flutter Json 실습",
   "complete" : false
   }
  ''';

  Map<String, dynamic>? jsonData;
  Todo? todo;
  String? encodedJson;

  //json 문자열 -> todo 객체 변환(Decoding)
  void decodingTodo(){
    setState(() {
      Map<String,dynamic> todoMap = jsonDecode(jsonString);
      todo = Todo.fromJson(todoMap);
    });
  }


  //todo -> json 문자열 객체 변환(Encoding)
  void encodingTodo(){
    setState(() {
      encodedJson = jsonEncode(todo?.toJson());
    });

  }

  //json 문자열 -> map 객체 변환(Parsing)
  void parsingTodo(){
  setState(() {
    jsonData = jsonDecode(jsonString);

  });

  }






  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Todo: ${jsonData.toString()}'),
            ElevatedButton(onPressed: parsingTodo, child: const Text('Json parsing')),
            const SizedBox(height: 20,),
            Text('Todo: ${todo.toString()}'),
            ElevatedButton(onPressed: decodingTodo, child: const Text('Json Decode')),
            const SizedBox(height: 20,),
            Text('User:$encodedJson '),
            ElevatedButton(onPressed: encodingTodo, child: const Text('Json Encode')),
            const SizedBox(height: 20,),
          ],
        ),
    );
  }
}

