import 'package:file_manager/utility/app_bloc_observer.dart';
import 'package:file_manager/utility/constant_logic_validations.dart';
import 'package:file_manager/utility/dependency_injection/injection_container.dart';
import 'package:file_manager/utility/router/app_router.dart';
import 'package:file_manager/utility/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> main() async {
  await initGlobalGetIt();

  Bloc.observer = MyBlocObserver();

  runApp(MyApp(appRouter: AppRouter()),);
}

class EasyLocalization {
}

class MyApp extends StatelessWidget {
  AppRouter appRouter;
  MyApp({required this.appRouter,super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: globalUserBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppStyle.theme,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
