class A
{
  void map(){
    Map students = {
      1 : 'hamir',
      2 : 'milan',
      3 : 'tejash'
    };
    print(students);

    Map B = Map();
    B['apple'] = 'red';
    B['banana'] = 'green';


    B.containsKey('banana');
    B.update('apple', (value) => 'yello');
    print(B);
    print(B.isEmpty);
    print(B.length);

  }
}