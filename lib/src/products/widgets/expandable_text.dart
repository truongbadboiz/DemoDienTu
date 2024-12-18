import 'package:appdientune/common/utils/kcolors.dart';
import 'package:appdientune/common/widgets/app_style.dart';
import 'package:appdientune/src/products/controllers/product_notifiler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpandableText extends StatelessWidget {
  const ExpandableText({super.key,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,textAlign:TextAlign.justify,
          maxLines: !context.watch<ProductNotifier>().description? 3:10,
          style: appStyle(13, Kolors.kGray, FontWeight.normal),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                context.read<ProductNotifier>().setDescription();
    },
              child: Text(!context.watch<ProductNotifier>().description? " View more":"View less",
              style: appStyle(13, Kolors.kGray, FontWeight.normal)
              )
    )
    ],
        )
      ],
    );
  }
}
