import 'package:equatable/equatable.dart';
import '../../data/model/go_model.dart';

abstract class GoState extends Equatable {
  const GoState();

  @override
  List<Object?> get props => [];
}

class GoInitial extends GoState {}

class GoLoading extends GoState {}

class GoLoaded extends GoState {
  final GoModel goModel;
  const GoLoaded(this.goModel);
}

class GoError extends GoState {
  final String? message;
  const GoError(this.message);
}

