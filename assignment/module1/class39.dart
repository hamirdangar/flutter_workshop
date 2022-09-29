class Member
{
  var name;
  var age;
  var phonenumber;
  var address;
  var salary;
  Member(var n, var ag, var pn,var add, var s){
    name=n;
    age=ag;
    phonenumber=pn;
    address=add;
    salary=s;
  }
  void printsalary(){
    print(salary);
    print(name);
    print(age);
    print(phonenumber);
    print(address);
  }
}
class Employee extends Member
{
    var specialization;

  Employee(super.name, super.age, super.pn, super.add, super.s);




}
class Manager extends Member
{
    var department;

  Manager(super.n, super.age, super.pn, super.add, super.s);


}