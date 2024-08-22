import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:swapi/config/constants.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () => GoRouter.of(context).goNamed('home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_SECONDARY,
      child: Center(
        child: Image.asset(
          LOGO_PATH,
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.7,
        ),
      ),
    );
  }
}
