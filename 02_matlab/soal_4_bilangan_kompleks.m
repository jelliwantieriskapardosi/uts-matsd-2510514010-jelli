% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 4 — Fasor Kompleks Penjualan
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
theta0 = 30; % derajat

% =========================
% Definisi fasor
% =========================
z1 = (a+2) + (b+1)*1i;
z2 = (b+1) - (a+2)*1i;

disp('z1 = '); disp(z1);
disp('z2 = '); disp(z2);

% =========================
% (b) Operasi kompleks
% =========================
tambah = z1 + z2;
kali   = z1 * z2;
bagi   = z1 / z2;
selisih_abs = abs(z1 - z2);

% Timestamp
waktu = datetime('now');

disp(' ');
disp('===== VERIFIKASI OPERASI KOMPLEKS =====');
disp(['Timestamp: ', char(waktu)]);
disp(['z1 + z2 = ', num2str(tambah)]);
disp(['z1 * z2 = ', num2str(kali)]);
disp(['z1 / z2 = ', num2str(bagi)]);
disp(['|z1 - z2| = ', num2str(selisih_abs)]);

% =========================
% (e) Akar kubik & plot
% =========================

theta0_rad = deg2rad(theta0);

r = 2; % akar kubik dari 8 = 2

akar = zeros(1,3);

for k = 0:2
    akar(k+1) = r * exp(1i*(theta0_rad + 2*pi*k)/3);
end

disp(' ');
disp('Akar kubik kompleks:');
disp(akar);

% Plot Argand
figure;
compass(akar);
title('Plot Akar Kubik Kompleks - NIM 2510514010');

% Simpan gambar
filename = ['akar_kubik_', datestr(now,'yyyymmdd_HHMMSS'), '.png'];
saveas(gcf, filename);

disp(['File plot disimpan sebagai: ', filename]);