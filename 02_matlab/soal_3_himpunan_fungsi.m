% =====================================================
%  UTS Matematika Sains Data — Semester Genap 2025/2026
%  Soal 3 — Segmentasi Pelanggan & Komposisi Fungsi
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
% (b) Verifikasi Himpunan
% =========================

A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];

U = N:(N+20);

% Operasi himpunan
A_union_B_C = union(union(A,B),C);
A_intersect_B_C = intersect(intersect(A,B),C);
A_union_B = union(A,B);
C_komplemen = setdiff(U, C);
hasil_3 = intersect(A_union_B, C_komplemen);
A_xor_B = setxor(A,B);

% Timestamp
waktu = datetime('now');

disp('===== VERIFIKASI HIMPUNAN =====');
disp(['Timestamp: ', char(waktu)]);

disp('|A ∪ B ∪ C| = ');
disp(length(A_union_B_C));

disp('|A ∩ B ∩ C| = ');
disp(length(A_intersect_B_C));

disp('|(A ∪ B) ∩ C''| = ');
disp(length(hasil_3));

disp('|A XOR B| = ');
disp(length(A_xor_B));

% =========================
% (d) Verifikasi Invers Fungsi
% =========================

syms x

% Fungsi f
f = K*x + (a + b);

% Invers f secara simbolik
f_inv = solve(f == x, x);

disp(' ');
disp('===== INVERS FUNGSI =====');
disp('f(x) = ');
disp(f);

disp('f^-1(x) = ');
disp(f_inv);

% Kasus pendapatan
pendapatan = K*100 + a + b;

% Cari x
x_solusi = solve(K*x + (a + b) == pendapatan, x);

disp(['Pendapatan = ', num2str(pendapatan)]);
disp('Nilai x yang memenuhi:');
disp(x_solusi);