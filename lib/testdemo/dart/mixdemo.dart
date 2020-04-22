class A {
  a() {
    print("A.a()");
  }

  b() {
    print("A.b()");
  }
}

class A2 {
  a() {
    print("A2.a()");
  }
}

class B {
  a() {
    print("B.a()");
  }

  b() {
    print("B.b()");
  }

  c() {
    print("B.c()");
  }
}

class G extends B with  A2,A {

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




