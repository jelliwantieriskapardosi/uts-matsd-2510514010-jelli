% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 6 — Optimasi Harga Produk via Gradient Descent 
%  --------------------------------------------------- 
%  Nama  : Jelli Wanti Eriska Pardosi 
%  NIM   : 2510514010 
%  Parameter: N=10, a=1, b=0, K=2, theta0=30, alpha=0.001 
%  Tanggal: 2026-04-28 
% ===================================================== 

clc; clear; close all;

% Parameter personalisasi
N = 10;  
a = 1;  
b = 0;  
K = 2;

theta0 = 30;   % tidak digunakan di soal ini
alpha_lr = 0.001;

iter = 500;
x0 = 1;

% Fungsi profit & turunan
pi_f = @(x) -(a+1).*x.^3 + (b+5)*K.*x.^2 + 100.*x - (K^2 * 10);
dpi = @(x) -3*(a+1).*x.^2 + 2*(b+5)*K.*x + 100;
ddpi = @(x) -6*(a+1).*x + 2*(b+5)*K;

% =========================
% SOLUSI ANALITIK
% =========================
coef = [-3*(a+1), 2*(b+5)*K, 100];
akar = roots(coef);

% pilih maksimum lokal (turunan kedua < 0)
if ddpi(akar(1)) < 0
    x_max = akar(1);
else
    x_max = akar(2);
end

% =========================
% GRADIENT DESCENT (α normal)
% =========================
x = zeros(iter+1,1);
x(1) = x0;

for k = 1:iter
    x(k+1) = x(k) + alpha_lr * dpi(x(k));
end

% =========================
% SENSITIVITAS α
% =========================
alpha_big = 10 * alpha_lr;
alpha_small = 0.1 * alpha_lr;

x_big = zeros(iter+1,1);
x_small = zeros(iter+1,1);

x_big(1) = x0;
x_small(1) = x0;

for k = 1:iter
    x_big(k+1) = x_big(k) + alpha_big * dpi(x_big(k));
    x_small(k+1) = x_small(k) + alpha_small * dpi(x_small(k));
end

%% =========================
%% PLOT KONVERGENSI
%% =========================
figure;
plot(0:iter, pi_f(x), 'LineWidth', 2); hold on;
plot(0:iter, pi_f(x_big), '--', 'LineWidth', 2);
plot(0:iter, pi_f(x_small), ':', 'LineWidth', 2);

xlabel('Iterasi (k)');
ylabel('\pi(x_k)');
title('Perbandingan Konvergensi Gradient Descent');
legend('\alpha normal','\alpha besar','\alpha kecil');
grid on;

% =========================
% PLOT FUNGSI + TITIK
% =========================
x_plot = linspace(-5,10,500);

figure;
plot(x_plot, pi_f(x_plot), 'LineWidth', 2); hold on;

% titik awal
plot(x(1), pi_f(x(1)), 'o', 'LineWidth', 2);

% hasil GD
plot(x(end), pi_f(x(end)), 'o', 'LineWidth', 2);

% solusi analitik
plot(x_max, pi_f(x_max), 's', 'LineWidth', 2);

xlabel('x');
ylabel('\pi(x)');
title('Kurva Profit dan Titik Penting');
legend('\pi(x)','x_0','Hasil GD','Solusi Analitik');
grid on;

% =========================
% OUTPUT
% =========================
fprintf('Titik awal x0 = %.6f\n', x(1));
fprintf('Hasil GD x* = %.6f\n', x(end));
fprintf('Solusi analitik = %.6f\n', x_max);
fprintf('Profit GD = %.6f\n', pi_f(x(end)));
fprintf('Profit analitik = %.6f\n', pi_f(x_max));