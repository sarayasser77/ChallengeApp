import 'package:challengeapp/cubit/layoutstates.dart';
import 'package:challengeapp/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(InitialState());
  static NewsCubit getInstance(BuildContext context){
    return BlocProvider.of(context);
  }
  List fav=[];
  void addToFav(NewItems newItems){
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
}