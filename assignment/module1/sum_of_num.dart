class Sumofnum{

  void sumofnum()
  {
    var num=1235;
    var sum=0;
    while(num!=0){
      sum = sum+num%10;
      num = (num/10) as int;
    }
    print(sum);
  }
}