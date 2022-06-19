import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounakmusicplayerapp/utils/neuConstants.dart';

//? An input field class for all the input boxes in the app.
class NeuInputField extends StatefulWidget {
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final String? labelText;
  final bool obscureText;
  final bool autoFocus;
  final bool labelPresent;
  final String? hintText;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final TextEditingController? controller;
  final String? Function(String?)? validatorFunction;
  final TextCapitalization textCapitalization;
  final Color? color;
  final int? maxLength;
  final Function()? onEditingComplete;
  final Function()? onTapFunction;
  final Widget? suffixIcon;
  final bool readOnly;
  final OutlineInputBorder? enabledBorder;
  final BorderSide? borderSide;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool enabled;
  final TextStyle? inputTextStyle;
  // final Color? inputTextColor;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final double depth;
  NeuInputField({
    Key? key,
    this.onChanged,
    this.keyBoardType,
    this.labelText,
    required this.obscureText,
    this.controller,
    required this.autoFocus,
    required this.edgeInsetsGeometry,
    this.color,
    required this.labelPresent,
    this.hintText,
    this.validatorFunction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.onEditingComplete,
    this.onTapFunction,
    this.suffixIcon,
    this.readOnly = false,
    this.enabledBorder,
    this.borderSide,
    this.hintStyle,
    this.enabled = true,
    // this.inputTextColor,
    this.inputFormatters,
    this.labelStyle,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.inputTextStyle,
    this.depth = -5,
  }) : super(key: key);

  @override
  _NeuInputFieldState createState() => _NeuInputFieldState();
}

class _NeuInputFieldState extends State<NeuInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.edgeInsetsGeometry,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelPresent
              ? Padding(
            padding: EdgeInsets.only(left: 5.0.w, bottom: 5.h),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                  color: ConstantColor.darkModeColor,
                  fontSize: 13.sp,fontWeight: FontWeight.w400),
            ),
          )
              : Container(),
          Neumorphic(
            style: NeumorphicStyle(
              depth: -4,
              shadowLightColor: Color(0xFF3E4245).withOpacity(0.1),
              shadowDarkColorEmboss: Colors.black,
              shadowDarkColor: Color(0xFF1E2021),
              color: Colors.black,
            ),
            child: TextFormField(
              cursorColor: ConstantColor.lightTextBodyColor,
              inputFormatters: widget.inputFormatters,
              readOnly: widget.readOnly,
              onEditingComplete: widget.onEditingComplete,
              onTap: widget.onTapFunction,
              textAlign: TextAlign.start,
              maxLength: widget.maxLength,
              maxLines: 1,
              style: TextStyle(
                  color: Color(0xffC7CBCD),
                  fontSize: 13.sp,fontWeight: FontWeight.w400),
              textCapitalization: widget.textCapitalization,
              controller: widget.controller,
              keyboardType: widget.keyBoardType,
              autofocus: widget.autoFocus,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              validator: widget.validatorFunction,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  enabledBorder: widget.enabledBorder == null
                      ? null
                      : widget.enabledBorder,
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  suffix: widget.suffix,
                  prefix: widget.prefix,
                  counter: widget.maxLength == 1 ? Container() : null,
                  counterText: "",
                  errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide.none),
                  fillColor: widget.color,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      color:Color(0xffC7CBCD).withOpacity(0.5),
                      fontSize: 13.sp,fontWeight: FontWeight.w400),

                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        ],
      ),
    );
  }
}

