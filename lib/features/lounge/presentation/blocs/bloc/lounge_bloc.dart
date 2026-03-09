import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Linko/features/lounge/domain/use_cases/get_lounge_users_usecase.dart';

part 'lounge_event.dart';
part 'lounge_state.dart';

class LoungeBloc extends Bloc<LoungeEvent, LoungeState> {
  final GetLoungeUsersUsecase getLoungeUsersUsecase;
  LoungeBloc(
    this.getLoungeUsersUsecase,
  ) : super(LoungeInitial()) {
    on<LoungeEvent>((event, emit) async {
      if (event is GetLoungeUsersEvent) {
        emit(GetLoungeUsersLoadingState());
        final failureOrLoungeUsers = await getLoungeUsersUsecase(event.gender);
        failureOrLoungeUsers.fold(
          (failure) {
            emit(const GetLoungeUsersErrorState(errorMessage: "Something went wrong"));
          },
          (liveUsers) {
            emit(GetLoungeUsersSuccessState(loungeUsers: liveUsers));
          },
        );
      }
    });
  }
}
