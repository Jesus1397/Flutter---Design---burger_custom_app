import 'package:flutter/material.dart';

class IngredientWidget extends StatelessWidget {
  final String name;
  final String image;
  final bool selected;
  final Function onTap;

  const IngredientWidget({
    Key key,
    @required this.name,
    @required this.image,
    @required this.selected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 60,
                height: 60,
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selected ? Color(0xffEFE3D2) : Color(0xffF8F1E8),
                ),
                child: selected
                    ? Image(
                        image: AssetImage(image),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            colorFilter: ColorFilter.mode(
                              Color(0xffEFE3D2).withOpacity(0.5),
                              BlendMode.dstATop,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: selected ? Color(0xff90272F) : Color(0xffA48770),
                ),
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              onTap: onTap,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              child: Text(
                name,
                style: TextStyle(
                  color:
                      selected ? Colors.black : Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
