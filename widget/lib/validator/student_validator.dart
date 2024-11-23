mixin StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "İsim alanı boş olamaz";
    }
    if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır";
    }
    return null;  // Validasyon başarılı
  }

  String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Soyad alanı boş olamaz";
    }
    if (value.length < 2) {
      return "Soyad en az iki karakter olmalıdır";
    }
    return null;  // Validasyon başarılı
  }

  String? validateGrade(String? value) {
    if (value == null || value.isEmpty) {
      return "Not alanı boş olamaz";
    }

    try {
      var grade = int.parse(value);
      if (grade < 0 || grade > 100) {
        return "Not 0-100 arasında olmalıdır";
      }
    } catch (e) {
      return "Lütfen geçerli bir sayı giriniz";
    }

    return null;  // Validasyon başarılı
  }
}