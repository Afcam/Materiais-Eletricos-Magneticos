//programa: aphi.sce
//Poço 1D de Potenciais Infinitos

clear;

N = 100; //Número de Pontos
L = 1e-9;//[m]
x = linspace(0,L,N);//[m]
n = 1; //Nível de Energia
h = 6.626e-34; //[J.s]
hb = h/(2*%pi);
m = 9.1e-31; //[kg]
A = sqrt(2/L);
kn = n*%pi/L; //[rad/m]
wn = (hb*(kn^2))/(2*m); //[rad/s]

fn = wn/(2*%pi);
Tn = 1/fn;
dx = x(2)-x(1);

dt = Tn/100 //[s]

scf(1)
plot(x,0*x);
f=gcf();

a=get("current_axes");
a.data_bounds=[0,-A;L,A];

t = 0;
while(t < 5*Tn ) 
    t = t + dt;
    phi = ((A*sin(kn*x))*exp(-%i*wn*t));
    p = abs(phi).^2;
    pn = (A/max(p))*p; //Normalizada
   
    drawlater;
    scf(1);
    clf(1);
    plot(x,real(phi),'r',x,imag(phi),'g');
    plot(x,pn,'b');

    a=get("current_axes");
    a.data_bounds=[0,-A;L,A];

    drawnow;
end




