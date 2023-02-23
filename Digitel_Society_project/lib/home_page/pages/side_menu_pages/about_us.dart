import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Digital Society',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Text('      We are living in a digital society, in which every aspect of our lives is profoundly being affected'
                  ' by the digitalisation of data: how we communicate and socialise; how we work,'
                  ' learn, stay healthy and participate in politics and the economy.'
                  ' Digitalisation promises tremendous benefits; for better health, more efficient mobility,'
                  ' efficient energy use, and flourishing companies.',
              style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text('     Yet it also raises complex challenges: new divides around access to and control of data;'
                  ' what it means to be human when we share the world with sophisticated artificial intelligences;'
                  ' identifying knowledge and truth amongst the deluge of information. To address these issues,'
                  ' computer- and data scientists need to work together with social scientists and humanities scholars.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
