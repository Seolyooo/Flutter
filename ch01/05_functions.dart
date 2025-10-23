/*
*   날짜: 2025/10/23
*   설유진
*   dart 함수
*
* */
void hello(){
  print('hello Dart!');

}


int add(int a, int b){
  return a + b;
}

var greet = (String name){
  return 'Greeting ${name}';
};

int plus(int a, int b) => a+b;
int minus(a, b) => a-b;



//고정 함수(함수를 매개변수로 전달 받거나 반환하는 함수
int calc(int x, int y,int Function(int ,int) operation){
  return operation(x,y);
}


Function createHello(String name){
  return ()=> "hello, ${name}";
}

//이름이 있는 매개 변수(named parameter,{중괄호} 매개변수)
void person1 ({String hello = 'hello', String ? name}){
  print('person1 $hello,$name');
}
void person2 (String name,{ String? hello}){
  print('person2 $hello,$name');
}
void person3 (String name,{String? hello, required int age}){
  print('person3 $hello,$name,$age');
}


//선탣적 위치 매개 변수(optional positinal parameter,{대괄호} 매개변수)

void user1(String name ,[int age = 0]){
  print('user1 $name,$age');
}
void user2(String name ,[int? age, String? address]){
  print('user2 $name,$age,$address');
}
void user3(String name ,[int? age, String address = 'Unknown', String? job]){
  print('user3 $name,$age,$address,$job');
}


void main(){
  //기본 함수
  hello();

  //매개 변수와 반환 값이 있는 함수
  int result1 = add(1,2);
  int result2 = add(2,3);

  print('result1 $result1');
  print('result2 $result2');

  //익명 함수
  print(greet('김유신'));

  //화살표 함수
  int rs1 = plus(2,3);
  int rs2 = minus(2,3);

  print('rs1 : $rs1');
  print('rs2 : $rs2');




//고정 함수(함수를 매개변수로 전달 받거나 반환하는 함수
int result = calc(10,5,minus);
print ('result : ${result}');

var greeting = createHello("홍길동");
print(greeting());




  //이름이 있는 매개 변수(named parameter,{중괄호} 매개변수)
  person1();
  person1(name:'홍길동');
  person2('김유신');
  person2(hello:'안녕하세요.','김춘추');
  person3('장보고',age:21,hello:'반갑습니다.');


  //선탣적 위치 매개 변수(optional positinal parameter,{대괄호} 매개변수)
  user1('김유신');
  user1('김유신',21);
  user2('장보고');
  user2('장보고',33);
  user2('장보고',32,'주소주소');
  user3('정약용');
  user3('정약용',23,'부산','엔지니어');





}
