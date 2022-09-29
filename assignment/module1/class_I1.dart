class Factorial
{
   double factorial(var n){
    if(n==0)
      return 1;
    return n*factorial(n-1);
  }
}