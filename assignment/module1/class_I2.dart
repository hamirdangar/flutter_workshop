abstract class Shape
{
  RectangleArea(var length, var breadth);
  SquareArea(var side);
  CircleArea(var radius);

}
class Area1 extends Shape
{  @override
  CircleArea(radius) {
    print(3.14*radius*radius);
  }

  @override
  RectangleArea(length, breadth) {
    print(length*breadth);
  }

  @override
  SquareArea(side) {
    print(side*side);
  }
}
