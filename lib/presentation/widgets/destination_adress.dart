import 'package:flutter/material.dart';

class DestinationAdress extends StatelessWidget {
  const DestinationAdress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            child: Text(
              'Destination Address',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: ShapeDecoration(
              color: Color(0xFFF5F5FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    'Jane Doe',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  child: Text(
                    '(+62) 812-3456-7890',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.800000011920929),
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  child: Text(
                    'Jalan Pesona Indah Blok C2 No. 25, Perumahan Harmoni Heights, Kelurahan Pesona Sejahtera, Kecamatan Serasi Jaya, Kode Pos 12345, Indonesia',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 12,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
