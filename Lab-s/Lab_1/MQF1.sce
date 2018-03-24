//Exemplo: Ajuste de Modelo por Mínimos Quadrados
//Caso com 2 Funções-base Ortogonais
//%Programa:MQF1.sce

clear;
N = 9;
xp = [-4,-3,-2,-1,0,1,2,3,4];
fp = 4*(xp.^2) + 20*xp;

plot(xp,fp,'or');

//Funções Base Ortogonais
g1 = xp.^2;
g2 = xp;

a1 = sum(fp.*g1)/sum(g1.*g1);
a2 = sum(fp.*g2)/sum(g2.*g2);

M = 100;
xc = linspace(min(xp),max(xp),M);
gc1 = xc.^2;
gc2 = xc;

fc = a1*gc1 + a2*gc2;
plot(xc,fc,'b');

disp(a1,a2);

EQT = sum((fp - (a1*g1 + a2*g2)).^2);
disp(EQT,'EQT = ');
