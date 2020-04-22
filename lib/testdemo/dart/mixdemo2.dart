abstract class Base {
  a() {
    print("base a()");
  }

  b() {
    print("base b()");
  }

  c() {
    print("base c()");
  }
}

class A extends Base {
  a() {
    print("A.a()");
    super.a();
  }

  b() {
    print("A.b()");
    super.b();
  }
}

class A2 extends Base {
  a() {
    print("A2.a()");
    super.a();
  }
}

class B extends Base {
  a() {
    print("B.a()");
    super.a();
  }

  b() {
    print("B.b()");
    super.b();
  }

  c() {
    print("B.c()");
    super.c();
  }
}

class G extends B with A, A2 {

}
main() {
  testMixins();
}
testMixins() {
  G t = new G();
  t.a();
  t.b();
  t.c();
}