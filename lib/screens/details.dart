// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sofa_shop/common/const.dart';

import 'package:sofa_shop/entity/product.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.only(left: defaultPadding),
            icon: SvgPicture.asset('assets/icons/back.svg'),
          ),
          title: Text(
            'back'.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Hero(
                        tag: '${product.id}',
                        child: ProductPoster(
                          size: size,
                          product: product,
                        ),
                      ),
                    ),
                    ListOfColor(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2),
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: secondaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2),
                      child: Text(
                        product.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(defaultPadding),
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                decoration: BoxDecoration(
                  color: Color(0xFFFCBF1E),
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/chat.svg',
                      height: 18,
                    ),
                    SizedBox(width: defaultPadding / 2),
                    Text(
                      'Chat',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    TextButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/shopping-bag.svg',
                        height: 18,
                      ),
                      label: Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding),
      height: size.width * .8,
      // color: Colors.red,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: size.width * .7,
            height: size.width * .7,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            product.image,
            width: size.width * .75,
            height: size.width * .75,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class ListOfColor extends StatelessWidget {
  const ListOfColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorDot(
            fillColor: Color(0xFF80989A),
            isSelect: true,
          ),
          ColorDot(
            fillColor: Color(0xFFFF5200),
          ),
          ColorDot(
            fillColor: primaryColor,
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    this.isSelect = false,
    required this.fillColor,
  });
  final bool isSelect;
  final fillColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2.5),
      padding: EdgeInsets.all(3.0),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelect ? Color(0xFF707070) : Colors.transparent,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: fillColor),
      ),
    );
  }
}
