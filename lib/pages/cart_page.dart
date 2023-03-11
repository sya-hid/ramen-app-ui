import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramen_app_ui/consts.dart';
import 'package:ramen_app_ui/models/cart_model.dart';
import 'package:ramen_app_ui/provider/cart_provider.dart';
import 'package:ramen_app_ui/widgets/cart_item.dart';
import 'package:ramen_app_ui/widgets/fade_in_animation.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> carts = cartProvider.carts.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
        title: Text(
          'My Cart',
          style: roboto.copyWith(color: black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0,
      ),
      backgroundColor: bgColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                      carts.length,
                      (index) => Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              top: index == 0 ? 30 : 0,
                              right: 25,
                              left: 25,
                              bottom: 30),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              FadeInAnimation(
                                  durationInMs: (index + 1) * 500,
                                  animationPosition: AnimationPosition(
                                    topAfter: 0,
                                    topBefore: 30,
                                  ),
                                  child: CartItem(cart: carts[index])),
                            ],
                          )))
                ],
              ),
            ),
          ),
          Container(
            color: white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Delivery',
                        style: roboto.copyWith(
                            fontSize: 20,
                            color: black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DottedLine(
                        dashLength: 7,
                        dashColor: black.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '\$5.99',
                      style: roboto.copyWith(
                          color: orange,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text('Total Order',
                        style: roboto.copyWith(
                            fontSize: 20,
                            color: black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DottedLine(
                        dashLength: 7,
                        dashColor: black.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '\$${(cartProvider.totalCart()).toStringAsFixed(2)}',
                      style: roboto.copyWith(
                          color: orange,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: black,
                  height: 72,
                  minWidth: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    'Pay \$${(cartProvider.totalCart() + 5.99).toStringAsFixed(2)}',
                    style: poppins.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
