abstract class Bank
{
    void getBalance1();
}
class A1 extends Bank
{
    void getBalance1(){
      print('deposited 100 doller');
    }
}
class B1 extends Bank
{
  void getBalance1(){
    print('deposited 150 doller');
  }
}
class C1 extends Bank
{
  void getBalance1(){
    print('deposited 200 doller');
  }
}