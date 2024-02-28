import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DFGapp_colorsFDG.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_imagesSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_text_stylesSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFutilsSAF/DSFgapSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/SADFcustom_buttonASDF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/BFDcustom_snackbarRTE.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/GFHcustom_text_fieldHGF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/SADFblock_button_controllerSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/DFAmoney_controllerSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDFAscreensDSAF/SDFsuper_ruletkaSDF/DSFSprevious_widgetsSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDFAscreensDSAF/SDFsuper_ruletkaSDF/SDFroll_areaSFD.dart';

const fruitsImagesAEF = [
  ASEFAppImagesDAFSE.banana,
  ASEFAppImagesDAFSE.wildBerriesFASE,
  ASEFAppImagesDAFSE.berriesASEF,
];

class AEFSuperRuletkaScreenAWFE extends StatefulWidget {
  const AEFSuperRuletkaScreenAWFE({super.key});

  @override
  State<AEFSuperRuletkaScreenAWFE> createState() =>
      _AEFSuperRuletkaScreenAWFEState();
}

class _AEFSuperRuletkaScreenAWFEState extends State<AEFSuperRuletkaScreenAWFE> {
  late final ScrollController _scrollController;
  late final List<String> fruits;

  final rand = Random();

  int x = 2;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 44.w);
    fruits = List.generate(78, (index) => ASEFAppImagesDAFSE.banana);
    fruits.addAll(
        List.generate(24, (index) => ASEFAppImagesDAFSE.wildBerriesFASE));
    fruits.addAll(List.generate(10, (index) => ASEFAppImagesDAFSE.berriesASEF));
    fruits.shuffle();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool isRightFruit(int index) {
    return x == 2 &&
            fruits[index + 2] ==
                'super_gra_pro_assets/super_gra_pro_images/probanana.png' ||
        x == 3 &&
            fruits[index + 2] ==
                'super_gra_pro_assets/super_gra_pro_images/prowild_berries.png' ||
        x == 4 &&
            fruits[index + 2] ==
                'super_gra_pro_assets/super_gra_pro_images/proberries.png';
  }

  @override
  Widget build(BuildContext context) {
    final rand = Random();
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            Text('Супер Рулетка', style: SEFAAppTextStylesAEF.header16DGD),
          ],
        ),
        actions: [
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: AppColorsDSAF.backgroundDSAF),
            onPressed: () {
              final subtitles = [
                'Головна задача супер рулетки: вгадати фрукт, який випаде наступним.',
                'Банани випидають найчастіше, тому за них можна отримати лише 2x до ставки.',
                'Виноград випадає рідше, тому за нього можна отримати 3х до ставки.',
                'Найкращій слот — вишня. За нього можна отримати одразу 3х, але майте на увазі, що отримати його найважче!',
              ];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AEFHelpScreenAFE(
                    title: 'Супер рулетка',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AEFPreviousWinASEF(rand: rand),
                  SizedBox(height: 8.h),
                  const AEFPreviousHundredASE(),
                ],
              ),
            ),
            Gap.height(33.h),
            AFERollAreaASEF(controller: _scrollController, fruits: fruits),
            Gap.height(23.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: 162.h,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 0 : 8.w),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: x == index + 2
                                ? Border.all(color: Colors.white, width: 2.w)
                                : null,
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColorsDSAF.backgroundDSAF,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(fruitsImagesAEF[index],
                                    width: 44.w),
                                Gap.height(8.h),
                                Text('${index + 2}x',
                                    style: SEFAAppTextStylesAEF.header16DGD),
                                Text(
                                  'Ви ставили: 100 разів',
                                  style: SEFAAppTextStylesAEF.caption12ASEF
                                      .copyWith(color: AppColorsDSAF.greyDSFV),
                                ),
                                Center(
                                  child: DFASuperCustomButtonSDFA(
                                    text: 'Ставка',
                                    isSmall: true,
                                    onPressed: () => setState(() {
                                      x = index + 2;
                                    }),
                                    buttonStyleEnum: x == index + 2
                                        ? SDAFSuperButtonStyleEnumSDFA.common
                                        : SDAFSuperButtonStyleEnumSDFA.cancel,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Gap.height(18.h),
          ],
        ),
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
                    AEFProviderSAEF.blockSEF.changeBlock(true);
                    context.read<SAFEMoneyCubitASEF>().setMoney(-money);
                    final index = Random().nextInt(20) + 79;
                    dev.log(fruits[index + 2]);
                    _scrollController.jumpTo(44.w);
                    _scrollController.animateTo(
                      88.w * (index) + 44.w,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOutCubic,
                    );
                    await Future.delayed(const Duration(seconds: 2));
                    if (isRightFruit(index) && mounted) {
                      context.read<SAFEMoneyCubitASEF>().setMoney(x * money);
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        ASFDCustomSnackbarSADF.dFDSFcallSnackbarASDF(
                            x * money, context),
                      );
                    } else {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        ASFDCustomSnackbarSADF.dFDSFcallSnackbarASDF(
                            0, context),
                      );
                    }
                    AEFProviderSAEF.blockSEF.changeBlock(false);
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

class AEFHelpScreenAFE extends StatelessWidget {
  const AEFHelpScreenAFE({
    super.key,
    required this.title,
    required this.subtitles,
  });

  final String title;
  final List<String> subtitles;

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
            Text('Умови', style: SEFAAppTextStylesAEF.header16DGD),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: SEFAAppTextStylesAEF.header16DGD),
            Gap.height(16.h),
            ...List.generate(
              subtitles.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  subtitles[index],
                  style: SEFAAppTextStylesAEF.text14SFC
                      .copyWith(color: AppColorsDSAF.greyDSFV),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
