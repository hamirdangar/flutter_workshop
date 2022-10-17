class Set1 {
  void set() {
    var hamir = { 'play', 'boy', 'goodboy'};

    // Set hamir1 = { 'rahul'};
    hamir.add('rahul');

    // add
    var milan = { 'anamd','ramesh','sunil'};
    hamir.addAll(milan);

    // pozition
    var  A =hamir.elementAt(2);
    print(hamir);
    print(A);

    // count length
    var b = hamir.length;
    print(b);

    //remove
    hamir.remove('goodboy');
    print(hamir);

    // using forEach in Set
    hamir.forEach((element) {
      if(element == 'play'){
        print('found');
      }else{
        print('not found');
      }

    });
    hamir.clear();
  }
}
