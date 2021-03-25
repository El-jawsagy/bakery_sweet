// screen of app to navigator to it
import 'package:bakery_sweet/widgets/bottons_and_text_fields_materials.dart';

import '../views/product/product_details_screen.dart';

//theme and colors
import '../theme/theme.dart';

//pub and core package
import 'package:flutter/material.dart';

class ProductCeil extends StatelessWidget {
  final Map product;
  const ProductCeil({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigator to product screen witth product id
        Navigator.pushNamed(
          context,
          ProductDetails.routeNamed,
          arguments: product["id"],
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 6,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              7,
            ),
            color: CustomColors.backgroundCatColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  product["image"],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.19,
                  fit: BoxFit.cover,
                ),
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      product["title"],
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      Icons.star,
                      size: 20,
                      color: CustomColors.mainColor,
                    ),
                  ),
                  Text(
                    product["rating"].toString(),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: CustomColors.mainColor,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        product["subtitle"],
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              giveHeightSpace(
                ctx: context,
                heightFactor: 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
