import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/entities/coffee.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';
import 'package:flutter_coffee_shop_app/ui/screens/detail_screen.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';
import 'package:flutter_coffee_shop_app/ui/widgets/custom_filledbutton.dart';

class VerticalCardWidget extends StatelessWidget {
  final Coffee coffee;

  const VerticalCardWidget({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  void _openDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(coffee: coffee),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 22),
      child: Container(
        padding: const EdgeInsets.all(9),
        width: 140,
        decoration: const BoxDecoration(
          color: Apptheme.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(23)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _openDetails(context),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    height: 144,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.network(
                          coffee.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        alignment: Alignment.center,
                        width: 55,
                        height: 25,
                        decoration: const BoxDecoration(
                          color: Apptheme.detailOverlay,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Apptheme.reviewIconColor,
                              size: 15,
                            ),
                            Text(
                              coffee.rating.toString(),
                              style: Apptheme.reviewRatting,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            GestureDetector(
              onTap: () => _openDetails(context),
              child: Text(
                coffee.name,
                style: Apptheme.cardTitleSmall,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              coffee.ingredients,
              style: Apptheme.cardSubtitleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Text('\$', style: Apptheme.priceCurrencySmall),
                const SizedBox(width: 3),
                Text(
                  coffee.price.toString(),
                  style: Apptheme.priceValueSmall,
                ),
                const Spacer(),
                CustomFilledButton(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context)!
                              .coffeeSelectedPreview(coffee.name),
                        ),
                      ),
                    );
                  },
                  height: 31,
                  width: 34,
                  color: Apptheme.buttonBackground1Color,
                  child: Tooltip(
                    message: AppLocalizations.of(context)!.coffeeAddTooltip,
                    child: const Icon(
                      Icons.add,
                      color: Apptheme.mocha,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
