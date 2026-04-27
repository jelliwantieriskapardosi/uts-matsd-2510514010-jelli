% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 6 — Optimasi Harga 
%  ---------------------------------------------------
%  Nama  : Jellli Wanti Eriska Pardosi
%  NIM   : 2510514010
% =====================================================

clc; clear; close all;

% Parameter
a = 1;
b = 0;
K = 2;

alpha = 0.02; % sengaja sedikit diperbesar biar efek terlihat

% Fungsi profit
pi = @(x) -(a+1).*x.^3 + (b+5)*K.*x.^2 + 100.*x - (K^2 * 10);

% Turunan pertama
dpi = @(x) -3*(a+1).*x.^2 + 2*(b+5)*K.*x + 100;

% =========================
% Gradient Descent (utama)
% =========================

iter = 500;

x = zeros(1,iter);
pi_val = zeros(1,iter);

x(1) = 1;

for k = 1:iter-1
    x(k+1) = x(k) + alpha * dpi(x(k));
    pi_val(k) = pi(x(k));
end
pi_val(iter) = pi(x(end));

% =========================
% Solusi analitik
% =========================

Aq = -3*(a+1);
Bq = 2*(b+5)*K;
Cq = 100;

akar = roots([Aq Bq Cq]);

ddpi = @(x) -6*(a+1).*x + 2*(b+5)*K;

if ddpi(akar(1)) < 0
    x_max = akar(1);
else
    x_max = akar(2);
end

% =========================
% Figure 1: Kurva π(x)
% =========================

xx = linspace(0, 10, 500);
yy = pi(xx);

figure;
plot(xx, yy, 'LineWidth', 2); hold on;
plot(x(end), pi(x(end)), 'ro', 'MarkerSize', 8, 'LineWidth', 2);
plot(x_max, pi(x_max), 'go', 'MarkerSize', 8, 'LineWidth', 2);

legend('π(x)', 'Hasil GD', 'Solusi Analitik');
title('Kurva Profit & Titik Optimum - NIM 2510514010');
xlabel('x');
ylabel('π(x)');
grid on;

% =========================
% Figure 2: Konvergensi utama
% =========================

figure;
plot(1:iter, pi_val, 'LineWidth', 2);
title('Konvergensi Gradient Descent');
xlabel('Iterasi');
ylabel('π(x_k)');
grid on;

% =========================
% (f) Sensitivitas alpha
% =========================

alpha_big = 0.2;    % sengaja besar (biar divergen)
alpha_small = 0.002; % sangat kecil (biar lambat)

x_big = zeros(1,iter); x_big(1)=1;
x_small = zeros(1,iter); x_small(1)=1;

pi_big = zeros(1,iter);
pi_small = zeros(1,iter);

for k = 1:iter-1
    x_big(k+1) = x_big(k) + alpha_big * dpi(x_big(k));
    x_small(k+1) = x_small(k) + alpha_small * dpi(x_small(k));

    pi_big(k) = pi(x_big(k));
    pi_small(k) = pi(x_small(k));
end

pi_big(iter) = pi(x_big(end));
pi_small(iter) = pi(x_small(end));

% =========================
% Figure 3: Perbandingan alpha
% =========================

figure;
plot(1:iter, pi_val, 'LineWidth', 2); hold on;
plot(1:iter, pi_big, '--', 'LineWidth', 2);
plot(1:iter, pi_small, ':', 'LineWidth', 2);

legend('\alpha normal', '\alpha besar', '\alpha kecil');
title('Sensitivitas Learning Rate - NIM 2510514010');
xlabel('Iterasi');
ylabel('π(x)');
grid on;

% =========================
% OUTPUT + TIMESTAMP
% =========================

waktu = datetime('now');

disp('===== HASIL SOAL 6 FINAL =====');
disp(['Timestamp: ', char(waktu)]);
disp(['x awal = ', num2str(x(1))]);
disp(['x akhir (GD) = ', num2str(x(end))]);
disp(['x maksimum analitik = ', num2str(x_max)]);
disp(['π(x akhir) = ', num2str(pi(x(end)))]);
disp(['π(x maksimum) = ', num2str(pi(x_max))]);
