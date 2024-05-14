part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.color});

  final Color color;

  factory ThemeState.initial() {
    return const ThemeState(color: Colors.red);
  }

  @override
  List<Object> get props => [color];

  ThemeState copyWith({
    Color? color,
  }) {
    return ThemeState(
      color: color ?? this.color,
    );
  }

  @override
  String toString() => 'ThemeState(color: $color)';
}
