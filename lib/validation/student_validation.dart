class StudentValidationmixin{

  String validateFirstName(String value){
    if(value.length<2){
      return "İsim en az 2 karakterli olmalıdır!!!";
    }
  }

  String validateLastName(String value){
    if(value.length<2){
      return "Soyad en az 2 karakterli olmalıdır!!!";
    }
  }
  String validateGrade(String value){
    var grade = int.parse(value);
    if(grade<0 || grade>100){
      return "Not 0-100 arasında olmak zorundadır!!!";
    }
  }
}