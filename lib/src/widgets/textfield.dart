import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soulfi/utils/color_file.dart';
import 'package:soulfi/utils/text_styling.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  TextEditingController? controller = TextEditingController();
  dynamic loginController;
  String? label;

  bool isValidate = true;
  bool? isEmail = false;
  bool? isPhoneNumber = false;
  bool? isPassword = false;
  bool? isContainerBorder = true;
  VoidCallback? onTap;
  bool? isPhone = false;
  bool? isBorder = true;
  bool? isConfirmPassword = false;
  bool? readOnly = false;
  bool? isFromSignup = false;
  bool? isFromSetting = false;
  String? validationError;
  int? maxLines = 1;
  int? maxLength;
  String? hint;
  double? radius;
  Color? color;
  Color? cursorColor;
  ValueChanged<String>? onChanged;
  ValueChanged<String>? onFieldSubmitted;
  dynamic formatter;
  Widget? suffixIcon;
  Widget? prefixIcon;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final double? fieldPadding;
  final TextStyle? hintStyle;
  final TextStyle? style;
  var validating;
  final bool autoFocus;
  final bool isnotshowkeyboard;
  bool currentbtnvlue;
  IconData? feildIcon;
  bool? isEnable;
  final bool showcursor;
  bool isError = false;
  CustomTextField(
      {Key? key,
      this.isPhoneNumber,
      this.isnotshowkeyboard = false,
      this.currentbtnvlue = false,
      this.fieldPadding,
      this.validating,
      this.isEnable,
      this.hintStyle,
      this.controller,
      this.isEmail = false,
      this.isPassword = false,
      this.isFromSignup = false,
      this.validationError,
      this.loginController,
      this.padding,
      this.prefixIcon,
      this.autoFocus = false,
      this.onChanged,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.onTap,
      this.style,
      this.formatter,
      this.cursorColor,
      this.contentPadding,
      this.readOnly = false,
      this.isFromSetting = false,
      this.isContainerBorder = true,
      this.hint,
      this.color,
      this.radius = 10,
      this.maxLength,
      this.maxLines = 1,
      this.isPhone = false,
      this.isBorder = true,
      this.feildIcon,
      this.label,
      this.isValidate = true,
      this.showcursor = true,
      this.isConfirmPassword = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var customHeight = MediaQuery.of(context).size.height;
    if (widget.autoFocus) {
      print("focussing");
      FocusScope.of(context).requestFocus(focusNode);
    }
    if (widget.isnotshowkeyboard) {
      print("ishiding");
      if (widget.currentbtnvlue) {
        Future.delayed(Duration(milliseconds: 300), () {
          SystemChannels.textInput.invokeMethod('TextInput.show');
        });
      } else {
        Future.delayed(Duration(milliseconds: 300), () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        });
      }
    }
    return
        // Padding(
        // padding:
        //     padding ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
        // child: Container(
        //   //padding: contentPadding ?? const EdgeInsets.all(0),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(radius ?? 0),
        //   ),
        //   child:
        // Material(
        //     color: Colors.white,
        //     elevation: 0.0,
        //     borderRadius: BorderRadius.all(Radius.circular(radius ?? 25)),
        //     shadowColor: DynamicColor.primaryColor,
        //     child:
        Center(
      child: Theme(
        data: ThemeData(
          primaryColor: DynamicColor.primaryColor,
          primaryColorDark: DynamicColor.primaryColor,
        ),
        child: TextFormField(
          focusNode: focusNode,
          inputFormatters: widget.formatter,
          onTap: widget.onTap,
          readOnly: widget.readOnly!,
          controller: widget.controller,
          cursorColor: widget.cursorColor ?? DynamicColor.secondary,
          enabled: widget.isEnable ?? true,
          onFieldSubmitted: widget.onFieldSubmitted, //
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,

          showCursor: widget.showcursor, maxLength: widget.maxLength,
          style: widget.style ??
              poppins(
                fontSize: MediaQuery.of(context).size.height / 60,
                color: DynamicColor.fontColor,
                fontWeight: FontWeight.w300,
              ),
          obscureText: widget.isPassword == true ? true : false,
          keyboardType: widget.isPhone == true
              ? TextInputType.phone
              : widget.isEmail == true
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          validator: widget.validating ??
              (value) {
                if (widget.isValidate) {
                  if (value!.isEmpty) {
                    setState(() => widget.isError = true);
                    return 'Please Enter ${widget.validationError}';
                  } else if (widget.isConfirmPassword == true) {
                    if (widget.loginController.signUpPasswordController.text ==
                        widget.loginController.signUpConfirmPasswordController
                            .text) {
                      setState(() => widget.isError = false);
                      return null;
                    } else {
                      setState(() => widget.isError = true);

                      return "Password doesn't match";
                    }
                  } else {
                    if (widget.isEmail == true) {
                      return validateEmail(value);
                    } else if (widget.isPhoneNumber == true) {
                      return validateMobile(value);
                    } else {
                      return null;
                    }
                  }
                } else {
                  return null;
                }
              },

          decoration: widget.feildIcon != null
              ? InputDecoration(
                  // labelStyle: poppins(
                  //     fontWeight: FontWeight.bold,
                  //     color: DynamicColor.fontColor,
                  //     fontSize: MediaQuery.of(context).size.height / 45),
                  // labelText: label,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      widget.feildIcon!,
                      color: DynamicColor.fontColor,
                    ),
                  ),
                  fillColor: Colors.grey,
                  filled: true,
                  contentPadding: EdgeInsets.only(
                    left: 10,
                    top: widget.prefixIcon == null && widget.suffixIcon == null
                        ? widget.fieldPadding ?? 0
                        : widget.fieldPadding ?? 15,
                  ),
                  border: widget.radius != null
                      ? OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(widget.radius!)),
                          borderSide: BorderSide(
                            color: DynamicColor.primary,
                            width: 1,
                          ))
                      : InputBorder.none,
                  enabledBorder: widget.isBorder!
                      ? OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(widget.radius!)),
                          borderSide: BorderSide(
                            color: DynamicColor.primary,
                            width: 1,
                          ))
                      : InputBorder.none,
                  hintText: widget.hint ?? "",
                  suffixIcon: widget.suffixIcon,
                  errorStyle: poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height / 80,
                  ),
                  hintStyle: widget.hintStyle ??
                      poppins(
                          fontWeight: FontWeight.w300,
                          color: DynamicColor.hintColor,
                          fontSize: MediaQuery.of(context).size.height / 60),
                  prefixIcon: widget.prefixIcon,
                  focusedBorder: widget.isBorder!
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                            color: DynamicColor.primary,
                            width: 1,
                          ))
                      : InputBorder.none,
                )
              : InputDecoration(
                  errorStyle: poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height / 80,
                  ),
                  labelStyle: poppins(
                    fontWeight: FontWeight.w200,
                    color: DynamicColor.primaryColor,
                    fontSize: MediaQuery.of(context).size.height / 45,
                  ),
                  // labelText: label,
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.only(
                      left: 15,
                      top:
                          widget.prefixIcon == null && widget.suffixIcon == null
                              ? widget.fieldPadding ?? 0
                              : 15),
                  border: widget.isBorder!
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                            color: DynamicColor.primary,
                            width: 1,
                          ))
                      : InputBorder.none,
                  enabledBorder: widget.isBorder!
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: DynamicColor.primary, width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(widget.radius!)),
                        )
                      : InputBorder.none,
                  // OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(25)),
                  //       ),
                  hintText: widget.hint ?? "",
                  suffixIcon: widget.suffixIcon,
                  hintStyle: widget.hintStyle ??
                      poppins(
                          fontWeight: FontWeight.w400,
                          color: DynamicColor.hintColor,
                          fontSize: MediaQuery.of(context).size.height / 60),
                  prefixIcon: widget.prefixIcon,
                  focusColor: DynamicColor.primaryColor,
                  focusedBorder: widget.isBorder!
                      ? OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(widget.radius!)),
                          borderSide:
                              BorderSide(width: 1, color: DynamicColor.primary))
                      : InputBorder.none,
                  // UnderlineInputBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(15)),
                  //     borderSide: BorderSide(
                  //       color: DynamicColor.primary,
                  //     ))),
                ),
        ),
      ),
    );
  }

  validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      setState(() => widget.isError = true);
      return "Enter a valid email address";
    } else {
      return null;
    }
  }

  validateMobile(String value) {
    String pattern = r'[0-9]{9}';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      setState(() => widget.isError = true);
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      setState(() => widget.isError = true);
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
