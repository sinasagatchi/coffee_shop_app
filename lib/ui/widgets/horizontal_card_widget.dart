import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';
import 'package:flutter_coffee_shop_app/ui/widgets/custom_filledbutton.dart';

class HorizontalCardWidget extends StatelessWidget {
  const HorizontalCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 9,
          end: 15,
          top: 9,
          bottom: 9,
        ),
        height: 98,
        decoration: const BoxDecoration(
          color: Apptheme.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(23)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 147,
              height: 85,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://i.imgur.com/wV5AoUV.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.featuredArticleTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Apptheme.cardTitleMedium,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.coffee_rounded,
                        color: Apptheme.iconColor,
                      ),
                      const Spacer(),
                      CustomFilledButton(
                        onTap: () {},
                        height: 34,
                        width: 33,
                        color: Apptheme.buttonBackground1Color,
                        child: Tooltip(
                          message: l10n.featuredArticleActionTooltip,
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.paperplane_fill,
                              color: Apptheme.mocha,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
