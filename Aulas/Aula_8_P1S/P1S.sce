//programa: P1S.sce
//Semestre:1/2018
clear;
format('e',10);

//Constantes
e = 1.602e-19; //[C]
h = 6.6262e-34; //[J.s]
c = 3e8; //[m/s]
kb = 1.38e-23; //[J/K]

//Questão-1
lambda = 500e-9; //[m]
p = h/lambda;
Ec = p*c; //[J]
ec = Ec/e; //[eV]
disp('Q1a: p = ');
disp(p); //[kg.m/s]
disp('Q1b: ec = ');
disp(ec); //[eV]

//Questão-2
Nd = 1e16; //[cm^-3]
n0 = Nd;
Rh = -1/(e*n0); //[cm^3/C]
disp('Q2a: n0 = ');
disp(n0); //[cm^-3]
disp('Q2b: Rh = ');
disp(Rh); //[cm^3/C]

//Questão-3
L = 1; //[cm]
W = 0.1; //[cm]
t = 1e-4; //[cm]
//T = 300;//[K]
mi_n = 1350; //[cm^2/V.s]
mi_p = 480; //[cm^2/V.s]
//n = p = ni
ni = 1.5e10; //[cm^-3]
s = e*ni*(mi_n + mi_p); //condutividade [S/cm]
disp('Q3a: s = ');
disp(s); //[Siemens/cm]
A = t*W; //[cm^2]
R = L/(A*s); //[ohms]
disp('Q3b: R = ');
disp(R); //[ohms]

//Questão-4
Vldr = [2 3]; //[volts]
Ildr = [1e-3 30e-3]; //[amp]
Iled = [0 10e-3]; //[amp]
C2 = Ildr(1)/Vldr(1); //[Siemens]
C1 = (Ildr(2) - C2*Vldr(2))/(Iled(2)*Vldr(2)); 
//C1 = [Siemens/A]ou[1/V]ou[A/W]
disp('Q4a: C1 = ');
disp(C1);
disp('Q4b: C2 = ');
disp(C2);

//Questão-5
T1 = 300;
Is1 = 1e-8; //[amp] T1 = 300 K
Is2 = 3e-8; //[amp] T2 = ?
Va = 1.2; //[volt]
Vb = 0.7; //[volt]
Vc = 0;
I = Is1*(exp((e/(kb*T1))*(Va-Vb))-1);//[amp]
T2 = (e*(Vb-Vc))/(kb*log(I/Is2 + 1)); //[K]
disp('Q5a: T2 = ');
disp(T2); //[K]
disp('Q5b: I = ');
disp(I); //[amp]
