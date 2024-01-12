import 'package:flutter/material.dart';

class MaterialItem extends StatefulWidget {
  const MaterialItem({Key? key}) : super(key: key);

  @override
  State<MaterialItem> createState() => _MaterialItemState();
}

class _MaterialItemState extends State<MaterialItem> {
  String selectedOption = 'Cotton';
  List<String> options = ['Cotton', 'Nylon', 'Wool'];

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
                  'Material',
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
