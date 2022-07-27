import 'package:auth_app/bloc/home_api_bloc.dart';
import 'package:auth_app/bloc/home_api_event.dart';
import 'package:auth_app/bloc/home_api_state.dart';
import 'package:auth_app/models/quote_model.dart';
import 'package:auth_app/repository/home_repository.dart';
import 'package:auth_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      body: BlocProvider<QuoteBloc>(
        create: (context) =>
            QuoteBloc(RepositoryProvider.of<QuotesRepository>(context))
              ..add(LoadQuoteEvent()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<QuoteBloc, QuoteState>(
              builder: (context, state) {
                if (state is QuoteErrorState) {
                  return Text(
                    state.message,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  );
                } else if (state is QuoteLoadedState) {
                  return QuoteWidget(
                    model: state.model,
                    onPressed: () =>
                        context.read<QuoteBloc>().add(LoadQuoteEvent()),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key? key, required this.model, required this.onPressed})
      : super(key: key);

  final QuoteModel model;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      model.content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Author: ${model.author}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Tags:\n${tagsToString(model.tags)}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    child: const Text('Load a new quote'),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  String tagsToString(List<String> tags) {
    var tagsString = '';
    for (final tag in tags) {
      tagsString += ' $tag -';
    }
    return tagsString.substring(0, tagsString.length - 1);
  }
}
