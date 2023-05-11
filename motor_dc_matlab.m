% Parámetros del motor DC
Ra = 2;
Kt = 0.01;
b = 0.0012;
La = 0.023;
Ke = 0.01;
J = 0.001;

% Matrices del modelo en espacio de estados
A = [-Ra/La -Ke/La; Kt/J -b/J];
B = [1/La; 0];
C = [0 1];
D = 0;

% Función de control para la corriente de armadura
u = @(t) 10;

% Condiciones iniciales
x0 = [0; 0];

% Tiempo de simulación
tspan = [0 10];

% Integración del modelo usando ODE45
[t, x] = ode45(@(t, x) A*x + B*u(t), tspan, x0);

% Gráfico de la posición angular del motor
figure
plot(t, x(:, 2))
xlabel('Tiempo (s)')
ylabel('Posición angular (rad)')
title('Simulación de un motor DC')
