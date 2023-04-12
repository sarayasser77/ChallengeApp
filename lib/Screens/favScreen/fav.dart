import 'package:challengeapp/constants/msgtoast.dart';
import 'package:challengeapp/cubit/layoutstates.dart';
import 'package:challengeapp/cubit/newscubit.dart';
import 'package:challengeapp/widgets/newscomponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/emptyfav.dart';
class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = BlocProvider.of(context);
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
return BlocConsumer<NewsCubit,NewsStates>(
    builder:(context,state){
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueGrey,
      title: const Text('Favourites'),
    ),
    body: cubit.fav.isEmpty?
    emptyFav():
ListView.builder(
    itemCount: cubit.fav.length,
    itemBuilder: (context,index)=>
      Slidable(
        startActionPane: ActionPane(
          motion:  const ScrollMotion(),
          children:  [
            SlidableAction(
              onPressed: (context){
                cubit.deleteFromFav(index);
                getFlutterToast('Item Deleted', Colors.black);
              },
              backgroundColor:Colors.red.shade600,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),

        
        child:Newscomponent(screenHeight: screenHeight, screenWidth: screenWidth,
            newsComponent: cubit.fav[index]),)


)  );
}, listener: (context,state){});
  }
}


