import 'package:allservice/res/constants/color_constants.dart';
import 'package:flutter/material.dart';

class FilterOptions extends StatefulWidget {
  final VoidCallback onDismiss;

  const FilterOptions({required this.onDismiss, Key? key}) : super(key: key);

  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  String _selectedPriceOption = 'default';
  String _selectedDateOption = 'default';
  late FocusNode _focusNode1;
  late FocusNode _focusNode2;
  Color _fillColor1 = kGreyColor3;
  Color _fillColor2 = kGreyColor3;

  @override
  void initState() {
    super.initState();
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();

    _focusNode1.addListener(() {
      setState(() {
        _fillColor1 = _focusNode1.hasFocus ? kBackgroundColor : kGreyColor3;
      });
    });

    _focusNode2.addListener(() {
      setState(() {
        _fillColor2 = _focusNode2.hasFocus ? kBackgroundColor : kGreyColor3;
      });
    });
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    widget.onDismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'Цена',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Text('от'),
                const SizedBox(width: 8.0),
                SizedBox(
                  width: 80,
                  height: 31,
                  child: TextField(
                    focusNode: _focusNode1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: const TextStyle(color: kGreyColor2),
                      filled: true,
                      fillColor: _fillColor1,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: kTextColor, fontSize: 14), // Уменьшение размера текста
                  ),
                ),
                const SizedBox(width: 8.0),
                const Text('до'),
                const SizedBox(width: 8.0),
                SizedBox(
                  width: 80,
                  height: 31,
                  child: TextField(
                    focusNode: _focusNode2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: const TextStyle(color: kGreyColor2),
                      filled: true,
                      fillColor: _fillColor2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: kTextColor, fontSize: 14), // Уменьшение размера текста
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            RadioListTile(
              value: 'cheaper',
              groupValue: _selectedPriceOption,
              onChanged: (value) {
                setState(() {
                  _selectedPriceOption = value.toString();
                });
              },
              title: const Text('Дешевле'),
              contentPadding: EdgeInsets.zero,
            ),
            RadioListTile(
              value: 'expensive',
              groupValue: _selectedPriceOption,
              onChanged: (value) {
                setState(() {
                  _selectedPriceOption = value.toString();
                });
              },
              title: const Text('Дороже'),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Дата',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            RadioListTile(
              value: 'newest',
              groupValue: _selectedDateOption,
              onChanged: (value) {
                setState(() {
                  _selectedDateOption = value.toString();
                });
              },
              title: const Text('Сначала новые'),
              contentPadding: EdgeInsets.zero,
            ),
            RadioListTile(
              value: 'oldest',
              groupValue: _selectedDateOption,
              onChanged: (value) {
                setState(() {
                  _selectedDateOption = value.toString();
                });
              },
              title: const Text('Сначала старые'),
              contentPadding: EdgeInsets.zero,
            ),
            RadioListTile(
              value: 'default',
              groupValue: _selectedDateOption,
              onChanged: (value) {
                setState(() {
                  _selectedDateOption = value.toString();
                });
              },
              title: const Text('По умолчанию'),
              activeColor: Colors.purple,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
