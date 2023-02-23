//@dart=2.9
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget
{
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  File _image;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipOval(
                  child: _image != null ? Image.file(
                    _image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ):ClipOval(
                    child: Center(child: Text('Select images')),
                  ),
                ),
              ),
              TextButton(
                onPressed: _selectImage,
                child: Text('Select Image'),
              ),
              SizedBox(height: 10,),
              Text('Hamir',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
              Text('dangarhamir3333@gmail.com',style: Theme.of(context).textTheme.bodyText2,),
              SizedBox(height: 10,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    side: BorderSide.none,
                    shape: StadiumBorder(),
                  ),
                  child: Text('Edit',style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(height: 30,),
              Divider(),
              SizedBox(height: 10,),
              ProfileMenuWidget(
                title: 'Setting',
                icon: LineAwesomeIcons.cog,
                onPress: (){},
              ),
              ProfileMenuWidget(title: 'title', icon: LineAwesomeIcons.life_ring, onPress: (){}),
              ProfileMenuWidget(title: 'title', icon: LineAwesomeIcons.life_ring, onPress: (){}),
              ProfileMenuWidget(title: 'title', icon: LineAwesomeIcons.alternate_sign_out, onPress: (){},textColor: Colors.red,endIcon: false,),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key key,
     this.title,
     this.icon,
     this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1)
        ),
        child: Icon(icon,color: Colors.blue,),
      ),
      title: Text(title,style: Theme.of(context).textTheme.subtitle1?.apply(color: textColor),),
      trailing: endIcon ? Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1)
        ),
        child: Icon(LineAwesomeIcons.angle_right,color: Colors.grey,),
      ):null,
    );
  }
}
