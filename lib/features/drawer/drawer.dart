import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';

import '../../../../core/widgets/w_divider.dart';
import '../../assets/constants/colors.dart';
import '../../assets/constants/icons.dart';
import '../../core/widgets/drawer_widget.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      backgroundColor: scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 238,
              top: 67,
              right: 18,
            ),
            child: SvgPicture.asset(AppIcons.sun),
          ),
          const ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            title: Text('Rozan',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w700,
                )),
            subtitle: Text('rozan.hasan.matar115@gmail...',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w400,
                )),
          ),

          const SizedBox(height: 12),

          /// Premium button
          DrawerWidget(
              onTap: () {
                Navigator.pop(context);
              },
              icon: AppIcons.premium,
              title: 'Premium'),
          const Gap(20),

          /// Settings button
          DrawerWidget(
              onTap: () {
                Navigator.pop(context);
              },
              icon: AppIcons.setting,
              title: 'Settings'),
          const Gap(28),

          /// Articles button
          DrawerWidget(
              onTap: () {
                Navigator.pop(context);
              },
              icon: AppIcons.articles,
              title: 'Articles'),
          const Gap(16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: WDivider(),
          ),
          const Gap(16),

          /// Help button
          DrawerWidget(
              onTap: () {
                Navigator.pop(context);
              },
              icon: AppIcons.help,
              title: 'Help'),
          const Gap(24),

          /// Terms button
          DrawerWidget(
              onTap: () {
                Navigator.pop(context);
              },
              icon: AppIcons.terms,
              title: 'Terms'),
          const Gap(24),

          /// FAQ button
          DrawerWidget(
              onTap: () {
                Navigator.pop(context);
              },
              icon: AppIcons.faq,
              title: 'FAQ'),
          MaterialButton(
            onPressed: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequestedEvent());
            },
            color: Colors.red,
            minWidth: double.maxFinite,
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}