//? An input field class for all the input boxes in the app.
class NeuInputFieldOne extends StatefulWidget {
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final String? labelText;
  final bool obscureText;
  final bool autoFocus;
  final bool labelPresent;
  final String? hintText;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final TextEditingController? controller;
  final String? Function(String?)? validatorFunction;
  final TextCapitalization textCapitalization;
  final Color? color;
  final int? maxLength;
  final Function()? onEditingComplete;
  final Function()? onTapFunction;
  final Widget? suffixIcon;
  final bool readOnly;
  final OutlineInputBorder? enabledBorder;
  final BorderSide? borderSide;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool enabled;
  final TextStyle? inputTextStyle;
  // final Color? inputTextColor;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final double depth;
  NeuInputFieldOne({
    Key? key,
    this.onChanged,
    this.keyBoardType,
    this.labelText,
    required this.obscureText,
    this.controller,
    required this.autoFocus,
    required this.edgeInsetsGeometry,
    this.color,
    required this.labelPresent,
    this.hintText,
    this.validatorFunction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.onEditingComplete,
    this.onTapFunction,
    this.suffixIcon,
    this.readOnly = false,
    this.enabledBorder,
    this.borderSide,
    this.hintStyle,
    this.enabled = true,
    this.inputFormatters,
    this.labelStyle,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.inputTextStyle,
    this.depth = -5,
  }) : super(key: key);

  @override
  _NeuInputFieldOneState createState() => _NeuInputFieldOneState();
}

class _NeuInputFieldOneState extends State<NeuInputFieldOne> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: widget.edgeInsetsGeometry,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelPresent
              ? Padding(
            padding: EdgeInsets.only(left: 5.0.w, bottom: 5.h),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                color:Color(0xff4B4E4F).withOpacity(0.7),
                fontSize: sizeHeight >= 700 ? 12.sp : 12.sp,
                fontWeight: FontWeight.w500,),
            ),
          )
              : Container(),
          Container(
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ConstantColor.darkModeColor,width: 1)
            ),
            child: TextFormField(
              cursorColor: ConstantColor.lightTextBodyColor,
              inputFormatters: widget.inputFormatters,
              readOnly: widget.readOnly,
              onEditingComplete: widget.onEditingComplete,
              onTap: widget.onTapFunction,
              textAlign: TextAlign.start,
              maxLength: widget.maxLength,
              maxLines: 1,
              style: TextStyle(
                color:ConstantColor.darkModeColor,
                fontSize: sizeHeight >= 700 ? 12.sp : 12.sp,
                fontWeight: FontWeight.w500,),
              textCapitalization: widget.textCapitalization,
              controller: widget.controller,
              keyboardType: widget.keyBoardType,
              autofocus: widget.autoFocus,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              validator: widget.validatorFunction,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  enabledBorder: widget.enabledBorder == null
                      ? null
                      : widget.enabledBorder,
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  suffix: widget.suffix,
                  prefix: widget.prefix,
                  counter: widget.maxLength == 1 ? Container() : null,
                  counterText: "",
                  errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide.none),
                  fillColor: widget.color ,
                  hintText: widget.hintText,
                  hintStyle:TextStyle(
                    color: ConstantColor.darkModeColor.withOpacity(0.6),
                    fontWeight: FontWeight.w400,),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        ],
      ),
    );
  }
}


//? An input field class for all the input boxes in the app.
class NeuInputFieldTwo extends StatefulWidget {
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final String? labelText;
  final bool obscureText;
  final bool autoFocus;
  final bool labelPresent;
  final String? hintText;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final TextEditingController? controller;
  final String? Function(String?)? validatorFunction;
  final TextCapitalization textCapitalization;
  final Color? color;
  final int? maxLength;
  final Function()? onEditingComplete;
  final Function()? onTapFunction;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool? onTaped;
  final OutlineInputBorder? enabledBorder;
  final BorderSide? borderSide;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? enabled;
  final TextStyle? inputTextStyle;
  // final Color? inputTextColor;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final double depth;
  NeuInputFieldTwo({
    Key? key,
    this.onChanged,
    this.keyBoardType,
    this.labelText,
    required this.obscureText,
    this.controller,
    required this.autoFocus,
    required this.edgeInsetsGeometry,
    this.color,
    required this.labelPresent,
    this.hintText,
    this.onTaped,
    this.validatorFunction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.onEditingComplete,
    this.onTapFunction,
    this.suffixIcon,
    this.readOnly = false,
    this.enabledBorder,
    this.borderSide,
    this.hintStyle,
    this.enabled = true,
    // this.inputTextColor,
    this.inputFormatters,
    this.labelStyle,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.inputTextStyle,
    this.depth = -5,
  }) : super(key: key);

