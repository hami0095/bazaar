import 'package:bazaar/Provider/productsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/themes_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = 'product-detail';

  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments;
    final productItem = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findByID(productId.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Provider.of<ThemesProvider>(context).themeMode == ThemeMode.dark
                ? Colors.black87
                : Colors.white,
        title: Text(
          productItem.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              height: 400,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                  productItem.imageUrl,
                ),
              ),
            ),
            Divider(color: Theme.of(context).dividerColor),
            const SizedBox(height: 10),
            Text(
              '\$ ${productItem.price}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Divider(color: Theme.of(context).dividerColor),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                '${productItem.description}',
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
