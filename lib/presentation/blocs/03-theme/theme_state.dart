part of 'theme_cubit.dart';

// sealed class: es una clase que tiene subclases privadas
// es similar a abstract class pero con la diferencia que las subclases
class ThemeState extends Equatable {

  final bool isDarkmode;


  const ThemeState({
    required this.isDarkmode,
  });

  @override
  List<Object> get props => [ isDarkmode ];
}

// final class ThemeInitial extends ThemeState {}
// final class ThemeDark extends ThemeState {}

