import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/main.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';
import 'package:flutter_coffee_shop_app/ui/widgets/horizontal_card_widget.dart';
import 'package:flutter_coffee_shop_app/ui/widgets/vertical_card_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Uint8List imageBytes;

  setUpAll(() async {
    HttpOverrides.global = _ImageHttpOverrides(() => imageBytes);

    final recorder = ui.PictureRecorder();
    Canvas(recorder).drawRect(
      const Rect.fromLTWH(0, 0, 1, 1),
      Paint()..color = const Color(0x00000000),
    );
    final image = await recorder.endRecording().toImage(1, 1);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    imageBytes = byteData!.buffer.asUint8List();
    image.dispose();
  });

  tearDownAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('all existing screens scroll on a short viewport', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 360);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('Get Started'),
      100,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();
    expect(tester.getRect(find.text('Get Started')).bottom,
        lessThanOrEqualTo(360));

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    final lastFeaturedCard = find.byType(HorizontalCardWidget).last;
    await tester.ensureVisible(lastFeaturedCard);
    await tester.pumpAndSettle();
    expect(
      tester.getRect(lastFeaturedCard).bottom,
      lessThanOrEqualTo(
        tester.getRect(find.byType(SingleChildScrollView).first).bottom,
      ),
    );

    final firstCoffeeCard = find.byType(VerticalCardWidget).first;
    await tester.ensureVisible(
      find.descendant(
        of: firstCoffeeCard,
        matching: find.text('Americano'),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: firstCoffeeCard,
        matching: find.text('Americano'),
      ),
    );
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Buy Now'));
    await tester.pumpAndSettle();
    expect(
      tester.getRect(find.text('Buy Now')).bottom,
      lessThanOrEqualTo(360),
    );
  });

  testWidgets(
      'language switching, localization, theme, and existing navigation work',
      (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.locale, const Locale('en'));
    expect(app.theme!.colorScheme.primary, Apptheme.espresso);
    expect(app.theme!.colorScheme.secondary, Apptheme.sage);
    expect(app.theme!.scaffoldBackgroundColor, Apptheme.mocha);
    expect(
      Directionality.of(tester.element(find.text('Get Started'))),
      TextDirection.ltr,
    );
    expect(find.text('Rise and Savor the Coffee'), findsOneWidget);

    expect(
      tester
          .widgetList<Scrollable>(find.byType(Scrollable))
          .first
          .axisDirection,
      AxisDirection.right,
    );

    await tester.scrollUntilVisible(
      find.text('Get Started'),
      100,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Find the best'), findsOneWidget);
    expect(find.text('Find your coffee...'), findsOneWidget);
    expect(find.text('EN'), findsOneWidget);
    expect(find.text('TR'), findsOneWidget);
    expect(
      tester
          .widgetList<Semantics>(
            find.ancestor(
              of: find.text('EN'),
              matching: find.byType(Semantics),
            ),
          )
          .any((semantics) => semantics.properties.selected == true),
      isTrue,
    );

    final firstCoffeeCard = find.byType(VerticalCardWidget).first;
    final card = tester.widget<Container>(
      find
          .descendant(of: firstCoffeeCard, matching: find.byType(Container))
          .first,
    );
    expect((card.decoration! as BoxDecoration).color, Apptheme.vanilla);

    expect(
      tester
          .widgetList<Scrollable>(find.byType(Scrollable))
          .where(
              (scrollable) => scrollable.axisDirection == AxisDirection.right)
          .length,
      greaterThanOrEqualTo(2),
    );
    expect(find.byType(HorizontalCardWidget), findsNWidgets(10));
    final lastFeaturedCard = find.byType(HorizontalCardWidget).last;
    await tester.ensureVisible(lastFeaturedCard);
    await tester.pumpAndSettle();
    expect(
      tester.getRect(lastFeaturedCard).bottom,
      lessThanOrEqualTo(
          tester.getRect(find.byType(SingleChildScrollView)).bottom),
    );
    await tester.ensureVisible(find.text('TR'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Latte');
    await tester.pumpAndSettle();
    expect(find.byType(VerticalCardWidget), findsOneWidget);

    await tester.tap(find.text('TR'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).locale,
      const Locale('tr', 'TR'),
    );
    expect(find.text('Size en uygun'), findsOneWidget);
    expect(find.text('Kahvenizi bulun...'), findsOneWidget);
    expect(find.text('Tümü'), findsOneWidget);
    expect(find.byType(VerticalCardWidget), findsOneWidget);
    expect(
      tester.widget<EditableText>(find.byType(EditableText)).controller.text,
      'Latte',
    );
    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();
    expect(
      tester
          .widgetList<Semantics>(
            find.ancestor(
              of: find.text('TR'),
              matching: find.byType(Semantics),
            ),
          )
          .any((semantics) => semantics.properties.selected == true),
      isTrue,
    );
    expect(
      Directionality.of(tester.element(find.text('Size en uygun'))),
      TextDirection.ltr,
    );

    await tester.tap(find.byIcon(Icons.widgets));
    await tester.pumpAndSettle();
    expect(find.text('Kahvenin Tadını Çıkarın'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.text('Başlayın'))),
      TextDirection.ltr,
    );
    await tester.tap(find.text('Başlayın'));
    await tester.pumpAndSettle();
    expect(find.text('Size en uygun'), findsOneWidget);

    final firstCoffeeTitle = find.descendant(
      of: find.byType(VerticalCardWidget).first,
      matching: find.text('Americano'),
    );
    await tester.ensureVisible(firstCoffeeTitle);
    await tester.pumpAndSettle();
    await tester.tap(
      firstCoffeeTitle,
    );
    await tester.pumpAndSettle();

    expect(find.text('Açıklama'), findsOneWidget);
    expect(find.text('Satın Al'), findsOneWidget);
    expect(find.text('Kremalı'), findsOneWidget);
    expect(
      find.textContaining('Americano, espressoya sıcak su eklenerek'),
      findsOneWidget,
    );
    final favoriteButton = find.byIcon(Icons.favorite_border);
    await tester.tap(favoriteButton);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    await tester.ensureVisible(find.text('Devamını Oku'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Devamını Oku'));
    await tester.pumpAndSettle();
    expect(find.text('Daha Az Göster'), findsOneWidget);
    await tester.ensureVisible(find.text('Daha Az Göster'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Daha Az Göster'));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('M'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('M'));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Satın Al'));
    await tester.pumpAndSettle();
    expect(
      tester.getRect(find.text('Satın Al')).bottom,
      lessThanOrEqualTo(
        tester.getRect(find.byType(SingleChildScrollView).last).bottom,
      ),
    );
    await tester.tap(find.text('Satın Al'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Americano (M) seçildi. Sipariş özelliği yalnızca önizlemedir.',
      ),
      findsOneWidget,
    );

    await tester.ensureVisible(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.text('Size en uygun'), findsOneWidget);

    await tester.ensureVisible(find.text('EN'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('EN'));
    await tester.pumpAndSettle();
    expect(find.text('Find the best'), findsOneWidget);
    expect(find.text('Find your coffee...'), findsOneWidget);
    expect(
      tester
          .widgetList<Semantics>(
            find.ancestor(
              of: find.text('EN'),
              matching: find.byType(Semantics),
            ),
          )
          .any((semantics) => semantics.properties.selected == true),
      isTrue,
    );

    await tester.enterText(find.byType(TextField), 'Latte');
    await tester.pumpAndSettle();
    expect(find.byType(VerticalCardWidget), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(VerticalCardWidget),
        matching: find.text('Americano'),
      ),
      findsNothing,
    );
    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byIcon(Icons.widgets));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.widgets));
    await tester.pumpAndSettle();
    expect(find.text('Rise and Savor the Coffee'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Get Started'),
      100,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();
    expect(find.text('Find the best'), findsOneWidget);
    final espressoCategory = find.descendant(
      of: find.byType(ListView).first,
      matching: find.text('Espresso'),
    );
    await tester.ensureVisible(espressoCategory);
    await tester.pumpAndSettle();
    await tester.tap(espressoCategory);
    await tester.pumpAndSettle();
    expect(find.byType(VerticalCardWidget), findsOneWidget);
    expect(find.text('Find the best'), findsOneWidget);

    final coffeeCard = find.byType(VerticalCardWidget).first;
    await tester.tap(
      find.descendant(of: coffeeCard, matching: find.text('Espresso')),
    );
    await tester.pumpAndSettle();
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Buy Now'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.text('Description'))),
      TextDirection.ltr,
    );
  });
}

class _ImageHttpOverrides extends HttpOverrides {
  _ImageHttpOverrides(this._imageBytes);

  final Uint8List Function() _imageBytes;

  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      _ImageHttpClient(_imageBytes);
}

class _ImageHttpClient implements HttpClient {
  _ImageHttpClient(this._imageBytes);

  final Uint8List Function() _imageBytes;

  @override
  bool autoUncompress = true;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async =>
      _ImageHttpRequest(_imageBytes);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _ImageHttpRequest implements HttpClientRequest {
  _ImageHttpRequest(this._imageBytes);

  final Uint8List Function() _imageBytes;

  @override
  Future<HttpClientResponse> close() async => _ImageHttpResponse(_imageBytes());

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _ImageHttpResponse implements HttpClientResponse {
  _ImageHttpResponse(this._imageBytes);

  final Uint8List _imageBytes;

  @override
  int get contentLength => _imageBytes.length;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  int get statusCode => HttpStatus.ok;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int>)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      Stream<List<int>>.value(_imageBytes).listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError,
      );

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
