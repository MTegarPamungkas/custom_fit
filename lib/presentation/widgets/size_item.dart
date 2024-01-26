import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SizeItem extends StatefulWidget {
  const SizeItem({Key? key}) : super(key: key);

  @override
  State<SizeItem> createState() => _SizeItemState();
}

class _SizeItemState extends State<SizeItem> {
  String selectedOption = 'L';
  List<String> options = ['L', 'M', 'XL'];

  @override
  void initState() {
    super.initState();
    // _loadSelectedOption();
    _saveSelectedOption(selectedOption);
  }

  // _loadSelectedOption() async {
  //   final box = await GetStorage().read('sizeBox');
  //   if (box != null && options.contains(box)) {
  //     setState(() {
  //       selectedOption = box;
  //     });
  //   }
  // }

  _saveSelectedOption(String newValue) async {
    await GetStorage().write('sizeItem', newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Size',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.42,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Quality affects materials',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 42,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.40,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Colors.black.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<String>(
              value: selectedOption,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.36,
              ),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                  _saveSelectedOption(selectedOption);
                });
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
