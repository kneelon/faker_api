import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdax_exam/application/bloc/person/fetch_person/fetch_person_cubit.dart';
import 'package:pdax_exam/presentation/ui/homepage/new_homepage.dart';
import 'package:pdax_exam/presentation/utility/size_config.dart';
import 'package:pdax_exam/presentation/utility/global.dart' as global;
import 'package:pdax_exam/presentation/utility/constants.dart' as constants;
import 'package:pdax_exam/presentation/utility/utils.dart';
import 'application/dependency_injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchPersonCubit>(create: (_) => di.sl<FetchPersonCubit>()),
      ],
      child: MaterialApp(
        title: constants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: global.palette6),
          useMaterial3: true,
        ),
        home: const SplashScreenPage(),
      ),
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  void _delayedFunction(context) {
    Future.delayed(const Duration(seconds: 3), () {
      Utils().pushScreen(context, const NewHomepage());
    });
  }

  @override
  Widget build(BuildContext context) {
    _delayedFunction(context);
    SizeConfig().init(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: global.palette6,
        body: Center(
          child: Image.asset(constants.imgAppLogo),
        )
      ),
    );
  }
}

