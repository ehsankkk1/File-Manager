import 'package:file_manager/features/auth/presentation/bloc/user/user_bloc.dart';
import 'package:file_manager/utility/global_widgets/elevated_button_widget.dart';
import 'package:file_manager/utility/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/router/app_routes.dart';
import '../../../../utility/theme/color_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoggedState) {
            return ListView(
              padding: const EdgeInsets.all(50),
              children: [
                const Icon(
                  Icons.account_circle_rounded,
                  size: 150,
                  color: AppColors.kSecondColor,
                ),
                Center(
                  child: Text(
                    state.user.email,
                    style: AppFontStyles.boldH1,
                  ),
                ),
                Center(
                  child: Text(
                    state.user.fullName,
                    style: AppFontStyles.boldH1,
                  ),
                ),
                const SizedBox(height: 100,),
                ElevatedButtonWidget(
                  title: "Log Out",
                  onPressed: (){
                    context.read<UserBloc>().add(LogoutEvent());
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.login, (Route<dynamic> route) => false);
                  },
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
