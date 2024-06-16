import 'package:flutter/material.dart';

class CheckboxWithText extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const CheckboxWithText({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckboxWithTextState createState() => _CheckboxWithTextState();
}

class _CheckboxWithTextState extends State<CheckboxWithText> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
                widget.onChanged(_isChecked);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: _isChecked ? Colors.white : Colors.transparent,
                ),
                child: _isChecked
                    ? const Icon(Icons.check, size: 14.0, color: Colors.black)
                    : null,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Я принимаю пользовательское',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                Text(
                  'соглашение и политику конфиденциальности',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
