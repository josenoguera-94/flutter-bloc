part of 'test_bloc.dart';


// formas estandarizadas para cambiar el estado del bloc
// evento -> bloc -> estado
sealed class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}
