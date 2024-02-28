import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DFGapp_colorsFDG.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_imagesSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_text_stylesSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFutilsSAF/DSFgapSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/BFDcustom_snackbarRTE.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/GFHcustom_text_fieldHGF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/SADFblock_button_controllerSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/DFAmoney_controllerSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDFAscreensDSAF/SDFsuper_ruletkaSDF/SDFsuper_ruletka_screenSDF.dart';

enum SGRSSaperItemsAEF { friend, enemy }

class ERGEFortuneNumberScreenSGR extends StatefulWidget {
  const ERGEFortuneNumberScreenSGR({super.key});

  @override
  State<ERGEFortuneNumberScreenSGR> createState() =>
      _ERGEFortuneNumberScreenSGRState();
}

class _ERGEFortuneNumberScreenSGRState
    extends State<ERGEFortuneNumberScreenSGR> {
  List<int> userChoice = [];
  int botChoice = -1;

  bool isGameStarted = false;
  double koeff = 1;

  void updatekoeff() {
    if (userChoice.isEmpty) {
      koeff = 1;
    } else {
      koeff = double.parse((25 / userChoice.length).toStringAsFixed(2));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.h,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: AppColorsDSAF.backgroundDSAF),
              onPressed: () => Navigator.pop(context),
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(SEAFAppIconsFAE.backAFES, width: 24.w),
                  SizedBox(width: 4.w),
                  Text('Назад', style: SEFAAppTextStylesAEF.caption12ASEF),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Text('Цифри на удачу', style: SEFAAppTextStylesAEF.header16DGD),
          ],
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: AppColorsDSAF.backgroundDSAF),
            onPressed: () {
              final subtitles = [
                '25 номерів на полі — потрібно вибрати від 1 до 10 улюблених.',
                'Після вибору вам потрібно буде зловити Удачу. Випадковим чином буде обрано 1 число.',
                'Коефіцієнт обчислюється від кількості обраних вами осередків: що більше кількості осередків, то менше коефіцієнт'
              ];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AEFHelpScreenAFE(
                    title: 'Цифри на удачу',
                    subtitles: subtitles,
                  ),
                ),
              );
            },
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(SEAFAppIconsFAE.infoASE, width: 24.w),
                SizedBox(width: 4.w),
                Text('Умови', style: SEFAAppTextStylesAEF.caption12ASEF),
              ],
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.h,
              mainAxisExtent: 65.h,
              childAspectRatio: 1,
            ),
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  if (isGameStarted) return;
                  if (userChoice.contains(index)) {
                    userChoice.remove(index);
                    setState(() {});
                  } else if (userChoice.length < 10) {
                    userChoice.add(index);
                    setState(() {});
                  }
                  updatekoeff();
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColorsDSAF.blueSGDF),
                    gradient: userChoice.contains(index) && botChoice == index
                        ? AppColorsDSAF.mainGradientSAES
                        : null,
                    color: userChoice.contains(index) && botChoice == index
                        ? null
                        : userChoice.contains(index)
                            ? AppColorsDSAF.blueSGDF
                            : botChoice == index
                                ? AppColorsDSAF.pinkGDSR
                                : AppColorsDSAF.backgroundDSAF,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: SEFAAppTextStylesAEF.header16DGD,
                    ),
                  ),
                ),
              );
            },
          ),
          Gap.height(20.h),
          Text(
            koeff == 1
                ? 'Оберіть від 1 до 25 цифр'
                : 'Коефіціент за одну цифру: $koeff',
            style: SEFAAppTextStylesAEF.caption12ASEF
                .copyWith(color: AppColorsDSAF.greyDSFV),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            color: AppColorsDSAF.blackAFE,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap.height(22.h),
                Row(
                  children: [
                    Text(
                      'Ваша ставка',
                      style: SEFAAppTextStylesAEF.caption12ASEF.copyWith(
                        color: AppColorsDSAF.greyDSFV,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Гаманець',
                      style: SEFAAppTextStylesAEF.caption12ASEF.copyWith(
                        color: AppColorsDSAF.greyDSFV,
                      ),
                    ),
                    Gap.width(4.w),
                    SvgPicture.asset(SEAFAppIconsFAE.coinFSA, width: 24.w),
                    Gap.width(4.w),
                    BlocBuilder<SAFEMoneyCubitASEF, int>(
                      builder: (context, state) {
                        return Text('$state',
                            style: SEFAAppTextStylesAEF.text14SFC);
                      },
                    ),
                  ],
                ),
                Gap.height(16.h),
                CustomTextField(
                  onButtonPressed: (money) async {
                    if (isGameStarted || userChoice.isEmpty) return;
                    AEFProviderSAEF.blockSEF.changeBlock(true);
                    await context.read<SAFEMoneyCubitASEF>().setMoney(-money);
                    isGameStarted = true;
                    botChoice = Random().nextInt(25);
                    setState(() {});
                    await Future.delayed(const Duration(seconds: 2));
                    if (!mounted) return;
                    if (userChoice.contains(botChoice)) {
                      await context
                          .read<SAFEMoneyCubitASEF>()
                          .setMoney((money * koeff).toInt());

                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        ASFDCustomSnackbarSADF.dFDSFcallSnackbarASDF(
                            (money * koeff).toInt(), context),
                      );
                    }
                    botChoice = -1;
                    isGameStarted = false;
                    AEFProviderSAEF.blockSEF.changeBlock(false);
                    setState(() {});
                  },
                ),
                Gap.height(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
