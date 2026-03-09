import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Linko/features/auth/domain/entities/user_entity.dart';
import 'package:Linko/features/home/domain/use_cases/get_live_users_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetLiveUsersUsecase getLiveUsersUsecase;
  HomeBloc({
    required this.getLiveUsersUsecase,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetLiveUsersEvent) {
        emit(GetLiveUsersLoadingState());
        final either = await getLiveUsersUsecase.getLiveUsers();

        either.fold(
          (failure) {
            emit(const GetLiveUsersErrorState(errorMessage: "Something went wrong"));
          },
          (liveUsers) {
            emit(GetLiveUsersSuccessState(liveUsers: liveUsers));
          },
        );
      }
    });
  }
}
