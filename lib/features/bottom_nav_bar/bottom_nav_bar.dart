import 'package:animations/animations.dart';
import 'package:file_manager/features/bottom_nav_bar/widgets/bottom_nav_bar_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utility/dialogs_and_snackbars/dialogs_yes_no.dart';
import '../../utility/theme/color_style.dart';
import '../../utility/theme/text_styles.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  int selectedIndex = 0;
  bool isReverse = false;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    Future<bool> onWillPopMethod() async {
      return DialogsWidgetsYesNo.onWillPopMethod(context);
    }

    return ColoredBox(
      color: AppColors.kBackGroundColor,
      child: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: onWillPopMethod,
          child: Scaffold(
            // appBar: const AppBarWidget(),

            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.kBackGroundColor,
            bottomNavigationBar: SizedBox(
              height: getWidth * 0.22,
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  labelTextStyle: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppFontStyles.regularH5
                          .copyWith(color: AppColors.kMainColor100);
                    }
                    return AppFontStyles.regularH5
                        .copyWith(color: AppColors.kNavBarGreyColor);
                  }),
                ),
                child: NavigationBar(
                  elevation: 0,
                  backgroundColor: AppColors.kWhiteColor,
                  animationDuration: const Duration(milliseconds: 600),
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onItemTapped,
                  indicatorColor: const Color(0xffE9F9EE),
                  destinations: const [
                    NavigationDestination(
                      selectedIcon:Icon(
                        Icons.folder,
                        color: AppColors.kMainColor100,
                      ),
                      icon: Icon(
                        Icons.folder,
                        color: AppColors.kGreyColor,
                      ),
                      label: 'All Folders',
                    ),
                    NavigationDestination(
                      selectedIcon:Icon(
                        Icons.folder_shared_rounded,
                        color: AppColors.kMainColor100,
                      ),
                      icon:Icon(
                        Icons.folder_shared_rounded,
                        color: AppColors.kGreyColor,
                      ),
                      label: 'My Folders',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(
                        Icons.person,
                        color: AppColors.kMainColor100,
                      ),
                      icon: Icon(
                        Icons.person,
                        color: AppColors.kGreyColor,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
            body: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: _transitionType,
                  child: child,
                );
              },
              child: GetSelectedScreenByIndex(
                screenIndex: selectedIndex,
                key: Key(selectedIndex.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      if (index > selectedIndex) {
        isReverse = false;
      } else {
        isReverse = true;
      }
      selectedIndex = index;
    });
  }
}
