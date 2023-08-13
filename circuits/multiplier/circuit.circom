pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal x;
   signal y;
   signal output q;
   component myAndg = AND();
   component myOrg = OR();
   component myNotg = NOT();
   myAndg.a <== a;
   myAndg.b <== b;
   x <== myAndg.out;
   myNotg.in <== b;
   y <== myNotg.out;
   myOrg.a <== x;
   myOrg.b <== y;
   q <== myOrg.out;
}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();