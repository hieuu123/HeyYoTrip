import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

Widget birthField({
  required TextEditingController controller,
}) {
  return _BirthField(controller: controller);
}

class _BirthField extends StatefulWidget {
  final TextEditingController controller;

  const _BirthField({required this.controller});

  @override
  State<_BirthField> createState() => _BirthFieldState();
}

class _BirthFieldState extends State<_BirthField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD7D7D7), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                hintText: 'Enter your birthday',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/calendar.svg'),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  setState(() {
                    widget.controller.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                  });
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
