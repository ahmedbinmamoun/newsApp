import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/category_details/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates>{
  NewsViewModel():super(NewsLoadingState());

  void getNewsBySourceId(String sourceId)async{
   try {
    emit(NewsLoadingState());
     var response = await ApiManager.getNewsBySourceId(sourceId);
     if (response?.status == 'error') {
       emit(NewsErrorState(errorMessage: response!.message!));
       return ;
     }else if(response?.status == 'ok'){
        emit(NewsSuccessState(newsList: response!.articlesList!));
        return ;
     }
   } catch (e) {
     emit(NewsErrorState(errorMessage: e.toString()));
   }
  }
}