class NestedifEx
{
  void neated(){
    var a = 10;
    var b = 77;
    var c = 11;
    if(a>=b){
      if(a>=c){
        print(a);
      }
      else{
        print(c);
      }
    }
    else{
      if(b>=c){
        print(b);
      }
      else{
        print(c);
      }
    }
  }
}