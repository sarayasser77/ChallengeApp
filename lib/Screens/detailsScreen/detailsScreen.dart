import 'package:challengeapp/animation/animation.dart';
import 'package:challengeapp/constants/msgtoast.dart';
import 'package:challengeapp/cubit/layoutstates.dart';
import 'package:challengeapp/cubit/newscubit.dart';
import 'package:challengeapp/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DetailsScreen extends StatelessWidget {
  final NewItems newitems;

  DetailsScreen(this.newitems );

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = BlocProvider.of(context);
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
        backgroundColor: Colors.white,
        body: FadeAnimation(.4,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                floating: false,
                pinned: true,
                leading: Icon(
                    Icons.menu
                ),
                actions: [
                  Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.5),
                      child: IconButton(icon: Icon(cubit.fav.contains(newitems)?Icons.bookmark:Icons.bookmark_border,color: Colors.white,),

                        onPressed: () {
                           cubit.addToFav(newitems);
                           cubit.fav.contains(newitems)? getFlutterToast('Item added', Colors.black):getFlutterToast('Item removed', Colors.black);
                      },),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.5),
                      child: Icon(Icons.more_horiz,color: Colors.white,),),
                  )
                ],
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 130,horizontal: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(newitems.image))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,width: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue),
                            child: Text('other',style: TextStyle(color: Colors.white),),),
                          SizedBox(height: 20,),
                          Text('What training do vollyball players need ',style: TextStyle(fontSize: 25,color: Colors.white),),
                          SizedBox(height: 30,),
                          Text('Trending. 6hours',style: TextStyle(color: Colors.white,fontSize: 20),)
                        ],
                      ),
                    ),
                  ),

                  // ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 900,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(radius: 28,backgroundColor: Colors.black,child: Image.asset('images/cnn.png',fit: BoxFit.cover,),),
                                SizedBox(width: 15,),
                                Text('CNN',style: TextStyle(fontSize: 25),),
                                SizedBox(width: 10,),
                                CircleAvatar(radius: 8,backgroundColor: Colors.blue,child: Icon(Icons.check,size: 12,))
                              ],
                            ),
                            SizedBox(height: 20,),
                            FadeAnimation(1.5,
                              child: Text('Kajiyama returned to visit the houses around five times, before going to visit the owner himself to negotiate an agreement that would see him use the old green tree factory as a home, and convert the farmer’s house into the guesthouse he’d always envisioned  While he was keen to purchase both of the homes, he explains that the traditions around home ownership in Japan mean that he is unable to do '
                                  'so until it’s passed down to the son of the current owner '
                                  ' They said ‘if you take all the responsibility yourself, you can take it.’ So we made an agreement on paper,'
                                  '” he says Both he and Hila were aware that they had a lot of work ahead of them, but the couple, who married in 2013, were thrilled to be one step closer to having their'
                                  ' own guesthouse in an ideal spot.“It’s a very nice location,'
                                  '” says Kajiyama. “It’s close to the city, but it’s really countryside. Also people still live here and go to work [in the city].“The house is also in front of the river, so when you go to sleep you can hear the sound of the water.”According to Kajiyama, the process of '
                                  'clearing the house, which is around 90 years old, before beginning the '
                                  'renovation works was one of the hardest parts of the process simply because there was so much stuff to sort through. However, he was able to repurpose some of the items.During '
                                  'the first year, he spent a lot of time connecting with locals, '
                                  'gaining knowledge about the home, and helping the local farmers with farming for the first year or so.',style: TextStyle(fontSize:
                              19),),
                            )
                          ],
                        ),
                      ),
                    )

                  ]))
              // SliverToBoxAdapter(
              //     child: Container(
              //       height: 900,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),),color: Colors.white),
              //         child: Padding(
              //           padding: const EdgeInsets.all(4.0),
              //      child: Row(
              //        children: [
              //          CircleAvatar(child: Icon(Icons.newspaper_sharp,),radius: 20,backgroundColor: Colors.black,)
              //        ],
              //      ),
              //         )
              //     )
              // ),

            ],
          ),
        ),
      );  },
      listener: (BuildContext context, Object? state) {  },

    );
  }
}
