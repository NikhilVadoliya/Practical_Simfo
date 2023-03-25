enum FontFamilyType { prozaLibre, openSans }

enum FontWeightType { light, regular, medium, semiBold, bold }

getFontFamilyType(FontFamilyType? fontFamilyType) {
  switch (fontFamilyType) {
    case FontFamilyType.prozaLibre:
      return 'ProzaLibre';
    case FontFamilyType.openSans:
      return 'OpenSans';
    case null:
      return '';
  }
}
