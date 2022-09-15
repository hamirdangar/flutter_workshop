class SubperEx{
  void subper(){
    var english = 88;
    var hindi = 55;
    var maths = 69;
    var acc = 77;
    var gujrati =89;
    var per = (english+hindi+maths+acc+gujrati)/5;
    if(per>75){
      print("Distinction");
    }
    else if(per>60){
      print("first class");
    }
    else if(per>50){
      print("second class");
    }
    else if(per>35){
      print("pass class");
    }
    else{
      print("fail");
    }
  }
}