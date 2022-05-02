import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';

class TabBarSectionView extends StatelessWidget {
  final List<String> tabBarNames;
  final Function(int) onTapTabBar;
  const TabBarSectionView(
    this.onTapTabBar, {
    required this.tabBarNames,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TAB_BAR_HEIGHT,
      child: DefaultTabController(
        length: tabBarNames.length,
        initialIndex: 0,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          onTap: (selectedIndex) {
            onTapTabBar(selectedIndex);
          },
          labelStyle: const TextStyle(fontSize: TEXT_SMALL_2x),
          tabs: tabBarNames
              .map((name) => Tab(
                    text: name,
                  ))
              .toList(),
        ),
      ),
    );
  }
}