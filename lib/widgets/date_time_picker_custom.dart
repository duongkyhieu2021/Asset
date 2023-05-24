import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerCustom extends StatefulWidget {
  const DateTimePickerCustom({
    Key? key,
    required this.onDateTimeChanged,
    this.buttonText = 'Show DateTimePickerCustom',
    this.buttonStyle,
    this.textStyle,
  }) : super(key: key);

  final void Function(DateTime?) onDateTimeChanged;
  final String buttonText;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  @override
  _DateTimePickerCustomState createState() => _DateTimePickerCustomState();
}

class _DateTimePickerCustomState extends State<DateTimePickerCustom> {
  final format = DateFormat('yyyy-MM-dd HH:mm:ss');
  String? _selectedDateTime;

  Future<void> _showDateTimePicker(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (selectedTime != null) {
        final DateTime selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
        setState(() {
          _selectedDateTime = format.format(selectedDateTime);
        });
        widget.onDateTimeChanged(format.parse(_selectedDateTime!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showDateTimePicker(context),
      style: widget.buttonStyle ??
          ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _selectedDateTime == null
                ? widget.buttonText
                : _selectedDateTime!.toString(),
            style: widget.textStyle ?? const TextStyle(color: Colors.grey),
          ),
          Icon(
            Icons.calendar_today,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
