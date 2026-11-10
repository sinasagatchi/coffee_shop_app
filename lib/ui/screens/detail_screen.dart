import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/entities/coffee.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';
import 'package:flutter_coffee_shop_app/ui/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class DetailScreen extends StatefulWidget {
  final Coffee coffee;

  const DetailScreen({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String selectedSize = 'S';
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final coffee = widget.coffee;
    final l10n = AppLocalizations.of(context)!;
    final imageHeight = (MediaQuery.sizeOf(context).height * 0.42)
        .clamp(240.0, 420.0)
        .toDouble();

    return Scaffold(
      backgroundColor: Apptheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: imageHeight,
                  child: CardImageView(
                    coffee: coffee,
                    isFavorite: isFavorite,
                    onFavoriteTap: () {
                      setState(() => isFavorite = !isFavorite);
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Text(l10n.detailDescription, style: Apptheme.descriptionTitle),
                const SizedBox(height: 15),
                DescriptionView(description: coffee.description),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['S', 'M', 'L'].map((size) {
                    final active = selectedSize == size;
                    return CustomFilledButton(
                      onTap: () {
                        setState(() => selectedSize = size);
                      },
                      width: 91,
                      height: 36,
                      color: active
                          ? Apptheme.buttonBackground1Color
                          : Apptheme.buttonBackground2Color,
                      borderColor: active ? Apptheme.buttonBorderColor : null,
                      child: Text(
                        size,
                        style: active
                            ? Apptheme.buttonActiveTextStyle
                            : Apptheme.buttonInactiveTextStyle,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.detailPrice,
                            style: Apptheme.priceTitleLarge,
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$ ',
                                  style: Apptheme.priceCurrencyLarge,
                                ),
                                TextSpan(
                                  text: coffee.price.toString(),
                                  style: Apptheme.priceValueLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomFilledButton(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                l10n.coffeeSizeSelectedPreview(
                                  coffee.name,
                                  selectedSize,
                                ),
                              ),
                            ),
                          );
                        },
                        width: 188,
                        height: 56,
                        borderRadius: 16,
                        color: Apptheme.buttonBackground1Color,
                        child: Text(
                          l10n.detailBuyNow,
                          style: Apptheme.buttonTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardImageView extends StatelessWidget {
  final Coffee coffee;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const CardImageView({
    super.key,
    required this.coffee,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(coffee.imageUrl, fit: BoxFit.cover),
          ),
        ),
        PositionedDirectional(
          top: 20,
          start: 20,
          child: CustomIconButton(
            onTap: () => Navigator.pop(context),
            width: 38,
            height: 38,
            borderRadius: 10,
            tooltip: AppLocalizations.of(context)!.detailBackTooltip,
            child: const Icon(
              Icons.arrow_back,
              color: Apptheme.iconColor,
            ),
          ),
        ),
        PositionedDirectional(
          top: 20,
          end: 20,
          child: CustomIconButton(
            onTap: onFavoriteTap,
            width: 38,
            height: 38,
            borderRadius: 10,
            tooltip: isFavorite
                ? AppLocalizations.of(context)!.favoriteRemoveTooltip
                : AppLocalizations.of(context)!.favoriteAddTooltip,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Apptheme.iconActiveColor : Apptheme.iconColor,
            ),
          ),
        ),
        BlurCardView(coffee: coffee),
      ],
    );
  }
}

class BlurCardView extends StatelessWidget {
  final Coffee coffee;

  const BlurCardView({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          alignment: Alignment.center,
          height: 152,
          decoration: const BoxDecoration(
            color: Apptheme.detailOverlay,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffee.name,
                            style: Apptheme.cardTitleLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            coffee.ingredients,
                            style: Apptheme.cardSubtitleLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    _infoChip(
                        'assets/icons/coffe.svg', l10n.detailCoffeeIngredient),
                    const SizedBox(width: 10),
                    _infoChip(
                        'assets/icons/milk.svg', l10n.detailMilkIngredient),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Apptheme.reviewIconColor,
                      size: 20,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      coffee.rating.toString(),
                      style: Apptheme.cardTitleSmall,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '(${coffee.reviews})',
                      style: Apptheme.cardSubtitleSmall,
                    ),
                    const Spacer(),
                    Container(
                      width: 103,
                      height: 31,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Apptheme.cardChipBackgroundColor,
                      ),
                      child: Text(
                        l10n.detailRoastLevel,
                        style: Apptheme.cardChipTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoChip(String asset, String label) {
    return Container(
      width: 57,
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Apptheme.cardChipBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(asset, height: 25),
            Text(label, style: Apptheme.cardChipTextStyle),
          ],
        ),
      ),
    );
  }
}

class DescriptionView extends StatefulWidget {
  final String description;

  const DescriptionView({
    super.key,
    required this.description,
  });

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          maxLines: expanded ? null : 3,
          overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: Apptheme.descriptionContent,
        ),
        TextButton(
          onPressed: () {
            setState(() => expanded = !expanded);
          },
          child: Text(expanded ? l10n.detailReadLess : l10n.detailReadMore),
        ),
      ],
    );
  }
}
