import 'package:challengeapp/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/detailsScreen/detailsScreen.dart';

class Newscomponent extends StatelessWidget {
  const Newscomponent({
    super.key,
    required this.screenHeight,
    required this.screenWidth, required this.newsComponent,
  });

  final double screenHeight;
  final double screenWidth;
final NewsModel newsComponent;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  DetailsScreen(
                      NewsModel(id: null, name: newsComponent.name, urltoimage: newsComponent.urltoimage,
                          author: newsComponent.author, desc: newsComponent.desc, content: newsComponent.content, source: newsComponent.source,
                          publishedAt: newsComponent.publishedAt

                      ))));
            }
            ,child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(newsComponent!.urltoimage!),
                )
            ),
            height: screenHeight*.17,
            width: screenWidth*.4,
          ),
          ),
        ),
        Expanded(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(newsComponent.name!,style: TextStyle(color: Colors.grey,fontSize: 15),),
               Text(newsComponent.desc!,style: TextStyle(color: Colors.black,fontSize: 19),),
              Row(
                children:  [
                  const CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('images/asta.jpg'),
                  ),
                  SizedBox(width: screenWidth*.05,),
                   Text(newsComponent.author!),
                  SizedBox(width: screenWidth*.05,),
                  Text(newsComponent.publishedAt!),

                ],
              )
            ],                      ),
        )
      ],
    );
  }
}