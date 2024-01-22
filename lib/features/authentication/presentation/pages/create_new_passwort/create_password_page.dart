import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/icons.dart';
import 'package:productive/assets/constants/images.dart';

class CreatePasswort extends StatefulWidget {
  const CreatePasswort({super.key});

  @override
  State<CreatePasswort> createState() => _CreatePasswortState();
}

class _CreatePasswortState extends State<CreatePasswort> {
  bool isLoginDataValid = false;
  final newPasController = TextEditingController();
  final comfirmPasController = TextEditingController();

  final newPassFocusNode = FocusNode();
  final comfirmPasswordFocusNode = FocusNode();
  final textFieldContentStyle = const TextStyle(
    color: hintTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  void valid() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoginDataValid = true;
      });
    } else {
      setState(() {
        isLoginDataValid = false;
      });
    }
  }

  final formKey = GlobalKey<FormState>();
  String password = '';
  String passwodt2 = '';
  bool isObscure = true;

  @override
  void dispose() {
    newPasController.dispose();
    comfirmPasController.dispose();
    super.dispose();
  }

  InputDecoration decoration({
    required String hintText,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
        hintStyle: TextStyle(
          color: hintTextColor.withOpacity(.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: textFieldBackgroundColor2,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                height: 29,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: const Text(
                  "Create new password",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: newPasswordColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                width: 130,
                child: Image.asset(AppImages.profile),
              ),
              const Gap(48),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                        valid();
                      },
                      obscureText: true,
                      style: textFieldContentStyle,
                      cursorColor: cursorColor,
                      focusNode: newPassFocusNode,
                      controller: newPasController,
                      decoration: decoration(hintText: 'Enter new password'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        comfirmPasswordFocusNode.requestFocus();
                      },
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Iltimos, yangi parolni kiriting kiriting!';
                        } else if (value.length < 8) {
                          return "Parol kamida 8 belgidan iborat bo'lsin";
                        }
                        return null;
                      }
                     
                    ),
                    const Gap(16),
                    TextFormField(
                      onChanged: (value) async {
                        setState(() {
                          passwodt2 = value;
                        });
                        valid();
                      },
                      obscureText: true,
                      style: textFieldContentStyle,
                      cursorColor: cursorColor,
                      focusNode: comfirmPasswordFocusNode,
                      controller: comfirmPasController,
                      decoration: decoration(
                        hintText: 'Confirm password',
                        suffixIcon: Padding(
                          padding:
                              EdgeInsets.only(top: 10, right: 12, bottom: 10),
                          child: SvgPicture.asset(
                            AppIcons.createPassword,
                            color: isLoginDataValid ? iconColor : null,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        comfirmPasswordFocusNode.unfocus();
                      },

                       validator: (passwodt2) {
                        setState(() {});
                        if (passwodt2 == null || passwodt2.isEmpty) {
                          return "Parolni qaydadan kiriting";
                        } else if (passwodt2 != password) {
                          print(passwodt2);
                          return "Xatolik qayta urining";
                        }
                        return null;
                      },
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 24,
              left: 16,
              right: 16),
          child: ElevatedButton(
            onPressed: isLoginDataValid?(){
               Navigator.of(context).pushNamed("/home");

            }:null, 
            child:const Text("Save",
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w600,
              color: white,

            ),
            
            ),
          ),
        ),
      ),
    );
  }
}
