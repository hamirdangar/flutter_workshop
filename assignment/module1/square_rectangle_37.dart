class Area
{
  Area.rectangle(int length,int breadth){
    var area = 2*length*breadth;
    print('area of rectangle is: $area');
  }
  rectangle(int side){
    var area = side*side;
    print('area of a square is: $area');
  }
}