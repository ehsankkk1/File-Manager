import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utility/theme/color_style.dart';
import '../../../utility/theme/text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize{
  const AppBarWidget({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(128);
  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kMainColor100,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25)),
      ),
      child: SizedBox(
        height: 128,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth * 0.06),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: AppColors.kWhiteColor, shape: BoxShape.circle),
                // child: IconButton(
                //   onPressed: () {},
                //   //color:AppColors.kWhiteColor,
                //   icon: SvgPicture.asset(Assets.imagesNotification),
                // ),
              ),
              Row(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("اهلا مجددا",
                          style: AppFontStyles.regularH4
                              .copyWith(color: AppColors.kBackGroundColor)),
                      Text("جون دوه",
                          style: AppFontStyles.mediumH2
                              .copyWith(color: AppColors.kBackGroundColor)),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                        color: AppColors.kWhiteColor,
                        shape: BoxShape.circle),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
