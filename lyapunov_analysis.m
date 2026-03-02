clear; clc; close all;
load("linearized_model_ss.mat")

% ----- Time invariant system parameters -----

M = 4; % mass of the chart (kg)
m = 0.2; % mass of the pendulum (kg)
l = 1.5; % length of C.O.M. of the pendulum (m)
g = 9.81; % gravity constant (m/s^2)
b = 0.04; % viscous friction of the revolute joint (N*m*s/rad)
c = 0.655; % viscous friction between the cart and rail (N/(m/s))

disp("--------------- linearized model state-space ---------------")
A = LinearAnalysisToolProject.LocalVariables.Value.A
B = LinearAnalysisToolProject.LocalVariables.Value.B
CM = [B A*B (A^2)*B (A^3)*B];
disp("--------------- rank(CM) ---------------")
r = rank(CM)

disp("--------------- see the unstable state causing downfall ---------------")
eigA = eig(A)


Q = diag([1 0.1 100 2000]);
R = 2;
disp("--------------- LQR Gain ---------------")
K_lqr = lqr(A,B,Q,R)
s = size(K_lqr)
