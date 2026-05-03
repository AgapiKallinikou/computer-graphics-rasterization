function kappel_ellipse(a, b)
    % Αρχικοποίηση μεταβλητών
    x = a;
    y = 0;
    asqr = a^2;
    bsqr = b^2;
    a22 = asqr + asqr; % Υπολογισμός του 2a^2
    b22 = bsqr + bsqr; % Υπολογισμός του 2b^2
    
    xslope = b22 * a;
    yslope = 0;
    fmid = bsqr * (0.25 - x) + asqr;
    
    % -- Περιοχή 1 --
    while xslope > yslope
        plot_pixel(x, y); % Συνάρτηση σχεδίασης (π.χ. draw_pixel)
        y = y + 1;
        yslope = yslope + a22;
        
        if fmid >= 0
            x = x - 1;
            xslope = xslope - b22;
            fmid = fmid - xslope;
        end
        fmid = fmid + yslope + asqr;
    end
    
    % -- Αναπροσαρμογή παραμέτρου απόφασης για τη μετάβαση --
    fmid = fmid - (yslope + xslope)/2 + 0.75 * (bsqr - asqr);
    
    % -- Περιοχή 2 --
    while x >= 0 % Αντίστοιχο του repeat...until x < 0
        plot_pixel(x, y);
        x = x - 1;
        xslope = xslope - b22;
        
        if fmid <= 0
            y = y + 1;
            yslope = yslope + a22;
            fmid = fmid + yslope;
        end
        fmid = fmid - xslope + bsqr;
    end
end

% Βοηθητική συνάρτηση για την 4-πλη συμμετρία (όπως αναφέρεται στη θεωρία)
function plot_pixel(x, y)
    % Εδώ καλείται η draw_pixel για τα 4 συμμετρικά σημεία
    draw_pixel(x, y, 'c');
    draw_pixel(-x, y, 'c');
    draw_pixel(x, -y, 'c');
    draw_pixel(-x, -y, 'c');
end
