clear all; close all; clc;

p0 = 10;
v0 = 1;
T = 5;
delta_t = 1e-6;
c = 1;
f = 0.4;
s = 0.4;
r = 3;
[p, v, t] = lotka_volterra(p0, v0, delta_t, c, f, s, r, T);

plot(t, v, 'b', 'linewidth', 1);
hold on;
plot(t, p, 'r--', 'linewidth', 1);
legend('Presa', 'Predador');
grid on
