part of values;

class AppTextStyles {
  static double defaultPadding = 10;

  static Text titleText(String text) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          fontSize: 25,
          shadows: [
            const Shadow(
                color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
          ],
          color: Colors.white),
    );
  }

  static Text titleTextDark(String text) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          shadows: [
            const Shadow(
                color: Colors.black, offset: Offset(0.0, 0.2), blurRadius: 0.2),
          ],
          color: Colors.white30),
    );
  }

  static Text defaultText(String text) => Text(text,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          shadows: [
            const Shadow(
                color: Colors.black, offset: Offset(0.0, 0.2), blurRadius: 0.2),
          ],
          color: Colors.white));

  static Text greyText(String text) => Text(text,
      style:
          TextStyle(color: AppColors.lightGrey, fontWeight: FontWeight.w400));
}
