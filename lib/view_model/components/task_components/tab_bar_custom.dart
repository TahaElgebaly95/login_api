import 'package:flutter/material.dart';

class TabBarCustom extends StatelessWidget {
  const TabBarCustom({required this.tabs, required this.children, super.key});

  final List<Widget> tabs;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              labelStyle: const TextStyle(fontSize: 20),
              labelColor: Colors.amber,
              tabs: tabs),
          const SizedBox(height: 15),
          Expanded(
            child: TabBarView(children: children),
          ),
        ],
      ),
    );
  }
}
