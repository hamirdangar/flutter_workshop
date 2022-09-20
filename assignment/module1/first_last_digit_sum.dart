class SumEx{
  void sumex(){
    double n,last,sum=0;
    n=2345;
    last = n % 10;
    while(n>9){
      n=n/10;
    }
    sum=n+last;
    print(sum);

  }
}