import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DFGapp_colorsFDG.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_imagesSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_text_stylesSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFutilsSAF/DSFgapSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/SADFcustom_buttonASDF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/BFDcustom_snackbarRTE.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/GFHcustom_text_fieldHGF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/DFAmoney_controllerSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDFAscreensDSAF/SDFsuper_ruletkaSDF/SDFsuper_ruletka_screenSDF.dart';

enum DSGSaperItemsSFGD { friend, enemy }

class SGSDSuperSaperScreenSFS extends StatefulWidget {
  const SGSDSuperSaperScreenSFS({super.key});

  @override
  State<SGSDSuperSaperScreenSFS> createState() =>
      _SGSDSuperSaperScreenSFSState();
}

class _SGSDSuperSaperScreenSFSState extends State<SGSDSuperSaperScreenSFS> {
  late final List<DSGSaperItemsSFGD?> items;
  List<bool> opened = List.generate(25, (index) => false);

  int money = 0;
  int friends = 0;
  bool isGameStarted = false;

  @override
  void initState() {
    super.initState();
    items = List.generate(3, (index) => DSGSaperItemsSFGD.enemy);
    items.addAll(List.generate(12, (index) => DSGSaperItemsSFGD.friend));
    items.addAll(List.generate(10, (index) => null));
    items.shuffle();
  }

  void restartGame() {
    money = 0;
    friends = 0;
    isGameStarted = false;
    opened = List.filled(25, false);
    items.shuffle();
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
            Text('Супер Сапер', style: SEFAAppTextStylesAEF.header16DGD),
          ],
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: AppColorsDSAF.backgroundDSAF),
            onPressed: () {
              final subtitles = [
                'На ігровому полі можна зустріти наших та ворогів, а можна нікого не зустріти.',
                'Ворогів завжди менше (звісно) — їх 3.',
                'Вам потрібно знайти всіх наших (їх 12) до того, як ви зіткнетесь із ворогом.',
                'Наші, колм ви їх знаходите, дають вам по x0.2 до вашої ставки. Отже, якщо ви знайдете всіх наших, ви отримаєте х2.4 до ставки.',
                'Але! Ви можете вивести вашу ставку на півдороги — в будь-який момент. ',
                'Якщо ви натрапите на ворога, ваша ставка буде програна.',
                'За перемогу!',
              ];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AEFHelpScreenAFE(
                    title: 'Супер сапер',
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
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              if (opened[index]) {
                final item = items[index];
                return Image.asset(
                  'super_gra_pro_assets/super_gra_pro_images/pro${item == null ? 'empty' : item.name}.png',
                  fit: BoxFit.contain,
                );
              } else {
                return GestureDetector(
                  onTap: () async {
                    if (!isGameStarted) return;
                    opened[index] = true;
                    setState(() {});
                    if (items[index] == DSGSaperItemsSFGD.enemy) {
                      log('Game over');
                      restartGame();
                      showDialog(
                        context: context,
                        barrierColor: Colors.black87,
                        builder: (context) =>
                            const SRGSWinOrLoseDialogSDFGR(won: false),
                      );
                    } else if (items[index] == DSGSaperItemsSFGD.friend) {
                      log('x0.2');
                      friends++;
                      setState(() {});
                      if (friends == 12) {
                        final totalMoney =
                            (money + friends * 0.2 * money).toInt();
                        await context
                            .read<SAFEMoneyCubitASEF>()
                            .setMoney(totalMoney);
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          ASFDCustomSnackbarSADF.dFDSFcallSnackbarASDF(
                              totalMoney, context),
                        );
                        restartGame();
                        if (!mounted) return;
                        showDialog(
                          context: context,
                          barrierColor: Colors.black87,
                          builder: (context) =>
                              const SRGSWinOrLoseDialogSDFGR(won: true),
                        );
                      }
                    }
                  },
                  child: Image.asset(
                    'super_gra_pro_assets/super_gra_pro_images/proclosed.png',
                    fit: BoxFit.contain,
                  ),
                );
              }
            },
          ),
          Gap.height(14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                  'super_gra_pro_assets/super_gra_pro_images/profriend.png',
                  width: 65.w),
              Text('${12 - friends}', style: SEFAAppTextStylesAEF.header16DGD),
              Text(
                '< Зараз на полі >',
                style: SEFAAppTextStylesAEF.caption12ASEF
                    .copyWith(color: AppColorsDSAF.greyDSFV),
              ),
              Text('3', style: SEFAAppTextStylesAEF.header16DGD),
              Image.asset(
                  'super_gra_pro_assets/super_gra_pro_images/proenemy.png',
                  width: 65.w),
            ],
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
                    if (isGameStarted) {
                      final totalMoney =
                          (this.money + friends * 0.2 * this.money).toInt();
                      await context
                          .read<SAFEMoneyCubitASEF>()
                          .setMoney(totalMoney);
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        ASFDCustomSnackbarSADF.dFDSFcallSnackbarASDF(
                            totalMoney, context),
                      );
                      restartGame();
                    } else {
                      await context.read<SAFEMoneyCubitASEF>().setMoney(-money);
                      isGameStarted = true;
                      this.money = money;
                      setState(() {});
                    }
                  },
                  text: isGameStarted
                      ? 'Вивести: ${(money + friends * 0.2 * money).toInt()}'
                      : null,
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

class SRGSWinOrLoseDialogSDFGR extends StatelessWidget {
  const SRGSWinOrLoseDialogSDFGR({
    super.key,
    required this.won,
  });

  final bool won;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
            'super_gra_pro_assets/super_gra_pro_images/pro${won ? 'ua' : 'bullet'}.png',
            width: 112.w),
        Gap.height(18.h),
        Text(won ? 'Перемога наша!' : 'Ви підірвалися',
            style: SEFAAppTextStylesAEF.header24SGRT),
        if (won) Gap.height(18.h),
        if (won)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '+',
                style: SEFAAppTextStylesAEF.caption12ASEF
                    .copyWith(color: AppColorsDSAF.greyDSFV),
              ),
              SvgPicture.asset(SEAFAppIconsFAE.coinFSA, width: 24.w),
              Gap.width(6.w),
              Text('200', style: SEFAAppTextStylesAEF.text14SFC),
            ],
          ),
        Gap.height(18.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: DFASuperCustomButtonSDFA(
            text: 'Грати далі',
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
