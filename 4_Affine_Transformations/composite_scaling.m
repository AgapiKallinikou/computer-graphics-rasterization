% Ορισμός του αρχικού σχήματος (Πίνακας 3xN σε Ομογενείς Συντεταγμένες)
% [Σημείωση: Αντικατέστησε το P_original με τον δικό σου πίνακα σημείων]
% P_original = [...]; 

% Βασικοί Πίνακες Μετασχηματισμού
% 1. Μετατόπιση στην αρχή των αξόνων T(-22, -20)
T1 = [1, 0, -22; 
      0, 1, -20; 
      0, 0,  1];

% 2. Αλλαγή Κλίμακας (Scaling) S(2, 1)
S  = [2, 0,  0; 
      0, 1,  0; 
      0, 0,  1];

% 3. Επαναφορά στο αρχικό σημείο P(22, 20)
T2 = [1, 0, 22; 
      0, 1, 20; 
      0, 0,  1];

% Υπολογισμός τελικού πίνακα M μέσω πολλαπλασιασμού (Δεξιά -> Αριστερά)
M = T2 * S * T1;

disp('Τελικός Πίνακας Μετασχηματισμού M:');
disp(M);

% Εφαρμογή μετασχηματισμού σε όλα τα σημεία ταυτόχρονα (Vectorized)
P_transformed = M * P_original;

% --- Σχεδίαση ---
figure;
hold on;
grid on;
axis equal;

% Σχεδίαση Αρχικού (Μπλε)
plot(P_original(1,:), P_original(2,:), 'b-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');

% Σχεδίαση Μετασχηματισμένου (Κόκκινο)
plot(P_transformed(1,:), P_transformed(2,:), 'r-*', 'LineWidth', 1.5);

title('Composite Transformation: Scaling relative to arbitrary Pivot Point P(22, 20)');
xlabel('X axis');
ylabel('Y axis');
legend('Original Shape', 'Transformed Shape (Scaled)', 'Location', 'Best');

hold off;
