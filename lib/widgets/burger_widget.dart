import 'package:burger_custom_app/db/ingredients_db.dart';
import 'package:flutter/material.dart';

class BurgerWidget extends StatelessWidget {
  const BurgerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 500,
        child: Stack(
          children: [
            Positioned(
              top: -30,
              left: 0,
              right: 0,
              child: Container(
                height: 500,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: ingredientsList.length,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    var ingredient = ingredientsList[index];
                    return Align(
                      heightFactor: 0.6,
                      alignment: Alignment.topCenter,
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        height: ingredient.selected ? 100 : 0,
                        padding: EdgeInsets.only(
                          right: 20,
                        ),
                        child: Image(
                          image: AssetImage(
                            ingredient.image,
                          ),
                          width: ingredient.width,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
