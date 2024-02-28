import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DFGapp_colorsFDG.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_imagesSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_text_stylesSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/SADFcustom_buttonASDF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/DFAmoney_controllerSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDFAscreensDSAF/SADFsettings_screenBXF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDFAscreensDSAF/SDFsuper_ruletkaSDF/SDFsuper_ruletka_screenSDF.dart';

class SDRGMainScreenDGSD extends StatelessWidget {
  const SDRGMainScreenDGSD({super.key});

  Widget openScreen(int index) {
    return switch (index) {
      0 => const AEFSuperRuletkaScreenAWFE(),
      // 1 => const SuperSaperScreen(),
      // 2 => const WheelGameScreen(),
      // 3 => const FortuneNumberScreen(),
      _ => const AEFSuperRuletkaScreenAWFE(),
    };
  }

  String nameScreens(int index) {
    return switch (index) {
      0 => 'Супер Рулетка',
      1 => 'Супер Сапер',
      2 => 'Щасливе колесо',
      3 => 'Цифри на удачу',
      _ => 'Супер Рулетка',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          children: [
            SizedBox(width: 16.w),
            SvgPicture.asset(SEAFAppIconsFAE.logoRRSR),
            SizedBox(width: 16.w),
            Text('Супер Гра', style: SEFAAppTextStylesAEF.header16DGD)
          ],
        ),
        actions: [
          Row(
            children: [
              SvgPicture.asset(SEAFAppIconsFAE.coinFSA),
              SizedBox(width: 4.w),
              BlocBuilder<SAFEMoneyCubitASEF, int>(
                builder: (context, state) {
                  return Text('$state', style: SEFAAppTextStylesAEF.text14SFC);
                },
              ),
              SizedBox(width: 16.w),
              IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: AppColorsDSAF.backgroundDSAF),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SAFSettingsScreenAEFS(),
                  ),
                ),
                icon:
                    SvgPicture.asset(SEAFAppIconsFAE.settingsAESF, width: 24.w),
              ),
              SizedBox(width: 16.w),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: <Widget>[
              ...List.generate(
                1,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 9.h),
                  child: Stack(
                    children: [
                      Image.asset(
                        'super_gra_pro_assets/super_gra_pro_images/progame_${index + 1}.png',
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 17.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameScreens(index),
                              style: (index == 1)
                                  ? SEFAAppTextStylesAEF.header16DGD.copyWith(
                                      color: Colors.black,
                                    )
                                  : SEFAAppTextStylesAEF.header16DGD,
                            ),
                            SizedBox(height: 23.h),
                            DFASuperCustomButtonSDFA(
                              text: 'Грати',
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => openScreen(index),
                                ),
                              ),
                              isSmall: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
