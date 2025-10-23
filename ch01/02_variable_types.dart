/*
*   날짜: 2025/10/23
*   설유진
*   3장 dart 변수와 구축

* */

//dart 프로그램 진입점
void main() {
// 변수와 기본타입
  String name = '홍길동';
  int age = 23;
  double height = 177.2;
  bool isStudent = true;
  num score = 100; // 숫자형 (int double 포함하는 상위 타입)
  var address = '부산시'; // 타입 자동 추론(컴파일 시점, 최초 한번 타입이 정해지면 변경 불가)
  dynamic etc = '기타'; // 자동 동적 결정(런타임 시점, 최초 한번 타입이 정해져도 변경 가능)


  print(' 이름:${name}\n 나이:${age}\n 키:${height}\n 학생여부:${isStudent}\n 주소:${address}' );

  // Nullable 타입 dart의 기본 변수는 모두 non-nullable, null 취급하기 위해서 타입뒤에 ? 표기
  String? value1 = null;
  int? value2;

  print(' value1: ${value1}, value2: ${value2}');

  // 타입 확인
  print('---------------------');
  print ('name 타입 : ${name.runtimeType}');
  print ('age 타입 : ${age.runtimeType}');
  print ('height 타입 : ${height.runtimeType}');
  print ('isStudent 타입 : ${isStudent.runtimeType}');
  print ('score 타입 : ${score.runtimeType}');
  print ('address 타입 : ${address.runtimeType}');
  print ('etc 타입 : ${etc.runtimeType}');
  print ('value1 타입 : ${value1.runtimeType}');
  print ('value2 타입 : ${value2.runtimeType}');



  // 타입 변환

  String strNum = '2025';
  int intNum = int.parse(strNum);

  double price = 19.7;
  int intPrice = price.toInt();
  print('intPrice : ${intPrice}');

  int count =122;
  String strCount = count.toString();
  print('strCount : ${strCount}');



  // 실수
  final num1 = 100; //런타입 상수 실행시간에 결정
  const num2 = 200; //컴파일 타입 상수 클래스 멤버로 사용

  final today = DateTime.now();
  print('today:${today}');


  // 문자열
  String hello = "Hell2o Dart";
  String welcome = '''
  Welcome Dart!
  Welcome World!
  Welcome Flutter!
  ''';

  print(hello);
  print(welcome);

  String escape = "나는 생각한다. \'Dart\'는 재미?";
  print(escape);

  String rawStr = r'C:\users\flutter\bin';
  print(rawStr);


  String fName = '길동';
  String lName = '홍';
  String fullName = lName + fName;

  print(' 이름 : '+ fullName);
  print(' 이름 : $lName$fName');

  String word = 'Flutter';
  print('문자열 길이 : ${word.length}');
  print('첫 문자 : ${word[0]}');


  String text = '   Dart Language   ';
  print('원본:[$text]');
  print('소문자:${text.toLowerCase()}');
  print('대문자:${text.toUpperCase()}');
  print('공백 제거:${text.trim()}');
  print('문자 포함 여부:${text.contains('Dart')}');
  print('문자열 교체:${text.replaceAll('Dart', 'Flutter')}');

  String sentence = '서울,대전';










}