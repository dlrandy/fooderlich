import 'package:flutter/material.dart';
import 'package:fooderlich/screens/screens.dart';
import 'package:provider/provider.dart';
import 'models/explore_recipe.dart';
import 'components/components.dart';
import 'models/tab_manager.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
   ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child){
      return Scaffold(
          appBar: AppBar(
              title: Text('Fooderlich',
                  style: Theme.of(context).textTheme.headline6)),
          body: pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
              currentIndex: tabManager.selectedTab,
              onTap: (index){
                tabManager.goToTab(index);
              },
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                    icon: Icon(Icons.explore), label: 'Explore'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.book), label: 'Recipes'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: 'To Buy'),
              ]),);
    });
  }
}
