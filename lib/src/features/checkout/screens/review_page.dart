import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: SingleChildScrollView(
        child: Frame(),
      ),
    );
  }
}

class Frame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 592.81,
          height: 1185.62,
          decoration: BoxDecoration(color: const Color(0xFF121212)),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 592.81,
                  height: 1185.62,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 123.50,
                        top: 0,
                        child: Container(
                          width: 345.81,
                          height: 1185.62,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 123.50,
                                child: Container(
                                  width: 345.81,
                                  height: 1062.12,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: -132.69,
                                        top: 13.31,
                                        child: SizedBox(
                                          width: 363.96,
                                          height: 52.22,
                                          child: Text(
                                            'Delivery Address',
                                            style: TextStyle(
                                              color: const Color(0xFFE0E0E0),
                                              fontSize: 43.98,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w700,
                                              height: 1.25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -145.04,
                                top: 0.19,
                                child: Container(
                                  width: 615.69,
                                  height: 219.89,
                                  decoration: BoxDecoration(color: const Color(0xFF121212)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 32.96,
                                        top: 30.23,
                                        child: Container(
                                          width: 33.01,
                                          height: 38.48,
                                          child: Stack(),
                                        ),
                                      ),
                                      Positioned(
                                        left: 251.22,
                                        top: 34.01,
                                        child: SizedBox(
                                          width: 113.68,
                                          height: 30.92,
                                          child: Text(
                                            'Checkout',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0xFFE0E0E0),
                                              fontSize: 24.74,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w700,
                                              height: 1.25,
                                              letterSpacing: -0.37,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 538.73,
                                        top: 21.99,
                                        child: Container(width: 54.97, height: 54.97),
                                      ),
                                      Positioned(
                                        left: 52.76,
                                        top: 115.44,
                                        child: Container(
                                          width: 43.98,
                                          height: 43.98,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF66BB6A),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(13741.66),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 10.99,
                                                top: 8.25,
                                                child: Container(
                                                  width: 21.99,
                                                  height: 27.49,
                                                  child: Stack(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 41.89,
                                        top: 170.41,
                                        child: SizedBox(
                                          width: 66.21,
                                          height: 21.99,
                                          child: Text(
                                            'Address',
                                            style: TextStyle(
                                              color: const Color(0xFF66BB6A),
                                              fontSize: 16.49,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w700,
                                              height: 1.33,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 138.53,
                                        top: 152.55,
                                        child: Container(
                                          width: 105.55,
                                          height: 2.75,
                                          decoration: BoxDecoration(color: const Color(0xFF424242)),
                                        ),
                                      ),
                                      Positioned(
                                        left: 285.83,
                                        top: 115.44,
                                        child: Container(
                                          width: 43.98,
                                          height: 43.98,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 2.75,
                                                color: const Color(0xFF424242),
                                              ),
                                              borderRadius: BorderRadius.circular(13741.66),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 10.99,
                                                top: 8.25,
                                                child: Container(
                                                  width: 21.99,
                                                  height: 27.49,
                                                  child: Stack(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 272.69,
                                        top: 170.41,
                                        child: SizedBox(
                                          width: 70.77,
                                          height: 21.99,
                                          child: Text(
                                            'Payment',
                                            style: TextStyle(
                                              color: const Color(0x7FE0E0E0),
                                              fontSize: 16.49,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 1.33,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 371.60,
                                        top: 152.55,
                                        child: Container(
                                          width: 105.55,
                                          height: 2.75,
                                          decoration: BoxDecoration(color: const Color(0xFF424242)),
                                        ),
                                      ),
                                      Positioned(
                                        left: 518.91,
                                        top: 115.44,
                                        child: Container(
                                          width: 43.98,
                                          height: 43.98,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 2.75,
                                                color: const Color(0xFF424242),
                                              ),
                                              borderRadius: BorderRadius.circular(13741.66),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 11,
                                                top: 8.25,
                                                child: Container(
                                                  width: 21.99,
                                                  height: 27.49,
                                                  child: Stack(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 512.46,
                                        top: 170.41,
                                        child: SizedBox(
                                          width: 57.32,
                                          height: 21.99,
                                          child: Text(
                                            'Review',
                                            style: TextStyle(
                                              color: const Color(0x7FE0E0E0),
                                              fontSize: 16.49,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 1.33,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -123.69,
                                top: 1116.81,
                                child: Container(
                                  width: 592.81,
                                  height: 68.70,
                                  decoration: BoxDecoration(color: const Color(0xFF121212)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 123.50,
                                        top: 0,
                                        child: Container(
                                          width: 345.81,
                                          height: 68.70,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 0.77,
                                                color: const Color(0xFF424242),
                                              ),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 20.31,
                                                top: -0.11,
                                                child: Container(
                                                  width: 306,
                                                  height: 50,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFF103414),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(14.19),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 55.87,
                                                        top: 10.92,
                                                        child: Container(
                                                          width: 194.24,
                                                          height: 28.38,
                                                          clipBehavior: Clip.antiAlias,
                                                          decoration: BoxDecoration(),
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 2.36,
                                                                child: SizedBox(
                                                                  width: 194.63,
                                                                  height: 22.47,
                                                                  child: Text(
                                                                    'Cancel Order',
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                      color: const Color(0xFFD9D9D9),
                                                                      fontSize: 18.92,
                                                                      fontFamily: 'Work Sans',
                                                                      fontWeight: FontWeight.w700,
                                                                      height: 1.50,
                                                                      letterSpacing: 0.28,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -72.69,
                                top: 1010.81,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 491.96,
                                    height: 66.23,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF66BB6A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14.19),
                                      ),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x4C66BB6A),
                                          blurRadius: 7.10,
                                          offset: Offset(0, 4.73),
                                          spreadRadius: -4.73,
                                        )
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 148.87,
                                          top: 18.92,
                                          child: Container(
                                            width: 194.24,
                                            height: 28.38,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0.13,
                                                  top: 4.08,
                                                  child: SizedBox(
                                                    width: 214,
                                                    height: 20,
                                                    child: Text(
                                                      'Complete Order',
                                                      style: TextStyle(
                                                        color: const Color(0xFF121212),
                                                        fontSize: 24,
                                                        fontFamily: 'Work Sans',
                                                        fontWeight: FontWeight.w400,
                                                        height: 0.82,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -98.69,
                                top: 561.81,
                                child: Container(
                                  width: 516,
                                  height: 138,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF1D1D1D),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.65),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 21.30,
                                        top: 26.63,
                                        child: Container(
                                          width: 85.21,
                                          height: 85.21,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage("https://placehold.co/85x85"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.65),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 127.81,
                                        top: 21.30,
                                        width: 89.09, // Moved from SizedBox
                                        height: 31.95, // Moved from SizedBox
                                        child: const Text( // Added const
                                          'Bananas',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.30,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w600,
                                            height: 1.50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 127.81,
                                        top: 53.26,
                                        width: 70.82, // Moved from SizedBox
                                        height: 26.63, // Moved from SizedBox
                                        child: const Text( // Added const
                                          '1 bunch',
                                          style: TextStyle(
                                            color: const Color(0xFF9CA3AF),
                                            fontSize: 18.64,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w400,
                                            height: 1.43,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 127.81,
                                        top: 85.21,
                                        width: 55.27, // Moved from SizedBox
                                        height: 31.95, // Moved from SizedBox
                                        child: const Text( // Added const
                                          '\$1.29',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.30,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w700,
                                            height: 1.50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 449,
                                        top: 57,
                                        width: 44, // Moved from SizedBox
                                        height: 32, // Moved from SizedBox
                                        child: const Text( // Added const
                                          '1 pc',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.30,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w600,
                                            height: 1.50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 352,
                                        top: 56,
                                        width: 94, // Moved from SizedBox
                                        height: 32, // Moved from SizedBox
                                        child: const Text( // Added const
                                          'Quantity',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFFA5A5A5),
                                            fontSize: 20,
                                            fontFamily: 'Wix Madefor Display',
                                            fontWeight: FontWeight.w400,
                                            height: 1.60,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -97.69,
                                top: 241.81,
                                child: Container(
                                  width: 515,
                                  height: 138,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF1D1D1D),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.65),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 128,
                                        top: 21,
                                        width: 259, // Moved from SizedBox
                                        height: 32, // Moved from SizedBox
                                        child: const Text( // Added const
                                          'Clover Sonoma ...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.30,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w700,
                                            height: 0.77,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 127.81,
                                        top: 53.26,
                                        width: 56.05, // Moved from SizedBox
                                        height: 26.63, // Moved from SizedBox
                                        child: const Text( // Added const
                                          '1 Litre',
                                          style: TextStyle(
                                            color: const Color(0xFF9CA3AF),
                                            fontSize: 18.64,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w400,
                                            height: 1.43,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 127.81,
                                        top: 85.21,
                                        width: 59.24, // Moved from SizedBox
                                        height: 31.95, // Moved from SizedBox
                                        child: const Text( // Added const
                                          '\$2.99',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.30,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w700,
                                            height: 1.50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 451,
                                        top: 57,
                                        width: 44, // Moved from SizedBox
                                        height: 32, // Moved from SizedBox
                                        child: const Text( // Added const
                                          '1 ltr',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.30,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w600,
                                            height: 1.50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 354,
                                        top: 56,
                                        width: 94, // Moved from SizedBox
                                        height: 32, // Moved from SizedBox
                                        child: const Text( // Added const
                                          'Quantity',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFFA5A5A5),
                                            fontSize: 20,
                                            fontFamily: 'Wix Madefor Display',
                                            fontWeight: FontWeight.w400,
                                            height: 1.60,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 21.30,
                                        top: 26.63,
                                        child: Container(
                                          width: 85.21,
                                          height: 85.21,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage("https://placehold.co/85x85"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.65),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 21,
                                        top: 26,
                                        child: Container(
                                          width: 83,
                                          height: 91,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage("https://placehold.co/83x91"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6.56),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 144,
                                        top: -15,
                                        width: 105.36,
                                        height: 42.36,
                                        child: const Text(
                                          'My Cart',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 27.23,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w700,
                                            height: 1.56,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -97.69,
                                top: 401.81,
                                child: Container(
                                  width: 515,
                                  height: 138,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF1D1D1D),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.65),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 21.30,
                                        top: 26.63,
                                        child: Container(
                                          width: 85.21,
                                          height: 85.21,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage("https://placehold.co/85x85"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.65),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 127.81,
                                        top: 21.30,
                                        width: 180.48, // Moved from SizedBox
                                        height: 31.95, // Moved from SizedBox
                                        child: const Text( // Added const
                                          'Sourdough Bread',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.30,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w600,
                                            height: 1.50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 127.81,
                                        top: 53.26,
                                        width: 44.36, // Moved from SizedBox
                                        height: 26.63, // Moved from SizedBox
                                        child: const Text( // Added const
                                          '500g',
                                          style: TextStyle(
                                            color: const Color(0xFF9CA3AF),
                                            fontSize: 18.64,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w400,
                                            height: 1.43,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 127.81,
                                        top: 85.21,
                                        width: 60.10, // Moved from SizedBox
                                        height: 31.95, // Moved from SizedBox
                                        child: const Text( // Added const
                                          '\$4.50',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.30,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w700,
                                            height: 1.50,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12.81,
                        top: 743.81,
                        child: Container(
                          width: 528.30,
                          height: 95.90,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.82,
                                color: const Color(0xFF1F2937),
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 42.94,
                                top: 14.24,
                                width: 118, // Moved from SizedBox
                                height: 20, // Moved from SizedBox
                                child: const Text( // Added const
                                  'Subtotal',
                                  style: TextStyle(
                                    color: const Color(0xFF9CA3AF),
                                    fontSize: 20,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0.98,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 448.94,
                                top: 14.24,
                                width: 79, // Moved from SizedBox
                                height: 20, // Moved from SizedBox
                                child: const Text( // Added const
                                  '\$9.37',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0.98,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 42.94,
                                top: 43.24,
                                width: 135, // Moved from SizedBox
                                height: 20, // Moved from SizedBox
                                child: const Text( // Added const
                                  'Delivery Fee',
                                  style: TextStyle(
                                    color: const Color(0xFF9CA3AF),
                                    fontSize: 20,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0.98,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 448.94,
                                top: 43.24,
                                width: 79, // Moved from SizedBox
                                height: 20, // Moved from SizedBox
                                child: const Text( // Added const
                                  '\$2.00',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0.98,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 42.94,
                                top: 73.24,
                                width: 84, // Moved from SizedBox
                                height: 23, // Moved from SizedBox
                                child: const Text( // Added const
                                  'Total',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 1.15,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 448.94,
                                top: 73.24,
                                width: 79, // Moved from SizedBox
                                height: 23, // Moved from SizedBox
                                child: const Text( // Added const
                                  '\$11.37',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 1.15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50.81,
                        top: 958.81,
                        width: 358, // Moved from SizedBox
                        height: 23, // Moved from SizedBox
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Estimated Delivery Time : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 1.15,
                                ),
                              ),
                              TextSpan(
                                text: '30 mins',
                                style: TextStyle(
                                  color: const Color(0xFF4CAF50),
                                  fontSize: 20,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w700,
                                  height: 1.15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}