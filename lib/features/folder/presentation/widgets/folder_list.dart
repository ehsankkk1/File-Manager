
import 'package:file_manager/features/folder/presentation/widgets/folder_item.dart';
import 'package:file_manager/utility/theme/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/assets.dart';
import '../../../../utility/global_widgets/elevated_button_widget.dart';
import '../../../../utility/global_widgets/shimmer.dart';
import '../../../../utility/global_widgets/somthing_wrong.dart';
import '../bloc/folder_bloc.dart';

class FolderList extends StatefulWidget {
  FolderList({required this.event,Key? key}) : super(key: key);

  FolderEvent event;
  @override
  State<FolderList> createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    search();
    super.initState();
  }
  void search() {
    context
        .read<FolderBloc>()
        .add(widget.event);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<FolderBloc, FolderState>(
        builder: (context, state) {
          if (state is FolderDoneState) {
            if(state.folders.isEmpty){
              return SomethingWrongWidget(
                title: "No notification found !",
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
              onRefresh: () async{
                search();
              },
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: state.folders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        search();
                      },
                      child: FolderItemWidget(
                        folderEntity: state.folders[index],
                        index: index,
                      ),
                    );
                  }),
            );
          }
          if (state is FolderInitial) {
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.blackColor),
                          ),
                          child: const CircleAvatar(
                            radius: 37,
                            backgroundColor: AppColors.blackColor,
                            child: CircleAvatar(
                              radius: 35,
                              child: Icon(Icons.folder_copy_outlined),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerLoader(height: screenHeight*0.04,width: screenWidth*0.7,),
                            SizedBox(height: screenHeight*0.01,),
                            ShimmerLoader(height: screenHeight*0.04,width: screenWidth*0.5,),
                            SizedBox(height: screenHeight*0.01,),
                            ShimmerLoader(height: screenHeight*0.04,width: screenWidth*0.4,),
                          ],
                        ),
                      ],
                    ),
                  );
                });
          }
          return SomethingWrongWidget(
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