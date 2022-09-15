class TernaryEx{
  void ternary(){
    var a = 3;
    var b = 6;
    var c = 9;
    var max = (a>b)?(a>c?a:c):(b>c?b:c);
    print(max);
  }
}