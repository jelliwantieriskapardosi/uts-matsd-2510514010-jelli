% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 5 — Limit & Kontinuitas
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

syms x

% =========================
% (5.1 b) VERIFIKASI LIMIT
% =========================

L1 = limit((x^2 - K^2)/(x - K), x, K);

% L2 yang BENAR sesuai soal
L2 = limit((sqrt(x + (K+1)^2) - (K+1)) / x, x, 0);

L3 = limit(((a+2)*x^3 + b*x + 7)/(x^3 - x + K), x, inf);

% =========================
% (5.4 f) NILAI p dan q
% =========================

% Limit kiri:
% (x^2 - K^2)/(x-K) = x+K → di x=K → 2K
p = 2*K;

% Limit kanan:
% a*x + q → di x=K → aK + q = 2K
q = 2*K - a*K;

% =========================
% (5.4 g) PLOT PIECEWISE
% =========================

x1 = linspace(K-5, K-0.01, 100);
y1 = (x1.^2 - K^2)./(x1 - K);

x2 = K;
y2 = p;

x3 = linspace(K+0.01, K+5, 100);
y3 = a*x3 + q;

figure;
plot(x1, y1, 'LineWidth', 2); hold on;
plot(x2, y2, 'o', 'LineWidth', 2);
plot(x3, y3, 'LineWidth', 2);

xline(K, '--', 'LineWidth', 1.5);

title('Fungsi Piecewise Kontinu - NIM 2510514010');
xlabel('x');
ylabel('C(x)');
legend('x < K', 'x = K', 'x > K');

grid on;

% =========================
% OUTPUT + TIMESTAMP
% =========================

waktu = datetime('now');

disp('===== HASIL SOAL 5 =====');
disp(['Timestamp: ', char(waktu)]);

disp('Limit:');
disp(['L1 = ', char(L1)]);
disp(['L2 = ', char(L2)]);
disp(['L3 = ', char(L3)]);

disp('Nilai p dan q:');
disp(['p = ', num2str(p)]);
disp(['q = ', num2str(q)]);

% Simpan gambar
filename = ['soal5_piecewise_', datestr(now,'yyyymmdd_HHMMSS'), '.png'];
saveas(gcf, filename);

disp(['File plot disimpan sebagai: ', filename]);