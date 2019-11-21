class Human{
  int age;
  double height;
  double weight;
  String gender;
  String email;
  String pass;

  Human ({int a, double h, double w, String g, String e,String p}){
    age=a;
    height=h;
    weight=w;
    gender=g;
    email=e;
    pass=p;
  }

  double bmiResult(double h, double w){
    return w/h*h;
  }

}