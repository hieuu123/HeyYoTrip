import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/modules/home/blocs/home_event.dart';
import 'package:heyyo_trip/modules/home/blocs/home_state.dart';
import 'package:heyyo_trip/modules/home/blocs/home_bloc.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        int selectedIndex = (state as BottomNavInitial).selectedIndex;
        return Container(
          decoration: const BoxDecoration(
              border: const Border(
                  top: BorderSide(width: 1, color: Color(0xFFD7D7D7)))),
          child: NavigationBar(
            height: 70,
            backgroundColor: Colors.white,
            indicatorColor: Colors.transparent,
            selectedIndex: selectedIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            onDestinationSelected: (index) {
              context.read<BottomNavBloc>().add(BottomNavItemSelected(index));
              switch (index) {
                case 0:
                  context.go('/');
                  break;
                case 1:
                  context.go('/hot-deals');
                  break;
                case 2:
                  context.go('/bookings');
                  break;
                case 3:
                  context.go('/account');
                  break;
              }
            },
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset('assets/icons/home-unselected.svg'),
                selectedIcon:
                    SvgPicture.asset('assets/icons/home-selected.svg'),
                label: 'Home',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                    'assets/icons/hot-deals-unselected.svg'),
                selectedIcon:
                    SvgPicture.asset('assets/icons/hot-deals-selected.svg'),
                label: 'Hot Deals',
              ),
              NavigationDestination(
                icon:
                    SvgPicture.asset('assets/icons/bookings-unselected.svg'),
                selectedIcon:
                    SvgPicture.asset('assets/icons/bookings-selected.svg'),
                label: 'Bookings',
              ),
              NavigationDestination(
                icon:
                    SvgPicture.asset('assets/icons/account-unselected.svg'),
                selectedIcon:
                    SvgPicture.asset('assets/icons/account-selected.svg'),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}