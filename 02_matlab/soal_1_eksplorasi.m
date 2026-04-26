% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 1 — Eksplorasi Awal dan Profil Data Transaksi 
%  --------------------------------------------------- 
%  Nama     : Jelli Wanti Eriska Pardosi 
%  NIM      : 2510514010 
%  Parameter: N=10, a=1, b=0, K=2, theta0=30, alpha=0.001 
%  Tanggal  : 2026-04-26 
% ===================================================== 

clc; clear; close all; 

% Parameter personalisasi 
N = 10;  
a = 1;  
b = 0;  
K = 2; 
theta0 = 30;  % derajat 
alpha_lr = 0.001; 

% ======================
% Pembentukan Data D_i (dipakai untuk a, b, c)
% ======================
D = zeros(1,7);
for i = 1:7
    D(i) = 20 + (K*i) + mod(a*i,7) - mod(b*i,5);
end

disp('Data penjualan (D_i):')
disp(D)

% =====================================================
% (b) VERIFIKASI DENGAN MATLAB
% Menggunakan: mean, median, mode, range, std(D,1)
% =====================================================
mean_D = mean(D)
median_D = median(D)
mode_D = mode(D)
range_D = range(D)
std_D = std(D,1)

% =====================================================
% (c) DIAGRAM BATANG + GARIS RATA-RATA
% =====================================================
figure
bar(D)
hold on

% Garis rata-rata
yline(mean_D, 'r', 'LineWidth', 2)

% Label dan judul (Bahasa Indonesia + NIM)
xlabel('Toko ke-')
ylabel('Penjualan (juta rupiah)')
title('Diagram Batang Penjualan Toko - NIM 2510514010')

% Simpan sebagai PNG
saveas(gcf, 'diagram_penjualan_2510514010.png')