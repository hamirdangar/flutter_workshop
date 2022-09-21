import 'dart:io';

class Pattern9{
  void pattern(){
    var n=1;
    for(var i=1;i<=5;i++){
      for(var j=1;j<=i;j++){
        stdout.write(n);
        n++;
      }
      print('');
    }
  }
}