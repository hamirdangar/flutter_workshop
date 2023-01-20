
import 'package:assessment2/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({
    required this.text
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableTextWidget> {
   late String firstHalf;
   late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(color: Colors.grey[500],size: Dimensions.font16,text: firstHalf) : Column(
        children: [
          SmallText(height:1.8,color: Colors.grey[500],size: Dimensions.font16, text: hiddenText ? (firstHalf+'...') : (firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: 'Show more',color: Colors.greenAccent),
                Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up ,color: Colors.greenAccent,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
