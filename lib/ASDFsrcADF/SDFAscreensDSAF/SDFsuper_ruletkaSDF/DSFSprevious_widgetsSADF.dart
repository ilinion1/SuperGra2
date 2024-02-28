import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DFGapp_colorsFDG.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_text_stylesSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDFAscreensDSAF/SDFsuper_ruletkaSDF/SDFsuper_ruletka_screenSDF.dart';

class AEFPreviousHundredASE extends StatelessWidget {
  const AEFPreviousHundredASE({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: AppColorsDSAF.backgroundDSAF,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Остання сотня:',
                style: SEFAAppTextStylesAEF.text14SFC
                    .copyWith(color: AppColorsDSAF.greyDSFV),
              ),
              SizedBox(width: 16.w),
              ...List.generate(
                3,
                (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Image.asset(
                        fruitsImagesAEF[index],
                        width: 24.w,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${index == 0 ? 78 : index == 1 ? 12 : 10}',
                      style: SEFAAppTextStylesAEF.text14SFC,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AEFPreviousWinASEF extends StatelessWidget {
  const AEFPreviousWinASEF({
    super.key,
    required this.rand,
  });

  final Random rand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: AppColorsDSAF.backgroundDSAF,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Text(
                'Попередні виграши:',
                style: SEFAAppTextStylesAEF.text14SFC
                    .copyWith(color: AppColorsDSAF.greyDSFV),
              ),
              SizedBox(width: 16.w),
              ...List.generate(
                6,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Image.asset(
                    fruitsImagesAEF[rand.nextInt(3)],
                    width: 24.w,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
