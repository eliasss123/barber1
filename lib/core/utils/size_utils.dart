import 'dart:ui' as ui;
import 'package:flutter/material.dart';

// This functions are responsible to make UI responsive across all the mobile devices.

MediaQueryData mediaQueryData = MediaQueryData.fromWindow(ui.window);

// These are the Viewport values of your Figma Design.
// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 390;
const num FIGMA_DESIGN_HEIGHT = 844;
const num FIGMA_DESIGN_STATUS_BAR = 0;

///This extension is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
extension ResponsiveExtension on num {
  ///This method is used to get device viewport width.
  get _width {
    return mediaQueryData.size.width;
  }

  ///This method is used to get device viewport height.
  get _height {
    num statusBar = mediaQueryData.viewPadding.top;
    num bottomBar = mediaQueryData.viewPadding.bottom;
    num screenHeight = mediaQueryData.size.height - statusBar - bottomBar;
    return screenHeight;
  }

  ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
  double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);

  ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  double get v =>
      (this * _height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);

  ///This method is used to set smallest px in image height and width
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  ///This method is used to set text font size according to Viewport
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }
}



// import 'package:flutter/material.dart';

// // Constants for Figma design dimensions
// const num FIGMA_DESIGN_WIDTH = 390;
// const num FIGMA_DESIGN_HEIGHT = 844;
// const num FIGMA_DESIGN_STATUS_BAR = 0;

// // Extension methods for responsive design
// extension ResponsiveExtension on num {
//   // Gets the responsive width based on the device's screen width
//   double getResponsiveWidth(BuildContext context) {
//     final mediaQueryData = MediaQuery.of(context);
//     final screenWidth = mediaQueryData.size.width;
//     return (this * screenWidth) / FIGMA_DESIGN_WIDTH;
//   }

//   // Gets the responsive height based on the device's screen height
//   double getResponsiveHeight(BuildContext context) {
//     final mediaQueryData = MediaQuery.of(context);
//     final screenHeight = mediaQueryData.size.height - mediaQueryData.viewPadding.top - mediaQueryData.viewPadding.bottom;
//     return (this * screenHeight) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);
//   }

//   // Gets the adaptive size for elements like text
//   double getAdaptiveSize(BuildContext context) {
//     final height = getResponsiveHeight(context);
//     final width = getResponsiveWidth(context);
//     return height < width ? height : width;
//   }

//   // Gets the responsive font size
//   double getResponsiveFontSize(BuildContext context) => getAdaptiveSize(context);
// }

// // Extension method to format double values
// extension FormatExtension on double {
//   // Returns a double value formatted to the given number of fraction digits
//   double toDoubleValue({int fractionDigits = 2}) {
//     return double.parse(this.toStringAsFixed(fractionDigits));
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: MyResponsiveWidget(),
//         ),
//       ),
//     );
//   }
// }

// class MyResponsiveWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Example usage of responsive height and width
//     final responsiveHeight = 200.0.getResponsiveHeight(context);
//     final responsiveWidth = 100.0.getResponsiveWidth(context);

//     return Container(
//       height: responsiveHeight,
//       width: responsiveWidth,
//       color: Colors.blue,
//       child: Center(
//         child: Text(
//           'Responsive Box',
//           style: TextStyle(
//             fontSize: 20.0.getResponsiveFontSize(context),
//           ),
//         ),
//       ),
//     );
//   }
// }
