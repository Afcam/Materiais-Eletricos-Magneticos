//Programa: dif.sce
//Modelo de Difusão
//Pulso Quadrado
//Fronteiras Fechadas
clear;

N = 30; //Número de Nós
L = 1; //Comprimento [m]

D = 1; //input('D = '); //Coeficiente de Difusão

xmin = 0; 
xmax = L; //[m]
dx = (xmax - xmin)/(N-1); //Passo [m]
xp = linspace(xmin,xmax,N); //[m]

up = 0*xp; //tempo posterior: u(k+1)
uc = 0*xp; //tempo corrente: u(k)

Kd = 0.2 //Constante de Difusão
//Estabilidade: Kd <= 1/2 
dt = Kd*(dx^2)/D; 
disp('dt = ');
disp(dt);

//Pulso Quadrado
uc(13:18) = 1;

scf(1);
clf(1);
plot(xp,uc,'b');
square(0,0,1,1.2);
sleep(3000);

while(%t) //Tempo Discreto
    drawlater;
    for i = 2:(N-1) //Posição Discreta
        up(i) = uc(i) + Kd*(uc(i+1) + uc(i-1) - 2*uc(i));
    end
    
    //Fronteiras Fechadas
    up(1) = uc(1) + Kd*(uc(2) - uc(1));
    up(N) = uc(N) + Kd*(uc(N-1) - uc(N));
    
    scf(1);
    clf(1);
    plot(xp,up,'b');
    square(0,0,1,1.2);
    drawnow;
    
    uc = up;
end
    



