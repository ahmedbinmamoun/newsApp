import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/repository/sources/repository/source_repository.dart';
import 'package:news/ui/category_details/cubit/sources_states.dart';

class SourcesViewModel extends Cubit<SourceStates>{
  SourceRepository sourceRepository;
  SourcesViewModel({required this.sourceRepository}):super(SourceLoadingState());

  void getSources(String categoryId)async{
    try{
      emit(SourceLoadingState());
      var response = await sourceRepository.getSourcees(categoryId);
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