  @override
  _NeuInputFieldTwoState createState() => _NeuInputFieldTwoState();
}

class _NeuInputFieldTwoState extends State<NeuInputFieldTwo> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: widget.edgeInsetsGeometry,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelPresent
              ? Padding(
            padding: EdgeInsets.only(left: 5.0, bottom: 5.0),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                  color:ConstantColor.darkModeColor,
                  fontSize: 13.0,fontWeight: FontWeight.w400),
            ),
          )
              : Container(),
          TextFormField(
            cursorColor: ConstantColor.lightTextBodyColor,
            inputFormatters: widget.inputFormatters,
            readOnly: widget.readOnly,
            onEditingComplete: widget.onEditingComplete,
            onTap: widget.onTapFunction,
            textAlign: TextAlign.start,
            maxLength: widget.maxLength,
            maxLines: 1,
            style: TextStyle(
                color:ConstantColor.darkModeColor,
                fontSize: sizeHeight >= 700 ? 22.0 : 20.0,fontWeight: FontWeight.w700),
            textCapitalization: widget.textCapitalization,
            controller: widget.controller,
            keyboardType: widget.keyBoardType,
            autofocus: widget.autoFocus,
            enabled: widget.enabled,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            validator: widget.validatorFunction,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                enabledBorder: widget.enabledBorder == null
                    ? null
                    : widget.enabledBorder,
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
                suffix: widget.suffix,
                prefix: widget.prefix,
                counter: widget.maxLength == 1 ? Container() : null,
                counterText: "",
                errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: widget.color,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: sizeHeight >= 700 ? 22.0 : 20.0,fontWeight: FontWeight.w700),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}

//? An input field class for all the input boxes in the app.
class NeuInputForgotPassword extends StatefulWidget {
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final String? labelText;
  final bool obscureText;
  final bool autoFocus;
  final bool labelPresent;
  final String? hintText;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final TextEditingController? controller;
  final String? Function(String?)? validatorFunction;
  final TextCapitalization textCapitalization;
  final Color? color;
  final int? maxLength;
  final Function()? onEditingComplete;
  final Function()? onTapFunction;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool? onTaped;
  final OutlineInputBorder? enabledBorder;
  final BorderSide? borderSide;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? enabled;
  final TextStyle? inputTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final double depth;
  NeuInputForgotPassword({
    Key? key,
    this.onChanged,
    this.keyBoardType,
    this.labelText,
    required this.obscureText,
    this.controller,
    required this.autoFocus,
    required this.edgeInsetsGeometry,
    this.color,
    required this.labelPresent,
    this.hintText,
    this.onTaped,
    this.validatorFunction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.onEditingComplete,
    this.onTapFunction,
    this.suffixIcon,
    this.readOnly = false,
    this.enabledBorder,
    this.borderSide,
    this.hintStyle,
    this.enabled = true,
    // this.inputTextColor,
    this.inputFormatters,
    this.labelStyle,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.inputTextStyle,
    this.depth = -5,
  }) : super(key: key);

  @override
  _NeuInputForgotPasswordState createState() => _NeuInputForgotPasswordState();
}

