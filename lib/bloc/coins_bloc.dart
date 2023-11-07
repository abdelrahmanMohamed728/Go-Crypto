import 'package:bloc/bloc.dart';
import 'package:go_crypto/bloc/state/go_state.dart';

import '../data/repo/coins_repo.dart';
import 'events/get_top_coins_event.dart';
import 'events/go_event.dart';

class CoinsBloc extends Bloc<GoEvent, GoState> {
  CoinsBloc() : super(GoInitial()) {
    final CoinsRepository _coinsRepository = CoinsRepository();

    on<GetCoinsTopListEvent>((event, emit) async {
      try {
        emit(GoLoading());
        final mList = await _coinsRepository.fetchCoinsTopList();
        emit(GoLoaded(mList));
      } catch (ex) {
        emit(GoError(ex.toString()));
      }
    });
  }
}
