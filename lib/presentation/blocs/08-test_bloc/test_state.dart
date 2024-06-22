part of 'test_bloc.dart';

// Estado del cubic
sealed class TestState extends Equatable {
  const TestState();
  
  @override
  List<Object> get props => [];
}

final class TestInitial extends TestState {}
