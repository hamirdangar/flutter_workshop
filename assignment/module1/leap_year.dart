class LeapEx
{
  void leap(){
    var year = 2025;
    if(year % 400 == 0){
      print(" is a leap year");
    }
    else if(year % 4 == 0){
      print("is a leap year");
    }
    else if(year % 100 == 0){
      print("is a leap year");
    }
    else{
      print("is a not leap year");
    }
  }
}