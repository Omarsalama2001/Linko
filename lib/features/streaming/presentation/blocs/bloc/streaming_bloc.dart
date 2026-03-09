import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Linko/features/streaming/domain/use_cases/change_stream_status_usecase.dart';

part 'streaming_event.dart';
part 'streaming_state.dart';

class StreamingBloc extends Bloc<StreamingEvent, StreamingState> {
  final ChangeStreamStatusUsecase changeStreamStatusUsecase;

  StreamingBloc({
    required this.changeStreamStatusUsecase,
  }) : super(StreamingInitial()) {
    on<StreamingEvent>((event, emit) async {
      if (event is ChangeStreamStatusEvent) {
        emit(StreamingLoadingState());
        final either = await changeStreamStatusUsecase(event.uid, event.status);
        if (event.status) {
          emit(either.fold((failure) => StreamingStartedErrorState(), (unit) => StreamingStartedSuccessState()));
        } else {
          emit(either.fold((failure) => StreamingEndedErrorState(), (unit) => StreamingEndedSuccessState()));
        }
      }
    });
  }
}
