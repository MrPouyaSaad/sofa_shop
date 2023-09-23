// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sofa_shop/common/const.dart';
import 'package:sofa_shop/entity/product.dart';
import 'package:sofa_shop/screens/details.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          foregroundColor: backgroundColor,
          title: Text('Dashbord'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/notification.svg'),
            ),
          ],
        ),
        body: Column(
          children: [
            SearchBox(
              valueChanged: (value) {},
            ),
            CategoryList(),
            SizedBox(height: defaultPadding / 2),
            ProductCardList(),
          ],
        ),
      ),
    );
  }
}

class ProductCardList extends StatelessWidget {
  const ProductCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) => ProductCard(
              product: products[index],
              itemIndex: index,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.itemIndex,
    required this.onTap,
  }) : super(key: key);
  final Product product;
  final int itemIndex;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    //?
    final size = MediaQuery.sizeOf(context);
    //?
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      height: 160,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            //!
            //? Background Container ------------------------------
            //!
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 136,
                decoration: BoxDecoration(
                  color: itemIndex.isEven ? blueColor : secondaryColor,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [defaultShadow],
                ),
                //!
                //? Forground Container --------------------------
                //!
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
            ),
            //!
            //? Product Image ---------------------------------
            //!
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: '${product.id}',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  height: 160,
                  width: 200,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //!
            //? Product Info -----------------------------------
            //!
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding / 4,
                      ),
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.75),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22.0),
                          bottomLeft: Radius.circular(
                            22.0,
                          ),
                        ),
                      ),
                      child: Text(
                        '\$${product.price}',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//? Search Box Widget

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    this.valueChanged,
  }) : super(key: key);
  final ValueChanged? valueChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.symmetric(
        vertical: defaultPadding / 4,
        horizontal: defaultPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        onChanged: valueChanged,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: SvgPicture.asset('assets/icons/search.svg'),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedItem = 0;
  List categories = ['All', 'Sofa', 'Park bench', 'Armchair'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedItem = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == categories.length - 1 ? defaultPadding : 0),
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: index == selectedItem
                    ? Colors.white.withOpacity(0.4)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
