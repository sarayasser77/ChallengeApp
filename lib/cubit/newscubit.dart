import 'dart:convert';

import 'package:challengeapp/cubit/layoutstates.dart';
import 'package:challengeapp/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(InitialState());
  static NewsCubit getInstance(BuildContext context){
    return BlocProvider.of(context);
  }
  List fav=[];
  void addToFav(NewsModel newItems){
    if(fav.contains(newItems)){
      return deleteFromFav(fav.indexOf(newItems));
    }else{
      fav.add(newItems);
      emit(AddToFavSuccessState());
    }
  }
   deleteFromFav(int index){
    fav.removeAt(index);
    emit(DeleteFromFavSuccessState());
  }

List<NewsModel> newsData=[];
  getNews()async{
Response response = (await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a0b05fa063584f49b5447acf4266155d'),
headers: {
}


));
var resbonseBody=jsonDecode(response.body);
if(resbonseBody['status']==true){
  for(var item in resbonseBody['articles']){
    newsData.add(NewsModel.fromjson(data: item));

  }
  debugPrint("News Data is ${resbonseBody['articles']}");
  emit(GetNewsSuccessState());
}else{
  newsData=[];
  debugPrint("News Data is ${resbonseBody['articles']}");
  emit(GetNewsFailureState());
  debugPrint("reason is${resbonseBody['message']}");
}
  }
}