import 'package:auth_app/models/quote.dart';

abstract class QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteErrorState extends QuoteState {
  QuoteErrorState(this.message);
  final String message;
}

class QuoteLoadedState extends QuoteState {
  QuoteLoadedState(this.model);
  final QuoteModel model;
}
