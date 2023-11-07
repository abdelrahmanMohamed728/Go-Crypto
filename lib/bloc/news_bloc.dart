import 'package:bloc/bloc.dart';
import 'package:go_crypto/bloc/events/news_event.dart';
import 'package:go_crypto/bloc/state/go_state.dart';

import '../data/repo/news_repo.dart';
import 'events/go_event.dart';

class NewsBloc extends Bloc<GoEvent, GoState> {
  NewsBloc() : super(GoInitial()) {
    final NewsRepository _newsRepository = NewsRepository();

    on<GetNewsEvent>((event, emit) async {
      try {
        emit(GoLoading());
        final mList = await _newsRepository.fetchNewsList();
        emit(GoLoaded(mList));
      } catch (ex) {
        emit(GoError(ex.toString()));
      }
    });
  }
}
