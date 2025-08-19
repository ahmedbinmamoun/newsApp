import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourseResponse.dart';
import 'package:news/ui/category_details/cubit/sources_states.dart';

class SourcesViewModel extends Cubit<SourceStates>{
  SourcesViewModel():super(SourceLoadingState());

  void getSources(String categoryId)async{
    try{
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response!.sourcesList!));
        return ;
      }
    }catch(e){
          emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}