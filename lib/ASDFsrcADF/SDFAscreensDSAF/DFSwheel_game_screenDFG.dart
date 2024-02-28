import 'dart:math';
import 'dart:core';
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

class ASEFWheelGameScreenASEFS extends StatefulWidget {
  const ASEFWheelGameScreenASEFS({super.key});

  @override
  State<ASEFWheelGameScreenASEFS> createState() =>
      _ASEFWheelGameScreenASEFSState();
}

class _ASEFWheelGameScreenASEFSState extends State<ASEFWheelGameScreenASEFS>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  DateTime? dateTime;

  final List<dynamic> items = [
    1,
    2,
    3,
    1.5,
    1,
    0,
    2,
    1.5,
    3,
    1,
    2,
    1.5,
    1,
    3,
    0,
    1.5,
    1,
    2,
    3,
    1.5,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(animate);
  }

  @override
  void dispose() async {
    _controller.removeListener(animate);
    _controller.dispose();
    super.dispose();
  }

  void animate() {
    if (!mounted) return;
    setState(() {});
  }

  void _spinWheel(int money) async {
    _controller.repeat();
    final random = Random();
    final nextInt = random.nextInt(1000) + 2000;
    final duration = Duration(milliseconds: nextInt);
    await Future.delayed(duration);
    if (!mounted) return;
    _controller.stop();
    final value = 1 - _controller.value;
    for (int i = 0; i < items.length; i++) {
      if (i / items.length <= value && value <= (i + 1) / items.length) {
        print(items[i]);
        final amount = (items[i] * money).toInt();
        await context.read<SAFEMoneyCubitASEF>().setMoney(amount);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          ASFDCustomSnackbarSADF.dFDSFcallSnackbarASDF(amount, context),
        );
      }
    }
    AEFProviderSAEF.blockSEF.changeBlock(false);
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
            Text('Щасливе колесо', style: SEFAAppTextStylesAEF.header16DGD),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: Container(
                    width: double.infinity,
                    height: 400.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'super_gra_pro_assets/super_gra_pro_images/prowheel.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 20.h),
                      child: Container(
                        width: 167.w,
                        height: 167.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorsDSAF.backgroundDSAF,
                        ),
                        child: Center(
                          child: Text('Грай!',
                              style: SEFAAppTextStylesAEF.header24SGRT),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Image.asset(
                        'super_gra_pro_assets/super_gra_pro_images/protriangle_wheel.png',
                        width: 182.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: const CustomBottomSheet(),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  context
                      .findAncestorStateOfType<
                          _ASEFWheelGameScreenASEFSState>()!
                      ._spinWheel(money);
                },
              ),
              Gap.height(32.h),
            ],
          ),
        ),
      ),
    );
  }
}
