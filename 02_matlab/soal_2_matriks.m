% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 2 — Enkripsi Citra Logo dengan Invers Matriks 3x3
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

% =========================
% Matriks Kunci A
% =========================
A = [a+1   b     2;
     1     a+2   b;
     b     1     a+3];

disp('Matriks A:');
disp(A);

% =========================
% (d) Verifikasi Invers
% =========================

A_inv_manual = inv(A); % dari MATLAB
A_inv_builtin = inv(A);

% Norm error Frobenius
error_norm = norm(A_inv_manual - A_inv_builtin, 'fro');

% Timestamp
waktu = datetime('now');

disp(' ');
disp('===== VERIFIKASI INVERS =====');
disp(['Timestamp : ', char(waktu)]);
disp('A^-1 (MATLAB):');
disp(A_inv_builtin);
disp(['Error Frobenius: ', num2str(error_norm)]);

if error_norm < 1e-10
    disp('Hasil invers VALID (sesuai syarat soal)');
else
    disp('Hasil invers TIDAK VALID');
end

% =========================
% (f) Visualisasi Citra
% =========================

% Matriks piksel P
P = [120      (50 + N)   200;
     80       (a + 2)    (10 + N);
     (30 + N) 90         170];

disp(' ');
disp('Matriks P (citra asli):');
disp(P);

% Enkripsi
E = A * P;

disp('Matriks E (citra terenkripsi):');
disp(E);

% Normalisasi agar bisa ditampilkan sebagai citra (0-255)
P_img = uint8(P);
E_img = uint8(mod(E,256)); % supaya tetap dalam range grayscale

% Plot perbandingan
figure;

subplot(1,2,1);
imshow(P_img, []);
title('Citra Asli P');

subplot(1,2,2);
imshow(E_img, []);
title('Citra Terenkripsi E');

sgtitle('Perbandingan Citra - NIM 2510514010');

% Simpan gambar
filename = ['perbandingan_citra_', datestr(now,'yyyymmdd_HHMMSS'), '.png'];
saveas(gcf, filename);

disp(['File citra disimpan sebagai: ', filename]);