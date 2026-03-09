part of 'streaming_bloc.dart';

sealed class StreamingEvent extends Equatable {
  const StreamingEvent();

  @override
  List<Object> get props => [];
}

class ChangeStreamStatusEvent extends StreamingEvent {
  final String uid;
  final bool status;
  const ChangeStreamStatusEvent({
    required this.uid,
    required this.status,
  });
}

