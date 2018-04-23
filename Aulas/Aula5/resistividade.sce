//programa: resistividade.sce
N = 1000; //Número de Pontos
ni = 1.5e10; //Silício[1/cm^3]
e = 1.602e-19;
Nd = logspace(6,18,N);
mi = 0*Nd;
n0 = 0*Nd;
ro = 0*Nd;

for i = 1:N
    //Fórmula para a Mobilidade: Silício (Impureza Doadora)
    mi(i) = 65 + (1265/(1+(Nd(i)/8.5e16)^0.72)); //300K   
end
scf(1);
plot2d('ll',Nd,mi);
xlabel('Concentração de Impurezas Doadoras [1/cm^3]');
ylabel('Mobilidade [cm^2/V.s]');
title('Curva mi x Nd');

for i = 1:N
    //Fórmula para a Concentração de Elétrons (Faixa Extrínseca)
    n0(i) = Nd(i)/2 + sqrt(((Nd(i)^2)/2)+ni^2);    
end
scf(2);
plot2d('ll',Nd,n0);
xlabel('Concentração de Impurezas Doadoras [1/cm^3]');
ylabel('Concentração de Elétrons [1/cm^3]');
title('Curva n0 x Nd');

for i = 1:N
    //Fórmula para a Resistividade
    ro(i) = 1/(e*n0(i)*mi(i));    
end
scf(3);
plot2d('ll',Nd,ro);
xlabel('Concentração de Impurezas Doadoras [1/cm^3]');
ylabel('Resistividade [ohms.cm]');
title('Curva ro x Nd');
