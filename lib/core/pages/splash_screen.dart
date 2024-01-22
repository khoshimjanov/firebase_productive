import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/core/injector/injector.dart';
import 'package:productive/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false);
        } else if (state.status == AuthenticationStatus.unauthenticated) {
          if (serviceLocator<SharedPreferences>().getBool('wizard') == true) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (_) => false);
          } else {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/onBoarding', (_) => false);
          }
        }
      },
      builder: (context, state) {
        if (state.status == AuthenticationStatus.unknown) {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationGetStatusEvent());
        }
        return Scaffold(
          backgroundColor: splashColor,
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(40),
            child: const CupertinoActivityIndicator(
              radius: 16,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Center(
                child: SvgPicture.asset(AppIcons.logo),
              ),
              const SizedBox(height: 12),
              const Text(
                'Productive',
                style: TextStyle(
                  color: white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
