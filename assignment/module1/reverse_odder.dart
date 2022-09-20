//Write a program to print the number in reverse order.
class Reverse{
  void reverse(){
    var n=127;
    var reverse=0;
    int r;
    while(n!=0){
      r=n%10;
      reverse=reverse*10+r;
      n=(n/10) as int;
    }
    print(reverse);
  }
}