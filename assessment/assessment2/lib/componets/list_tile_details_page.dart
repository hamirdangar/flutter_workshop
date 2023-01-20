
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/big_text.dart';
import '../widgets/dimensions.dart';
import '../widgets/expandebale_text.dart';

class ListTileDetailsPage extends StatelessWidget {
  final String title;
  final String imageurl;
  final String DetailsText;
  const ListTileDetailsPage({ Key? key, required this.title, required this.imageurl, required this.DetailsText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                    child: BigText(
                      text: title,
                      size: Dimensions.font26,
                    )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.grey[400],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(imageurl,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(
                    text: DetailsText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
