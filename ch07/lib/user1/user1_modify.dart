
import 'dart:math';

import 'package:ch07/user1/user1.dart';
import 'package:ch07/user1/user1_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User1Modify extends StatefulWidget {
  final String userid;

  const User1Modify({super.key, required this.userid});


  @override
  State<StatefulWidget> createState() => _User1ModifyState();
}

class _User1ModifyState extends State<User1Modify> {

  final _formKey = GlobalKey<FormState>();
  final _useridController = TextEditingController();
  final _nameController = TextEditingController();
  final _birthController = TextEditingController();
  final _ageController = TextEditingController();

  final service = User1Service();




  @override
  void initState() {
    super.initState();

    // 수정 데이터 조회하기
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      // ⭐⭐⭐ Spring에서 ResponseEntity.status(HttpStatus.FOUND)로 되어 있어서 데이터를 못 가져옴 FOUND -> OK로 해야됨
      User1 user = await service.getUser(widget.userid);

      setState(() {
        _useridController.text = user.userid;
        _nameController.text = user.name;
        _birthController.text = user.birth;
        _ageController.text = user.age.toString();
      });
    } catch (e) {
      _showDialog('조회 실패', '사용자 정보를 불러오는 중 오류가 발생했습니다.\n$e');
    }
  }


  String message = '';

  Future<void> _submitForm() async {

    if(!_formKey.currentState!.validate()) return;

    final User1 modifyUser = User1(
        userid: _useridController.text,
        name: _nameController.text,
        birth: _birthController.text,
        age: int.tryParse(_ageController.text) ?? 0
    );

    try {
      User1 modifiedUser = await service.putUser(modifyUser);
      //print('savedUser : ${savedUser} 등록');

      await _showDialog('등록 성공', '사용자가 성공적으로 등록되었습니다.');

      // 목록 이동
      Navigator.pop(context,modifiedUser);

    }catch(err){
      setState(() {
        message = '등록 실패, 에러 발생 했습니다. $err}';
      });
    }
  }

  Future<void> _showDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


  Future<void> selectBirth() async {
    DateTime now = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1900),
        lastDate: now
    );

    if(selectedDate != null){
      setState(() {

        //String fmtDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        _birthController.text = selectedDate.toString();

      });
    }



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('User1 등록'),),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _useridController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '아이디 입력'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '이름 입력'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _birthController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '생년월일 입력'
                    ),
                    readOnly: true,
                    onTap: selectBirth,
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '나이 입력'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: const Text('취소')),
                      const SizedBox(width: 10,),
                      ElevatedButton(onPressed: _submitForm, child: const Text('등록')),
                    ],
                  ),
                  Text(message)
                ],
              )
          ),
        )
    );
  }

}