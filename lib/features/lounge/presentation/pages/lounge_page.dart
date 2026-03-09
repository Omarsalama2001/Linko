import 'package:Linko/core/widgets/loading_widget.dart';
import 'package:Linko/features/lounge/presentation/blocs/bloc/lounge_bloc.dart';
import 'package:Linko/features/lounge/presentation/widgets/lounge_page_card.dart';
import 'package:Linko/features/profile/presentation/blocs/bloc/profile_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class LoungePage extends StatefulWidget {
  LoungePage({super.key});

  @override
  State<LoungePage> createState() => _LoungePageState();
}

class _LoungePageState extends State<LoungePage> {
  @override
  void initState() {
    super.initState();
    context.read<LoungeBloc>().add(GetLoungeUsersEvent(gender: context.read<ProfileBloc>().userProfileData!.gender!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoungeBloc, LoungeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetLoungeUsersLoadingState) {
            return const LoadingWidget();
          }
          if (state is GetLoungeUsersSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: CardSwiper(
                    backCardOffset: const Offset(0, -30),
                    numberOfCardsDisplayed: state.loungeUsers.length,
                    maxAngle: 20,
                    cardsCount: state.loungeUsers.length,
                    cardBuilder: (context, index, percentThresholdX, percentThresholdY) => LoungePageCard(
                      loungeUSer: state.loungeUsers[index],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                'An error occurred while fetching lounge users.',
              ),
            );
          }
        },
      ),
    );
  }
}
