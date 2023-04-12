import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class emptyFav extends StatelessWidget {
  const emptyFav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('images/empty.json',height: 300),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Oh, There is no favourites till Now',style: TextStyle(fontSize: 15),),
              SizedBox(width: 5,),
              Image.asset('images/cry.png',height: 20,)
            ],
          )
        ],
      ),);
  }
}