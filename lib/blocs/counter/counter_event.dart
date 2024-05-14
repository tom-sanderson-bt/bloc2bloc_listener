part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class ChangeCounterEvent extends CounterEvent {
  final int incrementValue;

  @override
  List<Object> get props => [incrementValue];

  const ChangeCounterEvent({required this.incrementValue});
}