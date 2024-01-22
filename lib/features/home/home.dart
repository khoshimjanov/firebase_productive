// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:productive/features/create/presentation/creade_screen.dart';

import 'package:productive/features/home/navbar.dart';
import 'package:productive/features/home/widgets/modal_model.dart';
import 'package:productive/features/tasks/presentation/bloc/task_bloc.dart';

import '../../assets/constants/colors.dart';
import '../../assets/constants/icons.dart';
import 'navigator.dart';
import 'widgets/nav_bar_item.dart';

enum NavItemEnum { tasks, expenses, create, calendar, stats }

class HomeScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;
  late double navBarWidth;
  List<ModelBottomShet> ls = [
    ModelBottomShet(icon: AppIcons.incomeCenter, text: "Income"),
    ModelBottomShet(icon: AppIcons.expance, text: "Expance"),
    ModelBottomShet(icon: AppIcons.taskModal, text: "Tasks"),
    ModelBottomShet(icon: AppIcons.modalNotes, text: "Notes"),
    ModelBottomShet(icon: AppIcons.modalEvent, text: "Event"),
  ];

  late AnimationController controller;
  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.tasks: GlobalKey<NavigatorState>(),
    NavItemEnum.expenses: GlobalKey<NavigatorState>(),
    NavItemEnum.create: GlobalKey<NavigatorState>(),
    NavItemEnum.calendar: GlobalKey<NavigatorState>(),
    NavItemEnum.stats: GlobalKey<NavigatorState>(),
  };

  List<NavBar> labels = [];

  int _currentIndex = 0;
  int currentPage = 0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _controller = TabController(length: 5, vsync: this);
    controller.addListener(() {});
    _controller.addListener(onTabChange);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTabChange() {
    setState(() => _currentIndex = _controller.index);
  }

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    labels = const [
      NavBar(id: 0, icon: AppIcons.tasks, title: "Tasks"),
      NavBar(id: 1, icon: AppIcons.expense, title: "Expense"),
      NavBar(id: 2, icon: AppIcons.create, title: "Create"),
      NavBar(id: 3, icon: AppIcons.calendar, title: "Calendar"),
      NavBar(id: 4, icon: AppIcons.stats, title: "Stats"),
    ];

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state.status == AuthenticationStatus.unauthenticated){
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
        }
      },
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: white,
        ),
        child: HomeTabControllerProvider(
          controller: _controller,
          child: WillPopScope(
            onWillPop: () async {
              final isFirstRouteInCurrentTab =
                  !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                      .currentState!
                      .maybePop();
              if (isFirstRouteInCurrentTab) {
                if (NavItemEnum.values[_currentIndex] != NavItemEnum.tasks) {
                  changePage(0);
                  return false;
                }
              }
              return isFirstRouteInCurrentTab;
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              bottomNavigationBar: Container(
                height: 75 + MediaQuery.of(context).padding.bottom,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: navigationBarBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1F211C).withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, -4),
                    )
                  ],
                ),
                child: TabBar(
                  enableFeedback: true,
                  onTap: (index) {},
                  indicator: const BoxDecoration(),
                  controller: _controller,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    TabItemWidget(
                      onActiveTap: () {
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]
                            ?.currentState
                            ?.popUntil((route) => route.isFirst);
                      },
                      isActive: _currentIndex == 0,
                      item: labels[0],
                    ),
                    TabItemWidget(
                      onActiveTap: () {
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]
                            ?.currentState
                            ?.popUntil((route) => route.isFirst);
                      },
                      isActive: _currentIndex == 1,
                      item: labels[1],
                    ),
                    TabItemWidget(
                      onActiveTap: () {
                        modalButtom(context);
                      },
                      isActive: _currentIndex == 2,
                      item: labels[2],
                    ),
                    TabItemWidget(
                      onActiveTap: () {
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]
                            ?.currentState
                            ?.popUntil((route) => route.isFirst);
                      },
                      isActive: _currentIndex == 3,
                      item: labels[3],
                    ),
                    TabItemWidget(
                      onActiveTap: () {
                        _navigatorKeys[NavItemEnum.values[_currentIndex]]
                            ?.currentState
                            ?.popUntil((route) => route.isFirst);
                      },
                      isActive: _currentIndex == 4,
                      item: labels[4],
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildPageNavigator(NavItemEnum.tasks),
                  _buildPageNavigator(NavItemEnum.expenses),
                  _buildPageNavigator(NavItemEnum.create),
                  _buildPageNavigator(NavItemEnum.calendar),
                  _buildPageNavigator(NavItemEnum.stats),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> modalButtom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModalBottomItem(
                    item: ls[0],
                  ),
                  ModalBottomItem(
                    item: ls[1],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: context.read<TaskBloc>(),
                            child: const CreateScreen(),
                          ),
                        ),
                      );
                    },
                    child: ModalBottomItem(
                      item: ls[2],
                    ),
                  )
                ],
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModalBottomItem(
                    item: ls[3],
                  ),
                  ModalBottomItem(
                    item: ls[4],
                  ),
                ],
              ),
              const Gap(26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AppIcons.close)),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 28,
              )
            ],
          ),
        );
      },
    );
  }
}

class ModalBottomItem extends StatelessWidget {
  final ModelBottomShet item;
  const ModalBottomItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppIcons.income),
            SvgPicture.asset(item.icon),
          ],
        ),
        const Gap(8),
        Text(
          item.text,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}

class HomeTabControllerProvider extends InheritedWidget {
  const HomeTabControllerProvider({
    required Widget child,
    required this.controller,
    Key? key,
  }) : super(key: key, child: child);

  final TabController controller;

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;

  static HomeTabControllerProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>()!;
}