class _NeuInputForgotPasswordState extends State<NeuInputForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: widget.edgeInsetsGeometry,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelPresent
              ? Padding(
            padding: EdgeInsets.only(left: 5.0.w, bottom: 5.h),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                  color:ConstantColor.darkModeColor,
                  fontSize: 13.sp,fontWeight: FontWeight.w400),
            ),
          )
              : Container(),
          TextFormField(
            cursorColor: ConstantColor.lightTextBodyColor,
            inputFormatters: widget.inputFormatters,
            readOnly: widget.readOnly,
            onEditingComplete: widget.onEditingComplete,
            onTap: widget.onTapFunction,
            textAlign: TextAlign.start,
            maxLength: widget.maxLength,
            maxLines: 1,
            style: TextStyle(
                color: ConstantColor.darkModeColor,
                fontSize: sizeHeight >= 700 ? 22.sp : 20.sp,fontWeight: FontWeight.w700),
            textCapitalization: widget.textCapitalization,
            controller: widget.controller,
            keyboardType: widget.keyBoardType,
            autofocus: widget.autoFocus,
            enabled: widget.enabled,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            validator: widget.validatorFunction,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                enabledBorder: widget.enabledBorder == null
                    ? null
                    : widget.enabledBorder,
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
                suffix: widget.suffix,
                prefix: widget.prefix,
                counter: widget.maxLength == 1 ? Container() : null,
                counterText: "",
                errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: widget.color,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: sizeHeight >= 700 ? 22.sp : 20.sp,fontWeight: FontWeight.w700),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}


//? An input field class for all the input boxes in the app.
class NeuInputFieldThree extends StatefulWidget {
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final String? labelText;
  final bool obscureText;
  final bool autoFocus;
  final bool labelPresent;
  final String? hintText;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final TextEditingController? controller;
  final String? Function(String?)? validatorFunction;
  final TextCapitalization textCapitalization;
  final Color? color;
  final int? maxLength;
  final Function()? onEditingComplete;
  final Function()? onTapFunction;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool? onTaped;
  final OutlineInputBorder? enabledBorder;
  final BorderSide? borderSide;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? enabled;
  final TextStyle? inputTextStyle;
  // final Color? inputTextColor;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final double depth;
  NeuInputFieldThree({
    Key? key,
    this.onChanged,
    this.keyBoardType,
    this.labelText,
    required this.obscureText,
    this.controller,
    required this.autoFocus,
    required this.edgeInsetsGeometry,
    this.color,
    required this.labelPresent,
    this.hintText,
    this.onTaped,
    this.validatorFunction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.onEditingComplete,
    this.onTapFunction,
    this.suffixIcon,
    this.readOnly = false,
    this.enabledBorder,
    this.borderSide,
    this.hintStyle,
    this.enabled = true,
    // this.inputTextColor,
    this.inputFormatters,
    this.labelStyle,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.inputTextStyle,
    this.depth = -5,
  }) : super(key: key);

  @override
  _NeuInputFieldThreeState createState() => _NeuInputFieldThreeState();
}

class _NeuInputFieldThreeState extends State<NeuInputFieldThree> {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: widget.edgeInsetsGeometry,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelPresent
              ? Padding(
            padding: EdgeInsets.only(left: 5.0, bottom: 5.0),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                  color: ConstantColor.darkModeColor,
                  fontSize: 13.0,fontWeight: FontWeight.w400),
            ),
          )
              : Container(),
          Container(
            height: 45,
            child: TextFormField(
              cursorColor: ConstantColor.lightTextBodyColor,
              inputFormatters: widget.inputFormatters,
              readOnly: widget.readOnly,
              onEditingComplete: widget.onEditingComplete,
              onTap: widget.onTapFunction,
              textAlign: TextAlign.start,
              maxLength: widget.maxLength,
              maxLines: 1,
              style: TextStyle(
                  color:ConstantColor.darkModeColor,
                  fontSize: sizeHeight >= 700 ? 14.0 : 12.0,fontWeight: FontWeight.w700),
              textCapitalization: widget.textCapitalization,
              controller: widget.controller,
              keyboardType: widget.keyBoardType,
              autofocus: widget.autoFocus,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              validator: widget.validatorFunction,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:Colors.grey,width: 1.0)
                  ),
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  suffix: widget.suffix,
                  prefix: widget.prefix,
                  counter: widget.maxLength == 1 ? Container() : null,
                  counterText: "",
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:Colors.red.withOpacity(0.8), width: 1.0),
                  ),
                  fillColor: widget.color,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      color:Colors.grey.withOpacity(0.5),
                      fontSize: sizeHeight >= 700 ? 14.0 : 12.0,fontWeight: FontWeight.w700),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



