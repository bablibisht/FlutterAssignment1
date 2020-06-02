import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{}

class FetchTodoEvent extends TodoEvent {
  @override
  List<Object> get props => null;
}