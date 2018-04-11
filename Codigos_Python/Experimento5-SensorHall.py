import numpy as np
import matplotlib.pyplot as plt

def mmq(x, y,z, f):


    # Definindo a matriz F
    F = np.ones((len(x), len(f)))
    for j in range(len(f)):
        F[:,j] = f[j](x,z)

    # Definindo a matriz à esquerda
    left = np.dot(F.transpose(), F)

    # Definindo o vetor à direita
    right = np.dot(F.transpose(), y)

    # Resolvendo o sistema linear para encontrar os valores dos coeficientes C
    C = np.linalg.solve(left, right)
    return C

def f1(x,z):
    return x*z
def f2(x,z):
    return z

f = [f1, f2]


# Definir pontos iniciais
V_r1 = np.array([0.0561, 0.160, 0.228, 0.360, 0.315, 0.385, 0.395, 0.425]) #v
V_r2 = np.array([0.378, 1.240, 2.16, 3.11, 4.05, 5.05, 6.02, 7.00]) #V
z = np.array([4.92, 4.81, 4.80, 4.65, 4.65, 4.60, 4.75, 4.70]) #V

# U = R*I => I = U/R
y = (V_r1/1180)*(10**6) #uA Corrente I1 Varia
x = (V_r2/1180)*(10**6) #uA Corrente I2 Sempre Aumenta


C = mmq(x, y,z, f)

# X = np.linspace(0, 6000, 100)
# Z = np.linspace(4.9, 4.7, 100)
fx = np.zeros((len(x)))
for j in range(len(f)):
    fx = fx + C[j] * f[j](x,z)
print (C)

#Grafico
plt.plot(x, y, 'bo')
plt.plot(x, fx, '-k')
Erro =  np.sqrt(np.sum((y-fx)**2)/ len(y))
plt.plot(x, fx-Erro, '--y')
plt.plot(x, fx+Erro, '--y')
#Legendas
plt.title('Dispersão $V_1 = 5V$ ')
plt.xlabel('Corrente  $I_2$ $(\mu A)$')
plt.ylabel('Corrente  $I_1$ $(\mu A)$')
plt.grid(True)
plt.legend(['Pontos Experimentais', 'Modelo Ajustado','EQM'])

# print('erro: %.3e' % (fx.sum() - y))



# Erro = Erro.Sum
# np.sqrt3/5
print (Erro)
# Mostrando o gráfico
plt.show()
