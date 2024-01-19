import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nike/animation/fadeanimation.dart';
import 'package:nike/data/dummy_data.dart';
import 'package:nike/models/models.dart';
import 'package:nike/theme/custom_app_theme.dart';
import 'package:nike/utils/constants.dart';

import 'components/homeappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppConstantsColor.backgroundColor,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: HomeAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              children: [
                _featuredView(size),
                Container(
                  width: size.width * 0.89,
                  height: size.height * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: availableShoes.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      ShoeModel model = availableShoes[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.005,
                            vertical: size.height * 0.01,
                          ),
                          width: size.width / 1.5,
                          child: Stack(
                            children: [
                              Container(
                                width: size.width / 1.81,
                                decoration: BoxDecoration(
                                  color: model.modelColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                child: FadeAnimation(
                                  delay: 1,
                                  child: Row(
                                    children: [
                                      Text(
                                        model.name,
                                        style: AppThemes.homeProductName,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.3,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite_border),
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 10,
                                child: FadeAnimation(
                                  delay: 1.5,
                                  child: Text(
                                    model.model,
                                    style: AppThemes.homeProductModel,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 10,
                                child: FadeAnimation(
                                  delay: 2,
                                  child: Text(
                                    "\$${model.price.toStringAsFixed(2)}",
                                    style: AppThemes.homeProductPrice,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 30,
                                child: FadeAnimation(
                                  delay: 2,
                                  child: Hero(
                                    tag: model.imgAddress,
                                    child: RotationTransition(
                                      turns: AlwaysStoppedAnimation(-30 / 360),
                                      child: SizedBox(
                                        width: 250,
                                        height: 300,
                                        child: Image(
                                          image: AssetImage(model.imgAddress),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuredView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          width: size.width / 16,
          height: size.height / 2.4,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfFeatured = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfFeatured == index ? 21 : 18,
                        color: selectedIndexOfFeatured == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexOfFeatured == index
                            ? FontWeight.w500
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexOfCategory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: selectedIndexOfCategory == index ? 21 : 18,
                      color: selectedIndexOfCategory == index
                          ? AppConstantsColor.darkTextColor
                          : AppConstantsColor.unSelectedTextColor,
                      fontWeight: selectedIndexOfCategory == index
                          ? FontWeight.w500
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
