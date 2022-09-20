// Write a program you have to print the Fibonacci series up to user given
// number
class Fibonacci{
  void fibonacci(){
    var n=10,a=0,b=1,c;
    for(var i=2;i<=n;i++){
      c=a+b;
      print(c);
      a=b;
      b=c;
    }
    print(c);
  }
}