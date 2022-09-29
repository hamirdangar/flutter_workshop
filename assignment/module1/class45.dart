abstract class Marks
{
  void getPercentage();
}
class A2 extends Marks
{
  var sub1,sub2,sub3;
  A2(var s1,var s2,var s3){
    sub1=s1;
    sub2=s2;
    sub3=s3;
  }
  @override
  void getPercentage() {
    var per = (sub1+sub2+sub3)/3;
    print(per);
  }

}
class B2 extends Marks
{
  var sub1,sub2,sub3,sub4;
  B2(var s1,var s2,var s3, var s4){
    sub1=s1;
    sub2=s2;
    sub3=s3;
    sub4=s4;
  }
  @override
  void getPercentage() {
      var per = (sub1+sub2+sub3+sub4)/4;
      print(per);
  }

}