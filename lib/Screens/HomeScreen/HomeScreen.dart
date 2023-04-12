import 'package:challengeapp/Screens/detailsScreen/detailsScreen.dart';
import 'package:challengeapp/widgets/indecator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../../widgets/banneritem.dart';
import '../../widgets/newscomponent.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(Icons.menu,color: Colors.black,),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Icon(Icons.search_outlined,color: Colors.black,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Icon(Icons.notifications_active,color: Colors.black,),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: const [
    Text('Breaking News',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
    Text('view all',style: TextStyle(fontSize: 19,color: Colors.blue)),
  ],
),
              SizedBox(height: screenHeight*.01,),
              //pageview
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.transparent,),
                margin: EdgeInsets.all(8),
                height:screenHeight*.26 ,
                child: PageView.builder(
                  onPageChanged: (index){
                    selectedIndex=index;
                    setState(() {

                    });
                  },
                    itemCount: 5,
                    itemBuilder: (context,index){
                    var scale = selectedIndex==index?1:.6;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: scale,end: scale),
                      duration: Duration(milliseconds: 250),
                      curve: Curves.ease,
                      builder: ( context, value,  child) {
                        return Transform.scale(
                          scale: value.toDouble(),
                          child:child ,
                        );

                      },
                      child: BannerItem(screenHeight: screenHeight, screenWidth: screenWidth));
                }),
              ),
              SizedBox(height: screenHeight*.01,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: List.generate(5, (index) => Indecator(isActive: selectedIndex==index?true:false))

             ),
              SizedBox(height: screenHeight*.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Recommendation',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
                  Text('view all',style: TextStyle(fontSize: 19,color: Colors.blue)),
                ],
              ),
              Container(
                color: Colors.transparent,
                margin: EdgeInsets.all(8),
                height: screenHeight*.5,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context,index){
                  return Newscomponent(
                    screenHeight: screenHeight, screenWidth: screenWidth, newsComponent:
                  NewItems(
                      categoryName: 'Sports', image: 'images/football.jpg', overView: 'gfhghgh',
                      desc: 'What do vollyball players need?', title: 'SPORTS', source: 'CNN', date: '26/7/2003', authorName: 'sara'

                  ) ,);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}




