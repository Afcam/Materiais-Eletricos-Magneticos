//Exemplo: Ajuste de Modelo por Mínimos Quadrados
//Caso Linear: y =f(x) = kx + b
//%Programa:MQF0.sce

clear;
N = 9;
xp = [-4,-3,-2,-1,0,1,2,3,4];
fp = 2*xp + 2;

plot(xp,fp,'or');

//Funções Base Não- (Necessariamente ) Ortogonais
g1 = xp;
g2 = ones(1,N);

a11 = sum(g1.*g1);
a12 = sum(g1.*g2);
a21 = sum(g2.*g1);
a22 = sum(g2.*g2);

b1 = sum(fp.*g1);
b2 = sum(fp.*g2);

A = [ a11 a12; a21 a22];
b = [b1; b2];

alfa = A\b;
disp(alfa,'alfa = ');

M = 100;
xc = linspace(min(xp),max(xp),M);
gc1 = xc;
gc2 = ones(1,M);

fc = alfa(1)*gc1 + alfa(2)*gc2;
plot(xc,fc,'b');

EQT = sum((fp - (alfa(1)*g1 + alfa(2)*g2)).^2);
disp(EQT,'EQT = ');
