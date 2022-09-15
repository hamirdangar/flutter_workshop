import 'dart:convert';

class Areafind{
  void areafind(){
    var base =7,height = 5, breadth =4, length =3, radius =8;
    var triangle=1;
    var rectangle=2;
    var circle=3;
    var choice = 2;
    switch(choice){
      case 1: print("area of teiangle");
      var a = 0.5*height*base;
      print(a);
      break;

      case 2: print("area of rectangle");
      var b = length*breadth;
      print(b);
      break;

      case 3: print("area of circle");
      var c = 3.14*radius;
      print(c);
      break;

      default: print("invalid");
      break;
    }
  }
}
