clc; clear; close all;

% ============================
% PARAMETERS (from exercise)
% ============================
H = 26;
R = 6.9565;
theta_param = 35.2174 * pi/180; % (optional interpretation of θ)

% ============================
% CONTROL POINTS
% ============================
P = [
6.96, 0;
6.50, 2;
5.80, 7;
4.20, 14;
1.50, 21;
0.00, 26
];

% ============================
% TIP FIX USING θ
% ============================

tip_angle = 35.2174 * pi/180;

P(end, :)   = [0, H];                 % κορυφή
P(end-1, :) = [R*tan(tip_angle/2), H*0.85];   % δεξιά πλευρά μύτης

% ============================
% BEZIER CURVE
% ============================
C = Bezier(P,50);

r = C(:,1);
h = C(:,2);

% ==================================================
% SCALE TO MATCH H AND R (IMPORTANT)
% ==================================================
h = h / max(h) * H;
r = r / max(r) * R;

% ============================
% PHASE 2 - 2D PROFILE
% ============================
figure;
plot(r,h,'b','LineWidth',2);
hold on;
plot(-r,h,'r','LineWidth',2);
plot(P(:,1)/max(P(:,1))*R, P(:,2)/max(P(:,2))*H, 'ko--','MarkerFaceColor','k');

grid on;
axis equal;

xlabel('x');
ylabel('y');
title('Phase 2: Bezier Profile');

legend('Bezier','Symmetry','Control Points','Location','northeast');

print('phase2.png','-dpng','-r300');

% ============================
% PHASE 3 - 3D SURFACE (SOLID ROCKET)
% ============================
theta = linspace(0,2*pi,60);

[Rm, TH] = meshgrid(r, theta);
[Hh, ~]  = meshgrid(h, theta);

X = Rm .* cos(TH);
Z = Rm .* sin(TH);
Y = Hh;

figure;
surf(X,Y,Z);
axis equal;
grid on;

xlabel('x');
ylabel('y (height)');
zlabel('z');

title('Phase 3: 3D Rocket Surface');

view(35,25);
camlight;
lighting gouraud;

print('phase3.png','-dpng','-r300');

% ============================
% PHASE 4 - DISCRETE ROTATION (POINT CLOUD)
% ============================

Xall = [];
Yall = [];
Zall = [];

pts0 = [r, h, zeros(size(r))]'; % base profile (IMPORTANT: scaled!)

for i = 1:36

    ang = i * pi / 18;

    Rmat = [
        cos(ang)  0  sin(ang);
        0         1  0;
       -sin(ang)  0  cos(ang)
    ];

    rot = Rmat * pts0;

    Xall = [Xall; rot(1,:)'];
    Yall = [Yall; rot(2,:)'];
    Zall = [Zall; rot(3,:)'];

end

figure;
scatter3(Xall, Yall, Zall, 6, 'filled');

axis equal;
grid on;

xlabel('x');
ylabel('y');
zlabel('z');

title('Phase 4: Discrete Rotation Surface');

view(35,25);
