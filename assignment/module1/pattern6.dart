import 'dart:io';

class Pattern6{
  void pattern(){
    for(var i=1;i<=5;i++){
      for(var j=5;j>i;j--){
        stdout.write(' ');
      }
      for(var k=1;k<=i;k++){
        stdout.write('* ');
      }
      print('');
    }
  }
}