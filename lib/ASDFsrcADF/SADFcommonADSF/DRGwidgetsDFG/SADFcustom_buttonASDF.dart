import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DFGapp_colorsFDG.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_text_stylesSADF.dart';

enum SDAFSuperButtonStyleEnumSDFA { common, cancel }

class DFASuperCustomButtonSDFA extends StatelessWidget {
  const DFASuperCustomButtonSDFA({
    super.key,
    required this.text,
    this.buttonStyleEnum = SDAFSuperButtonStyleEnumSDFA.common,
    this.onPressed,
    this.isSmall = false,
  });

  final String text;
  final SDAFSuperButtonStyleEnumSDFA buttonStyleEnum;
  final VoidCallback? onPressed;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: buttonStyleEnum == SDAFSuperButtonStyleEnumSDFA.common
            ? AppColorsDSAF.mainGradientSAES
            : null,
        color: buttonStyleEnum == SDAFSuperButtonStyleEnumSDFA.cancel
            ? AppColorsDSAF.greyDSFV
            : null,
      ),
      child: SizedBox(
        width: isSmall ? 99.w : double.infinity,
        height: isSmall ? 28.h : 54.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: SEFAAppTextStylesAEF.text14SFC.copyWith(
              color: buttonStyleEnum == SDAFSuperButtonStyleEnumSDFA.cancel
                  ? Colors.black54
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
