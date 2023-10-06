//Q is the output Qn is the negation of Q
module d_latch(Q, Qn, Clock, D);
   output Q;
   output Qn;
   input  Clock;   
   input  D;

   wire   Dn; 
   wire   D1;
   wire   Dn1;

   not(Dn, D);   
   and(D1, Clock, D);
   and(Dn1, Clock, Dn);   
   nor(Qn, D1, Q);
   nor(Q, Dn1, Qn);
endmodule
