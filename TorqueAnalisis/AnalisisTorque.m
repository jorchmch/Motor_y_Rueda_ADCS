clc,clear
close all
wmax = 4200; %RPM
wmax = wmax* 2*pi/60;  % to Rad/s

% Matriz momento de inercia
% unidades: g * mm^2
J_pla = [2356 0 0; 0 3252 0; 0 0 2356];
J_alum = [6840 0 0; 0 9443 0; 0 0 6840];
% J_inox = [2   2744 0 0; 0 32898 0; 0 0 22744];
J_inox = [20455 0 0; 0 28389 0; 0 0 20455];

% conversion a kg * m^2->
% g * mm^2 = (kg*m^2) * 1E-9
J_pla = J_pla *1E-9;
J_alum = J_alum*1E-9;
J_inox = J_inox*1E-9;


% Calculo de Momento
L_pla = wmax*J_pla;
L_alum = wmax*J_alum;
L_ino = wmax*J_inox;

% conversion del Momento
% mN*m = (N*m) / 0.001
L_pla = L_pla / 1E-3;
L_alum = L_alum / 1E-3;
L_ino = L_ino / 1E-3;

% Visualizacion
disp('L: Momento (mN.m.seg)');
disp('Momento Rueda PLA')
disp(L_pla);
disp('Momento Rueda aluminio')
disp(L_alum);
disp('Momento Rueda Acero Inoxidable')
disp(L_ino);

load('ModeloMotorMaxonV1.mat')
% open_system("torque.slx");
Datos   =sim("torque.slx");

figure
plot(Datos.tout,Datos.Momento,'LineWidth',2);
grid on
% hold on
% plot(Datos.PWM);
title('Momento Angular');
xlabel('tiempo (segundos)')
ylabel("Momento (N.M.seg)")



figure
plot(Datos.tout,Datos.Torque,'LineWidth',2);
grid on
% hold on
% plot(Datos.PWM);
title('Torque');
xlabel('tiempo (segundos)')
ylabel("Torque (N.M)")
legend('Torque XZ','Torque Y')

figure
plot(Datos.tout,Datos.VelAngular,'LineWidth',2);
grid on
hold on
plot(Datos.tout,Datos.PWM,'LineWidth',2);
title('Revoluciones por segundo');
xlabel('tiempo (segundos)')
ylabel("Velocidad (RPS)")
legend('Velocidad RPS','Señal de entrada')


