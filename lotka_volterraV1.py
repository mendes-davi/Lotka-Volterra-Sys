import numpy as np
import matplotlib.pyplot as plt


def lotka_volterra(p0, v0, tau, c, f, s, r, tf):
    steps = int(np.ceil(tf / tau))
    n = 0
    P = np.zeros(steps)
    V = np.zeros(steps)
    T = np.zeros(steps)
    P[0], V[0] = p0, v0
    while n < steps - 1:
        T[n + 1] = T[n] + tau
        P[n + 1] = P[n] + tau * (-c * P[n] + f * s * P[n] * V[n])
        V[n + 1] = V[n] + tau * (r * V[n] - s * P[n] * V[n])
        n += 1
    
    return np.array(T), np.array(P), np.array(V)

#Constantes
p0 = 10;
v0 = 1;
tf = 5;
delta_t = 1e-6;
c = 1;
f = 0.4;
s = 0.4;
r = 3;

T, P, V = lotka_volterra(p0, v0, delta_t, c, f, s, r, tf)

plt.plot(T, P, label='Predadores')
plt.plot(T, V, label='Presas')
plt.title('Dinâmica populacional')
plt.legend(loc='best')
plt.show()