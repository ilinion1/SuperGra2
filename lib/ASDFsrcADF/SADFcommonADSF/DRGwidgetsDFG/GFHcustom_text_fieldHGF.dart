import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DFGapp_colorsFDG.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_imagesSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFapp_text_stylesSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/SADFutilsSAF/DSFgapSADF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SADFcommonADSF/DRGwidgetsDFG/SADFcustom_buttonASDF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/SADFblock_button_controllerSDAF.dart';
import 'package:super_gra_pro/ASDFsrcADF/SDAFcontrollersASD/DFAmoney_controllerSADF.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.onButtonPressed,
    this.text,
  });

  final Function(int) onButtonPressed;
  final String? text;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;
  late final GlobalKey<FormState> _formKey;
  String? errorText;

  final moneys = <int>[1, 5, 10, 25, 50, 100];

  void isValid() {
    if (_controller.text.isEmpty) {
      errorText = null;
      setState(() {});
      return;
    }
    final money = int.parse(_controller.text);
    final userMoney = context.read<SAFEMoneyCubitASEF>().state;
    if (money < 10) {
      errorText = 'Неможливо поставити менше 10';
    } else if (money > userMoney) {
      errorText = 'Занадто багато! Перевірте баланс';
    } else {
      errorText = null;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 65.h,
          child: Form(
            key: _formKey,
            child: TextField(
              controller: _controller,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              cursorColor: AppColorsDSAF.blueSGDF,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) => isValid(),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: SvgPicture.asset(SEAFAppIconsFAE.coinFSA),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 10.w,
                ),
                filled: true,
                fillColor: AppColorsDSAF.backgroundDSAF,
                suffixIcon: (_controller.text.isEmpty)
                    ? null
                    : IconButton(
                        onPressed: () => setState(() {
                          _controller.clear();
                          errorText = null;
                        }),
                        icon: SvgPicture.asset(SEAFAppIconsFAE.deleteARSR),
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: AppColorsDSAF.blueSGDF),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: AppColorsDSAF.pinkGDSR),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: AppColorsDSAF.pinkGDSR),
                ),
                errorText: errorText,
                errorStyle: SEFAAppTextStylesAEF.caption12ASEF.copyWith(
                  color: AppColorsDSAF.pinkGDSR,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: List.generate(
            6,
            (index) => Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 8.w),
              child: SizedBox(
                width: 50.w,
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColorsDSAF.backgroundDSAF,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    final money = int.tryParse(_controller.text);
                    _controller.text =
                        ((money ?? 0) + moneys[index]).toString();
                    isValid();
                  },
                  icon: Text('+${moneys[index]}',
                      style: SEFAAppTextStylesAEF.text14SFC),
                ),
              ),
            ),
          ),
        ),
        Gap.height(8.h),
        ValueListenableBuilder(
            valueListenable: AEFProviderSAEF.blockSEF,
            builder: (context, bool value, _) {
              return DFASuperCustomButtonSDFA(
                text: widget.text ?? 'Грати',
                buttonStyleEnum:
                    _controller.text.isEmpty || errorText != null || value
                        ? SDAFSuperButtonStyleEnumSDFA.cancel
                        : SDAFSuperButtonStyleEnumSDFA.common,
                onPressed: () {
                  if (_controller.text.isEmpty || errorText != null || value) {
                    return;
                  }
                  if (context.read<SAFEMoneyCubitASEF>().state <
                      int.parse(_controller.text)) {
                    setState(() {
                      errorText = 'Занадто багато! Перевірте баланс';
                    });
                    return;
                  }
                  widget.onButtonPressed(int.parse(_controller.text));
                },
              );
            }),
      ],
    );
  }
}
