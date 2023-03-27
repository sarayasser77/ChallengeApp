import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/race.jpeg',),
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center
            ,child: Text('Sports',style: TextStyle(color: Colors.white),),
            height: screenHeight*.04,
            width: screenWidth*.25,
            decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(30)),
          ),
          SizedBox(height: screenHeight*.05,),
          Row(children: [
            Text('CNN Indonesia',style: TextStyle(color: Colors.white),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.task_alt,color: Colors.blue,size: 25,),
            ),
            Text('6 hour ago',style: TextStyle(color: Colors.white),)
          ],),
          Text('Alexander wears modified \n  helmet in road races',style: TextStyle(color: Colors.white,fontSize: 20),)
        ],
      ),
    );
  }
}