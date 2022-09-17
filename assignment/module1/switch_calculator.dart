// Write a Program of Addition, Subtraction ,Multiplication and Division using
// Switch case.(Must Be Menu Driven)

class Calculator{
  void calculator(){
    var a = 5;
    var b = 9;
    var ch = '+';
    switch(ch){
      case '+': print(a+b);
      break;
      case '-': print(a-b);
      break;
      case '*': print(a*b);
      break;
      case '/': print(a/b);
      break;
      case '%': print(a%b);
      break;
      default : print("invalid");
      break;
    }
  }
}