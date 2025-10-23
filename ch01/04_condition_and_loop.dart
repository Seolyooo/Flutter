
/*
*   날짜: 2025/10/23
*   설유진
*   dart 제어문
*
* */

void main(){
  /////////////////////////
  //조건문
  /////////////////////////

  int number = 10;

  //if
  if(number >5){
    print("number 52보다 큽니댜.");
  }

  //if -else
  if(number %2 ==0){
    print("$number는 짝수입니다");
  }else{
    print("$number는 홀수입니다");
  }

  int score = 83;
  if(score >=90){
    print("A");
  }else if(score >=80){
    print("B");
  }else if(score >=80){
    print("C");
  }else if(score >=80){
    print("D");
  }else{
    print("F");
  }


  switch(score ~/ 10){
    case 10:
    case 9:
      print("A");
      break;
    case 8:
      print("B");
      break;

    case 7:
      print("c");
      break;

    case 6:
      print("d");
      break;
    default:
      print("F");

  }

  /////////////////////////
  //반복문
  /////////////////////////

  //for문

  for(int i =1 ; i < 5; i++){
    print("for : $i");
  }
  //while문
  int j = 1;

  while(j<=5){
    print("while : $j");
    break;
  }
  //do-while문

  int k =1 ;
  do{
    print("do -while: $k");
        k++;
  }while(k<=5);
  //break문
  int num = 1;
  while (true){
    if(num % 5 ==0 && num %7 ==0){
      print ("i=5");
          break;
    }
  }

  //continue
  for(int i=1; i<=10; i++){
    if(i%2 ==0){
      continue;
    }
    print("i :$i");
  }

  //널삼각형
   for(int a =1; a <=10; a++){
     for(int b=1; b<=a ; b++){
       print('🚗');
     }
   }




}

