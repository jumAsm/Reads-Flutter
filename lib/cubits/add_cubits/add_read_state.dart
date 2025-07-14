part of 'add_read_cubit.dart';

@immutable
abstract class AddReadState{}

class AddReadInitial extends AddReadState{}

class AddReadLoading extends AddReadState{}

class AddReadSuccess extends AddReadState{}

class AddReadFailure extends AddReadState{
  final String errMessage;

  AddReadFailure(this.errMessage);
}