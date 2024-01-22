import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/images.dart';
import 'package:productive/features/authentication/presentation/pages/create_new_passwort/create_password_page.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  PinTheme defaultPinTheme = PinTheme(
    width: 51,
    height: 55,
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: textFieldBackgroundColor2,
      border: Border.all(
        color: pinPutBorderColor.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  final TextEditingController pinPutController = TextEditingController();
  bool isPinPutValid = false;
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Email verification'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 130 ,
                width: 130, 
                margin: const EdgeInsets.only(top: 20,bottom: 20),
                child: Image.asset(AppImages.profile),
              ),
              const Text(
                'Please enter the 4 digital code that send\nto your email address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(12),
              Pinput(
                length: 4,
                forceErrorState: isError,
                controller: pinPutController,
                enableSuggestions: isPinPutValid,
                defaultPinTheme: isPinPutValid
                    ? defaultPinTheme.copyBorderWith(
                        border: Border.all(
                        color: green,
                      ))
                    : defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(
                    color: pinPutBorderColor,
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(
                    color: !isPinPutValid ? errorColor : green,
                  ),
                ),
                onChanged: (value) {
                  if (value.length == 4) {
                    if (value == '7777') {
                      isPinPutValid = true;
                    } else {
                      isError = true;
                    }

                    setState(() {});
                  } else {
                    isPinPutValid = false;
                    isError = false;
                  }
                },
                onCompleted: (value) {
                  if (isPinPutValid) {
                    Navigator.of(context).pushNamed("/CreatePassword");
                  }
                },
              ),
              const SizedBox(height: 32,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("If you don’t receive code.",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: verificationTextColor

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: const Text("Resent",
                      style: TextStyle(
                        color: verificationResentColor,
                        fontSize: 14,
                        
                  
                      ),
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ));
  }
}
