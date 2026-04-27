% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 7 — Forecasting Penjualan
%  ---------------------------------------------------
%  Nama  : Jellli Wanti Eriska Pardosi
%  NIM   : 2510514010
%  Parameter: N=10, a=1, b=0, K=2, theta0=30, alpha=0.01
%  Tanggal: 2026-04-27
% =====================================================

clc; clear; close all;

% Parameter
K = 2;
a = 1;

% =========================
% Data Sn (12 bulan)
% =========================
n = 1:12;
S = 50 + (K*n) + ((-1).^n) * (a+1);

disp('Data S_n:');
disp(S);

% =========================
% (7.2 c) Verifikasi Sigma
% =========================
T1 = sum(S);
T2 = sum(S.^2);

% Timestamp
waktu = datetime('now');

disp(' ');
disp('===== VERIFIKASI SIGMA =====');
disp(['Timestamp: ', char(waktu)]);
disp(['T1 (total) = ', num2str(T1)]);
disp(['T2 (sum of squares) = ', num2str(T2)]);

% =========================
% (7.4 e) Trend & Forecast
% =========================

t = 1:12;

% Linear fit
p = polyfit(t, S, 1);
trend = polyval(p, t);

% Prediksi 6 bulan ke depan
t_future = 13:18;
S_pred = polyval(p, t_future);

% Plot
figure;
plot(t, S, 'bo', 'LineWidth', 2); hold on;
plot(t, trend, 'r-', 'LineWidth', 2);
plot(t_future, S_pred, 'g--', 'LineWidth', 2);

xlabel('Bulan');
ylabel('Penjualan');
title('Forecast Penjualan - NIM 2510514010');

legend('Data historis', 'Trend linear', 'Forecast 6 bulan');
grid on;

% =========================
% (7.4 f) MAE & Residual
% =========================

MAE = mean(abs(S - trend));

disp(' ');
disp('===== ERROR ANALISIS =====');
disp(['MAE = ', num2str(MAE)]);

residual = S - trend;
disp('Residual:');
disp(residual);

% Simpan gambar
filename = ['forecast_', datestr(now,'yyyymmdd_HHMMSS'), '.png'];
saveas(gcf, filename);

disp(['File plot disimpan sebagai: ', filename]);