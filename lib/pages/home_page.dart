import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ramen_app_ui/consts.dart';
import 'package:ramen_app_ui/models/category_model.dart';
import 'package:ramen_app_ui/models/product_model.dart';
import 'package:ramen_app_ui/pages/cart_page.dart';
import 'package:ramen_app_ui/provider/cart_provider.dart';
import 'package:ramen_app_ui/widgets/category_item.dart';
import 'package:ramen_app_ui/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 0;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Your Location',
                            style: roboto.copyWith(
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.bold)),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: black,
                          size: 20,
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: orange,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text('Shibuya, Japan',
                            style: roboto.copyWith(
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: black),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.search, color: black)),
                  const SizedBox(width: 10),
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: black),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.shopping_cart_outlined,
                              color: black)),
                      cartProvider.carts.isNotEmpty
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CartPage(),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: orange, shape: BoxShape.circle),
                                  child: Text(
                                    cartProvider.carts.length.toString(),
                                    style: roboto.copyWith(
                                        color: white, fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Let\'s finds the best food arround you',
            style: roboto.copyWith(
                color: black,
                fontSize: 32,
                height: 1.3,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Find by Category',
                style: roboto.copyWith(
                    fontSize: 22, fontWeight: FontWeight.bold, color: black),
              ),
              Text(
                'See All',
                style: roboto.copyWith(color: orange),
              )
            ],
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  categories.length,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentCategory = index;
                          });
                        },
                        child: CategoryItem(
                          selected: currentCategory == index,
                          category: categories[index],
                        ),
                      ))
            ],
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Result (${productModel.length})',
            style: roboto.copyWith(color: black.withOpacity(0.8)),
          ),
        ),
        const SizedBox(height: 30),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              ...List.generate(
                  productModel.length,
                  (index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(left: 25, right: 25)
                            : const EdgeInsets.only(right: 25),
                        child: ProductItem(
                          product: productModel[index],
                        ),
                      ))
            ],
          ),
        )
      ],
    );
  }
}
