class PrimeEx
{
  void prime(){
    var num = 27;
    var count = 0;
    for(int i=2;i<num;i++) {
      if (num % i == 0) {
        count++;
      }
    }
      if(count == 0){
        print("number is prime");
      }
      else{
        print("not prime");
      }
  }
}