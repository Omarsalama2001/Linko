part of 'lounge_bloc.dart';

sealed class LoungeEvent extends Equatable {
  const LoungeEvent();

  @override
  List<Object> get props => [];
}

class GetLoungeUsersEvent extends LoungeEvent {
  final String gender;
  const GetLoungeUsersEvent({
    required this.gender,
  });
}
