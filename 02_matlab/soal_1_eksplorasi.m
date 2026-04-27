% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 1 — Eksplorasi Awal dan Profil Data Transaksi
%  ---------------------------------------------------
%  Nama  : Jellli Wanti Eriska Pardosi
%  NIM   : 2510514010
%  Parameter: N=10, a=1, b=0, K=2, theta0=30, alpha=0.01
%  Tanggal: 2026-04-27
% =====================================================

clc; clear; close all;

% Parameter
N = 10;
a = 1;
b = 0;
K = 2;

% =========================
% Membentuk data D1 s.d D7
% =========================
D = zeros(1,7);

for i = 1:7
    D(i) = 20 + (K*i) + mod(a*i,7) - mod(b*i,5);
end

disp('Data penjualan (juta rupiah):');
disp(D);

% =========================
% (b) Verifikasi Statistik
% =========================
mean_D   = mean(D);
median_D = median(D);
mode_D   = mode(D);
range_D  = range(D);
std_D    = std(D,1); % populasi

% Timestamp
waktu = datetime('now');

disp(' ');
disp('===== HASIL PERHITUNGAN MATLAB =====');
disp(['Timestamp : ', char(waktu)]);
disp(['Mean      : ', num2str(mean_D)]);
disp(['Median    : ', num2str(median_D)]);
disp(['Modus     : ', num2str(mode_D)]);
disp(['Range     : ', num2str(range_D)]);
disp(['Std Dev   : ', num2str(std_D)]);

% =========================
% (c) Diagram Batang
% =========================
figure;
bar(D);
hold on;

% Garis rata-rata
yline(mean_D, 'r', 'LineWidth', 2);

% Label dan judul
xlabel('Toko ke-i');
ylabel('Penjualan (juta rupiah)');
title('Diagram Penjualan Toko - NIM 2510514010');

grid on;

% Simpan sebagai PNG
filename = ['diagram_penjualan_', datestr(now,'yyyymmdd_HHMMSS'), '.png'];
saveas(gcf, filename);

disp(['File gambar disimpan sebagai: ', filename]);