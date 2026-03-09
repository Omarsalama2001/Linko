import 'package:Linko/core/utils/theme/app_theme.dart';
import 'package:Linko/core/widgets/loading_widget.dart';
import 'package:Linko/core/widgets/snack_bar.dart';
import 'package:Linko/features/home/presentation/blocs/bloc/home_bloc.dart';
import 'package:Linko/features/home/presentation/widgets/live_item.dart';
import 'package:Linko/features/streaming/presentation/blocs/bloc/streaming_bloc.dart';
import 'package:Linko/features/streaming/presentation/pages/streaming_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Linko/core/extensions/translation_extension.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final ScrollController scrollController = ScrollController();
  bool isVisible = true;
  @override
  void initState() {
    context.read<HomeBloc>().add(const GetLiveUsersEvent());
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (isVisible != false) {
          setState(() {
            isVisible = false;
          });
        }
      } else {
        if (isVisible != true) {
          setState(() {
            isVisible = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StreamingBloc, StreamingState>(
      listener: (context, state) {
        if (state is StreamingStartedErrorState) {
          SnackBarMessage.showSnackBar(SnackBarTypes.ERORR, "somthing went wrong", context);
        }
        if (state is StreamingStartedSuccessState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StreamingPage(
                        isHost: true,
                        liveID: FirebaseAuth.instance.currentUser!.uid,
                      )));
        }
      },
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
            visible: isVisible,
            child: FloatingActionButton.extended(
              tooltip: "Start Live",
              foregroundColor: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.h),
              ),
              onPressed: () {
                context.read<StreamingBloc>().add(ChangeStreamStatusEvent(uid: FirebaseAuth.instance.currentUser!.uid, status: true));
              },
              icon: Icon(Icons.live_tv_rounded, color: Colors.white, size: 20.h),
              label: Text(
                context.translate('start_live'),
                style: appTheme.textTheme.titleMedium!.copyWith(fontSize: 15.sp, color: Colors.white),
              ),
            ),
          ),
          body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GetLiveUsersLoadingState) {
                return const LoadingWidget();
              }
              if (state is GetLiveUsersSuccessState) {
                return GridView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: state.liveUsers.length,
                    padding: EdgeInsets.all(
                      10.h,
                    ),
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10.w, crossAxisSpacing: 10.w, crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) => LiveItem(
                          userEntity: state.liveUsers[index],
                        ));
              }
              return const Center(child: Text("No Live Users Found"));
            },
          )),
    );
  }
}
