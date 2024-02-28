import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AFERollAreaASEF extends StatefulWidget {
  const AFERollAreaASEF({
    super.key,
    required this.controller,
    required this.fruits,
  });

  final ScrollController controller;
  final List<String> fruits;

  @override
  State<AFERollAreaASEF> createState() => _AFERollAreaASEFState();
}

class _AFERollAreaASEFState extends State<AFERollAreaASEF> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 110.h,
          child: ListView(
            controller: widget.controller,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemExtent: 88.w,
            children: List.generate(
              110,
              (index) => Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Image.asset(
                  widget.fruits[index],
                  width: 80.w,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Image.asset(
            'super_gra_pro_assets/super_gra_pro_images/prowinning_line.png',
            height: 110.h,
          ),
        ),
      ],
    );
  }
}
