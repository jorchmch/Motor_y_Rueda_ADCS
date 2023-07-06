load('ModeloMotorMaxonV1.mat')

% Hecho por: Jorch Mendoza Ch.
% 30 de Junio 2023
% Proyecto: Desarrollo de un modulo ADCS para diseño de algoritmos de 
% control de actitud en Cubesats de orbita baja.

% Resumen: 
% Variable de entradas 1: PWM [0 - 100%] duty cycle
% Variable de salida 1: RPS [0 - 70] Revoluciones por segundo


% sysC : modelo en tiempo continuo
% sysD : modelo en tiempo discreto (*Recomendado)
% sysNL : modelo no lineal al 97.7%
% sysSS : Modelo en espacio de estados (3 estados desconocidos)

% El metodo de identificacion Bagged Regresion Tree Ensemble
% La linealizacion se alcanzo linealizando las partes de la muestras.

% NOTA: 
% El mejor modelo es el discreto (sysD), debe agregarse una condicion en la
% salida, la cual debe restar 7 RPS para valores mayores a 0.
% %          _______
% %         |       |   y  _______
% % u(s)----| sysD  |---- | y>0   |------y(s)
% %         |_______|     |  y=y-7|
% %                       |_______|

open_system("ModeloMotorMaxon.slx");


