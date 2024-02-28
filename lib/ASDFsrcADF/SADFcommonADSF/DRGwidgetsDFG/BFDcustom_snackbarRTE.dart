import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DFGapp_colorsFDG.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_imagesSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_text_stylesSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFutilsSAF/DSFgapSADF.dart';

abstract class ASFDCustomSnackbarSADF {
  static SnackBar dFDSFcallSnackbarASDF(int money, BuildContext context) {
    return SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: AppColorsDSAF.blueSGDF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      content: SizedBox(
        height: 56.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                'Увага!',
                style: SEFAAppTextStylesAEF.text14SFC
                    .copyWith(color: Colors.white),
              ),
              const Spacer(),
              Text(
                'Ви вивели: $money',
                style: SEFAAppTextStylesAEF.text14SFC
                    .copyWith(color: Colors.white),
              ),
              Gap.width(4.w),
              SvgPicture.asset(SEAFAppIconsFAE.coinFSA, width: 24.w),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 180.h,
        left: 10.w,
        right: 10.w,
      ),
    );
  }
}
