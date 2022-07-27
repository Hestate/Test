import 'package:auth_app/bloc/home_api_event.dart';
import 'package:auth_app/bloc/home_api_state.dart';
import 'package:auth_app/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {

  QuoteBloc(this._repository) : super(QuoteLoadingState()) {
    on<LoadQuoteEvent>((event, emit) async {
      emit(QuoteLoadingState());
      try{
        final model = await _repository.getQuote();
        emit(QuoteLoadedState(model));
      }on Exception catch (e) {
        emit(QuoteErrorState(e.toString()));
      }
    });
  }
  final QuotesRepository _repository;
}
