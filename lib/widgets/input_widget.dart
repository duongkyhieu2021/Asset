import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final bool isValid;
  final String? initialValue;
  final String labelText;
  final TextInputType textInputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChange;
  final bool isDisabled;

  const InputWidget({
    Key? key,
    this.isValid = true,
    this.initialValue,
    this.labelText = '',
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.validator,
    required this.onSaved,
    this.onChange,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue ?? '';
    if (widget.isDisabled) {
      _controller.text = widget.initialValue!;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
      _controller.addListener(() {
        if (_controller.text != widget.initialValue) {
          _controller.text = widget.initialValue ?? '';
          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleChange(String value) {
    if (widget.onChange != null) {
      widget.onChange!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
      ),
      keyboardType: widget.textInputType,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: _handleChange,
      obscureText: widget.obscureText,
      enabled: !widget.isDisabled,
      autovalidateMode:
          widget.isValid ? AutovalidateMode.disabled : AutovalidateMode.always,
      // Tắt tính năng tự động kiểm tra tính hợp lệ nếu isValid là true
    );
  }
}
