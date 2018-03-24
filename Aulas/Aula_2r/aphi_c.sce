//programa: aphi_c.sce
//Relógio para o Poço 1D de Potenciais Infinitos

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
M = 100;
dt = Tn/(M-1) //[s]

xc = linspace(-A,A,100);
yc = sqrt(A^2 - xc^2);
scf(1)
plot(xc,yc);
plot(xc,-yc);
f=gcf();

mtlb_axis('equal');

t = 0;
while( t <= Tn ) 

    phi = ((A*sin(kn*x))*exp(-%i*wn*t))';
    
    //disp(t)
        
    drawlater;
        
    scf(1);
    clf;
    plot(xc,yc);
    plot(xc,-yc);
    plot(real(phi(50)),imag(phi(50)),'or');
    plot([0 real(phi(50))],[0 imag(phi(50))]);
    mtlb_axis('equal');
    title('Gráfico: Imag(phi(L/2)) vs. Real(phi(L/2))');
    xlabel('Real(phi(L/2))');
    ylabel('Imag(phi(L/2))');
               
    drawnow;
    
    t = t + dt;
end




