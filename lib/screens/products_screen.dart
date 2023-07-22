import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/controller/cubit/cubit/shop_data_states.dart';

import '../controller/cubit/cubit/shop_data_cubit.dart';
import '../data/model/shop_home_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: ShopCubit.get(context).shopHomeModel != null,
              builder: (context) =>
                  ProductsBuilder(ShopCubit.get(context).shopHomeModel!),
              fallback: (context) =>
                  Center(child: CircularProgressIndicator()));
        });
  }

  Widget ProductsBuilder(ShopHomeModel model) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              // لاستخراج من الموديل ليست اوف ويدجيت لابد من عمل عليها ماب كما هو موضح
              items: model.data!.banners!
                  .map((e) => Image(image: NetworkImage('${e.image}')))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  initialPage: 0,
                  height: 200,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 1.0),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 1/1.3,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(model.data!.products!.length, (index) =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [

                           Container(
                             width: double.infinity,
                             height: 200,
                             color: Colors.white,
                             child: Image(
                               image: NetworkImage('${model.data!.products![index].image}'),width: double.infinity,height: 200,),
                           ) ,
                            if(model.data!.products![index].discount!=0)
                              Container(
                                color: Colors.red,
                                child: Text('discount',style: TextStyle(color: Colors.white),),
                              ),
                          ],
                        ),
                        Text('${model.data!.products![index].name}',overflow: TextOverflow.ellipsis,),
                        Row(
                          children: [
                            Text('${model.data!.products![index].price}',style: TextStyle(color: Colors.lightBlueAccent),),
                            SizedBox(width: 10,),

                              Text('${model.data!.products![index].oldPrice}'),

                          ],
                        )
                      ],
                    )
                ),
              ),
            )
          ],
        ),
      );

}
