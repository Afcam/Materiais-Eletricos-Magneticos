//programa: aphi_sup.sce
//Superposição em Poço 1D de Potenciais Infinitos

clear;

N = 100; //Número de Pontos
L = 1e-9;//[m]
x = linspace(0,L,N);//[m]

h = 6.626e-34; //[J.s]
hb = h/(2*%pi);
m = 9.1e-31; //[kg]
A = sqrt(2/L);

n1 = 1; //Nível de Energia-1
n2 = 2; //Nível de Energia-2

kn1 = n1*%pi/L; //[rad/m]
kn2 = n2*%pi/L; //[rad/m]

wn1 = (hb*(kn1^2))/(2*m); //[rad/s]
wn2 = (hb*(kn2^2))/(2*m); //[rad/s]

fn1 = wn1/(2*%pi);
Tn1 = 1/fn1;
dx = x(2)-x(1);

dt = Tn1/100 //[s]

scf(1)
plot(x,0*x);
f=gcf();

a=get("current_axes");
a.data_bounds=[0,-1.2*A;L,1.2*A];

t = 0;

while( t < 10*Tn1 ) 
    t = t + dt;
    
    phi1 = ((A*sin(kn1*x))*exp(-%i*wn1*t));
    phi2 = ((A*sin(kn2*x))*exp(-%i*wn2*t));
    
    phi = (1/sqrt(2))*(phi1 + phi2);
    p = abs(phi).^2;
    pn = (A/max(p))*p; //Normalizada

    drawlater;
    scf(1);
    clf(1);

    plot(x,real(phi),'r',x,imag(phi),'g');
    plot(x,pn,'b');
        
    a=get("current_axes");
    a.data_bounds=[0,-1.2*A;L,1.2*A];
        
    drawnow;
end





