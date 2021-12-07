import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softscope/layout/shop_app/cubit/cubit.dart';
import 'package:softscope/layout/shop_app/cubit/states.dart';
import 'package:softscope/models/shop_app/cagetgories_model.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context, state) {},
      builder: ( context, state){
        return  ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context ,index) =>  buildCatItem(ShopCubit.get(context).categoriesModel.data!.data![index]),
          separatorBuilder: (context ,index) => Divider(),
          itemCount: ShopCubit.get(context).categoriesModel.data!.data!.length  ,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(

            child: Image(
              image: NetworkImage(model.image!),
              width: 90.0 ,
              height: 90.0 ,
               fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20.0,),
          Text(
            model.name!,
            style: TextStyle(
              fontSize: 20.0 ,
              fontWeight: FontWeight.bold ,
            ),
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),

        ],
      ),
    );
}
