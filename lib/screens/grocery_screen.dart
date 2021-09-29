import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:provider/provider.dart';
import 'empty_grocery_screen.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';
class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return GroceryItemScreen(
              onCreate: (item){
                manager.addItem(item);
                Navigator.pop(context);
              },
            );
          }));
        },
        child: const Icon(Icons.add),
      ),
      body: buildGroceryScreen(context),
    );
  }
  Widget buildGroceryScreen(BuildContext context) {
    return Consumer<GroceryManager>(builder: (context, manager, child){
      if(manager.groceryItems.isNotEmpty) {
        return GroceryListScreen(manager: manager,);
      } else {
        return  const EmptyGroceryScreen();
      }
    });
  }
}