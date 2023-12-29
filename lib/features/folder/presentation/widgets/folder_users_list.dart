import 'package:file_manager/features/folder/presentation/widgets/folder_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.dart';
import '../../../../utility/global_widgets/elevated_button_widget.dart';
import '../../../../utility/global_widgets/shimmer.dart';
import '../../../../utility/global_widgets/somthing_wrong.dart';
import '../../../../utility/theme/color_style.dart';
import '../bloc/folder_users_bloc/folder_users_bloc.dart';

class FolderUsersList extends StatefulWidget {
  FolderUsersList({required this.event, Key? key}) : super(key: key);

  FolderUsersEvent event;
  @override
  State<FolderUsersList> createState() => _FileListState();
}

class _FileListState extends State<FolderUsersList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    search();
    super.initState();
  }

  void search() {
    context.read<FolderUsersBloc>().add(widget.event);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<FolderUsersBloc, FolderUsersState>(builder: (context, state) {
      if (state is FolderUsersDoneState) {
        if (state.users.isEmpty) {
          return SomethingWrongWidget(
            title: "No Files found !",
            svgPath: Assets.imagesSearch,
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh",
              onPressed: () {
                search();
              },
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            search();
          },
          child: ListView.builder(
              controller: scrollController,
              itemCount: state.users.length,
              itemBuilder: (BuildContext context, int index) {
                return RefreshIndicator(
                  onRefresh: () async {
                    search();
                  },
                  child: FolderUserItemWidget(
                    user: state.users[index],
                    index: index,
                    event: widget.event,
                  ),
                );
              }),
        );
      }
      if (state is FolderUsersInitial) {
        return ListView.builder(
            controller: scrollController,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.038,
                    right: screenWidth * 0.038,
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.kSecondColor,
                      radius: 30,
                      child: Icon(Icons.file_copy_rounded),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    ShimmerLoader(
                      height: screenHeight * 0.02,
                      width: screenWidth * 0.4,
                    ),
                  ],
                ),
              );
            });
      }
      return SomethingWrongWidget(
        helperResponse: (state as FolderUsersErrorState).helperResponse,
        elevatedButtonWidget: ElevatedButtonWidget(
          title: "Refresh",
          onPressed: () {
            search();
          },
        ),
      );
    });
  }
}
