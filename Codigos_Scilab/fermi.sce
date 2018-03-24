//Programa: fermi.sce

M = 100;
kb = 1.38e-23; //[J/K]
//kb = 8.617e-5; //[eV/K]
T = 300; //[K]
//Obs: 1.602e-19 Joules = 1eV
Et = kb*T; //Energia Térmica [Joules]
Ef = 2*Et;//Nível de Fermi
E = linspace(0,4*Et,M);

for i = 1:100;

    Et = kb*(T/i);
    arg = (1/Et)*(E - Ef);
    f = (1 + exp(arg)).^-1;

    plot((1/Ef)*E,f,'r');
     
end

title('Função de Fermi')
xlabel('Energia [Joules] x 10^-20');
ylabel('Função'); 
 

