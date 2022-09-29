abstract class Parent
{
  void message();
}
class subclasses1 extends Parent
{
    void message(){
      print('This is first subclass');
    }
}
class subclasses2 extends Parent
{
  void message(){
    print('This is second subclass');
  }
}