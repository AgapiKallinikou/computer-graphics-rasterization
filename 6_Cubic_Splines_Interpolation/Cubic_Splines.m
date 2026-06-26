% Καθαρισμός και Κλείσιμο όλων των παραθύρων
close all; clear; clc;

%% ================== 1. ΔΕΔΟΜΕΝΑ ==================
x1 = [1, 2, 5, 6, 7, 8, 10, 13, 17];
y1 = [3.0, 3.7, 3.9, 4.2, 5.7, 6.6, 7.1, 6.7, 4.5];

x2 = [17, 20, 23, 24, 25, 27, 27.7];
y2 = [4.5, 7.0, 6.1, 5.6, 5.8, 5.2, 4.1];

x3 = [27.7, 28, 29, 30];
y3 = [4.1, 4.3, 4.1, 3.0];

%% ================== 2. ΥΠΟΛΟΓΙΣΜΟΣ ==================
xx1 = linspace(x1(1), x1(end), 200); yy1 = spline(x1, y1, xx1);
xx2 = linspace(x2(1), x2(end), 200); yy2 = spline(x2, y2, xx2);
xx3 = linspace(x3(1), x3(end), 200); yy3 = spline(x3, y3, xx3);

%% ================== 3. ΣΧΕΔΙΑΣΗ ΓΡΑΦΗΜΑΤΟΣ ==================
figure('Name', 'Κυβικές Splines - Σκύλος', 'Color', 'w');
hold on; axis equal; grid on;

xticks(0:1:30); yticks(1:1:8);
set(gca, 'GridColor', [0.8 0.8 0.8], 'LineWidth', 1); axis([0 30 1 8]);

p1 = plot([xx1 xx2 xx3], [yy1 yy2 yy3], 'k-', 'LineWidth', 2.5);
p2 = plot([17, 27.7], [4.5, 4.1], 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8);

xlabel('x'); ylabel('f(x)');
title('Παρεμβολή με Κυβικές Splines (Πάνω μέρος σκύλου)');
legend([p1, p2(1)], 'Κυβική Spline', 'Σημεία Ένωσης', 'Location', 'northeastoutside');

%% ================== 4. ΚΑΘΟΡΙΣΜΟΣ (ΕΞΑΓΩΓΗ ΣΕ ΑΡΧΕΙΟ) ==================
% Γράφουμε όλες τις εξισώσεις σε ένα αρχείο για να μην κοπούν
fileID = fopen('Snoopy_Equations_Full.txt', 'w');
fprintf(fileID, 'ΜΑΘΗΜΑΤΙΚΟΣ ΚΑΘΟΡΙΣΜΟΣ ΤΩΝ SPLINES (ΟΛΕΣ ΟΙ ΠΕΡΙΟΧΕΣ)\r\n');
fprintf(fileID, '=======================================================\r\n\r\n');

% Περιοχή 1
[breaks1, coefs1, l1, ~, ~] = unmkpp(spline(x1, y1));
fprintf(fileID, '--- ΠΕΡΙΟΧΗ 1: Σώμα / Πλάτη ---\r\n');
for i = 1:l1
    fprintf(fileID, 'Για x στο διάστημα [%g, %g]:\r\n', breaks1(i), breaks1(i+1));
    fprintf(fileID, 'S(x) = (%+.4f)*(x - %g)^3 (%+.4f)*(x - %g)^2 (%+.4f)*(x - %g) (%+.4f)\r\n\r\n', coefs1(i,1), breaks1(i), coefs1(i,2), breaks1(i), coefs1(i,3), breaks1(i), coefs1(i,4));
end

% Περιοχή 2
[breaks2, coefs2, l2, ~, ~] = unmkpp(spline(x2, y2));
fprintf(fileID, '\r\n--- ΠΕΡΙΟΧΗ 2: Κεφάλι ---\r\n');
for i = 1:l2
    fprintf(fileID, 'Για x στο διάστημα [%g, %g]:\r\n', breaks2(i), breaks2(i+1));
    fprintf(fileID, 'S(x) = (%+.4f)*(x - %g)^3 (%+.4f)*(x - %g)^2 (%+.4f)*(x - %g) (%+.4f)\r\n\r\n', coefs2(i,1), breaks2(i), coefs2(i,2), breaks2(i), coefs2(i,3), breaks2(i), coefs2(i,4));
end

% Περιοχή 3
[breaks3, coefs3, l3, ~, ~] = unmkpp(spline(x3, y3));
fprintf(fileID, '\r\n--- ΠΕΡΙΟΧΗ 3: Μουσούδα ---\r\n');
for i = 1:l3
    fprintf(fileID, 'Για x στο διάστημα [%g, %g]:\r\n', breaks3(i), breaks3(i+1));
    fprintf(fileID, 'S(x) = (%+.4f)*(x - %g)^3 (%+.4f)*(x - %g)^2 (%+.4f)*(x - %g) (%+.4f)\r\n\r\n', coefs3(i,1), breaks3(i), coefs3(i,2), breaks3(i), coefs3(i,3), breaks3(i), coefs3(i,4));
end
fclose(fileID);

% Αυτόματο άνοιγμα του αρχείου (για να κάνεις κατευθείαν Αντιγραφή-Επικόλληση)
edit Snoopy_Equations_Full.txt
