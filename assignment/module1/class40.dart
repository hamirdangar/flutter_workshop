class Ractangle
{
  var length;
  var breadth;
  Ractangle(var l,var b){
    length=l;
    breadth=b;
  }
  void print_area(){
    print(length*breadth);
  }
  void print_perimeter(){
    print(2*(length+breadth));
  }
}
class Square extends Ractangle
{
  Square(var s) : super(s, s){

  }
}