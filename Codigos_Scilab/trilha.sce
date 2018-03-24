//programa: trilha.sce
//Solução Numérica da Equação de Laplace 
//Potencial na Trilha Condutiva
clear;

N = 9; //Número de Quadrados
Vmax = 5; //Tensão máxima aplicada
W = 1; //Tamanho do Quadrado

//Construindo a Matriz:
A = zeros(N,N);
i = 1:N;

//Diagonal Principal
for l = 1:N
    A(l,l) = 1;
end

//Direita
for l = 2:(N-1)
    c = l + 1;
    A(l,c) = -0.5;
end

//Esquerda
for l = 2:(N-1)
    c = l - 1;
    A(l,c) = -0.5;
end

b = zeros(N,1);
b(N) = Vmax;

v = A\b;
disp(v);

x = W*(i-1) + W/2;
L = N*W;

plot(x,v);
plot(x,v,'ro');
plot([0 L],[0 Vmax],'k');
title('Gráfico: Potencial x Posição');
xlabel('x [cm]');
ylabel('Potencial [volt]');


