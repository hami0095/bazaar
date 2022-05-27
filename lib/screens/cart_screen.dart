import 'package:bazaar/widgets/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '${cart.totalAmount}',
                      style: const TextStyle(
                        color: Colors.white,
                        // fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: const Text('Order Now'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => CartItems(
              id: cart.items.values.toList()[index].id,
              title: cart.items.values.toList()[index].title,
              price: cart.items.values.toList()[index].price,
              quantity: cart.items.values.toList()[index].quantity,
              productId: cart.items.keys.toList()[index],
            ),
            itemCount: cart.items.length,
          ))
        ],
      ),
    );
  }
}
