part of 'streaming_bloc.dart';

sealed class StreamingState extends Equatable {
  const StreamingState();
  
  @override
  List<Object> get props => [];
}

final class StreamingInitial extends StreamingState {}

final class StreamingLoadingState extends StreamingState {}

final class StreamingStartedSuccessState extends StreamingState {}

final class StreamingStartedErrorState extends StreamingState {} 
final class StreamingEndedSuccessState extends StreamingState{}
final class StreamingEndedErrorState extends StreamingState{}

