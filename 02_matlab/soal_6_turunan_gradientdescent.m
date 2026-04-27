% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 6 — Optimasi Harga dengan Gradient Descent
%  ---------------------------------------------------
%  Nama  : Jellli Wanti Eriska Pardosi
%  NIM   : 2510514010
%  Parameter: N=10, a=1, b=0, K=2, theta0=30, alpha=0.01
%  Tanggal: 2026-04-27
% =====================================================

clc; clear; close all;

% Parameter
a = 1;
b = 0;
K = 2;
alpha = 0.01;

% Fungsi profit
pi = @(x) -(a+1).*x.^3 + (b+5)*K.*x.^2 + 100.*x - (K^2 * 10);

% Turunan pertama
dpi = @(x) -3*(a+1).*x.^2 + 2*(b+5)*K.*x + 100;

% =========================
% (e) Gradient Descent 500 iterasi
% =========================

iter = 500;
x = zeros(1,iter);
pi_val = zeros(1,iter);

x(1) = 1; % titik awal

for k = 1:iter-1
    x(k+1) = x(k) + alpha * dpi(x(k));
    pi_val(k) = pi(x(k));
end

pi_val(iter) = pi(x(iter));

% Solusi analitik (dari kuadrat)
syms xs
sol = solve(-3*(a+1)*xs^2 + 2*(b+5)*K*xs + 100 == 0, xs);
sol = double(sol);

% =========================
% Plot konvergensi
% =========================
figure;
plot(1:iter, pi_val, 'LineWidth', 2);
xlabel('Iterasi (k)');
ylabel('Profit \pi(x_k)');
title('Konvergensi Gradient Descent - NIM 2510514010');
grid on;

% Tandai titik awal & akhir
hold on;
plot(1, pi_val(1), 'ro', 'MarkerSize', 8);
plot(iter, pi_val(end), 'go', 'MarkerSize', 8);

% Timestamp
waktu = datetime('now');

disp('===== HASIL GRADIENT DESCENT =====');
disp(['Timestamp: ', char(waktu)]);
disp(['x awal = ', num2str(x(1))]);
disp(['x akhir = ', num2str(x(end))]);
disp('Solusi analitik:');
disp(sol);

% =========================
% (f) Sensitivitas alpha
% =========================

alpha_big = 10 * alpha;
alpha_small = 0.1 * alpha;

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

% Plot perbandingan
figure;
plot(pi_val, 'LineWidth', 2); hold on;
plot(pi_big, '--', 'LineWidth', 2);
plot(pi_small, ':', 'LineWidth', 2);

legend('\alpha normal', '\alpha besar', '\alpha kecil');
title('Perbandingan Konvergensi Gradient Descent - NIM 2510514010');
xlabel('Iterasi');
ylabel('Profit');

grid on;

% Simpan gambar
filename = ['gradient_descent_', datestr(now,'yyyymmdd_HHMMSS'), '.png'];
saveas(gcf, filename);

disp(['File plot disimpan sebagai: ', filename]);