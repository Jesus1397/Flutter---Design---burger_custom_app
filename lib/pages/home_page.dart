import 'package:burger_custom_app/db/ingredients_db.dart';
import 'package:burger_custom_app/widgets/background_widget.dart';
import 'package:burger_custom_app/widgets/bottom_bar_widget.dart';
import 'package:burger_custom_app/widgets/burger_widget.dart';
import 'package:burger_custom_app/widgets/ingredient_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundWidget(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.keyboard_backspace_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      'Customize a burger that suits your taste',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BurgerWidget(),
                        Container(
                          width: 80,
                          height: 500,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: ingredientsList.length,
                            reverse: true,
                            itemBuilder: (BuildContext context, int index) {
                              var ingrient = ingredientsList[index];
                              return index == 0 || index == 7 || index == 2
                                  ? Container()
                                  : IngredientWidget(
                                      name: ingrient.name,
                                      image: ingrient.image,
                                      selected: ingrient.selected,
                                      onTap: () {
                                        setState(() {
                                          ingrient.selected =
                                              !ingrient.selected;
                                        });
                                      },
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
