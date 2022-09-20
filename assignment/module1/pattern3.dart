import 'dart:io';

class Pattern3{
  void pattern(){
    for(var i=1;i<=5;i++){
      for(var j=1;j<=i;j++){
        stdout.write(i);
      }
      print('');
    }
  }
}