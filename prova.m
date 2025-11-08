clc, clearvars, close all

R = [1/2        -sqrt(3)/2    0;
     sqrt(3)/2       1/2      0;
     0                0       1];
% Matrice di trasformazione ^0_1 T
T01 = [ 1  0  0   0;
        0  1  0   0;
        0  0  1 175;
        0  0  0   1 ];
[R1,p1] = extractRT(T01);

%%

% Matrice di trasformazione ^1_2 T
T12 = [-1  0  0   0;
        0  0  1   0;
        0  1  0  98;
        0  0  0   1 ];
T = T01*T12;
[R2,p2] = extractRT(T);

% Matrice di trasformazione ^2_3 T
T23 = [ 0  0  1 105;
        0  1  0   0;
       -1  0  0   0;
        0  0  0   1 ];
T = T01*T12*T23;
[R3,p3] = extractRT(T);
%% Trasformazione da frame <3> a frame <4>
T34 = [ 0     0   -1     0;
        0    -1    0   145.50;
       -1     0    0   326.50;
        0     0    0     1];

%% Trasformazione da frame <4> a frame <5>
T45 = [ 0     0    1     35;
       -1     0    0      0;
        0    -1    0      0;
        0     0    0      1];

%% Trasformazione da frame <5> a frame <6>
T56 = [ 0     1    0      0;
        0     0    1      0;
        1     0    0    385;
        0     0    0      1];

%% Trasformazione da frame <6> a frame <7>
T67 = [ 0     0    1    153;
        1     0    0      0;
        0     1    0      0;
        0     0    0      1];


a = 30;

% figure
% axes( 'DataAspectRatio', [1 1 1], 'View', [37.5 30] )
% plotframe( 'LabelBasis', true, ...
% 'Labels', {'X_{world}','Y_{world}','Z_{world}'}, ...
% 'TextProperties', {'FontAngle','italic'} )
% xlabel( 'X' ), ylabel( 'Y' ), zlabel( 'Z' )
% plotframe( R1,p1/a, 'LabelBasis', true, ...
% 'Labels', {'X_1','Y_1','Z_1'}, ...
% 'TextProperties', {'FontAngle','italic'} )
% 
% plotframe( R2,p2/a, 'LabelBasis', true, ...
% 'Labels', {'X_2','Y_2','Z_2'}, ...
% 'TextProperties', {'FontAngle','italic'} )
% 
% plotframe( R3,p3/a, 'LabelBasis', true, ...
% 'Labels', {'X_3','Y_3','Z_3'}, ...
% 'TextProperties', {'FontAngle','italic'} )

T1 = T01;          % frame 1 rispetto al mondo
T2 = T1 * T12;     % frame 2 rispetto al mondo
T3 = T2 * T23;     % frame 3 rispetto al mondo
T4 = T3 * T34;     % frame 4 rispetto al mondo
T5 = T4 * T45;     % frame 5 rispetto al mondo
T6 = T5 * T56;     % frame 6 rispetto al mondo
T7 = T6 * T67;     % frame 7 rispetto al mondo
axis padded
Tlist = {T1,T2,T3,T4,T5,T6,T7};
labels = { 'X_1','X_2','X_3','X_4','X_5','X_6','X_7';
           'Y_1','Y_2','Y_3','Y_4','Y_5','Y_6','Y_7';
           'Z_1','Z_2','Z_3','Z_4','Z_5','Z_6','Z_7'};
figure
axes('DataAspectRatio', [1 1 1], 'View', [37.5 30])
hold on, grid on

% Frame mondo
plotframe('LabelBasis', true, ...
          'Labels', {'X_{world}','Y_{world}','Z_{world}'}, ...
          'TextProperties', {'FontAngle','italic'})

for k = 1:7
    [R, p] = extractRT(Tlist{k});
    plotframe(R, p/a, 'MatrixIndexing','columnmajor', 'LabelBasis', true, ...
              'Labels', labels(:,k)', ...
              'TextProperties', {'FontAngle','italic'})
end
% xlim([-15,7]);
% ylim([-10,20]);
% zlim([0,20]);
view(0, 0);z


figure
axes('DataAspectRatio', [1 1 1], 'View', [37.5 30])
hold on, grid on

% Frame mondo
plotframe('LabelBasis', true, ...
          'Labels', {'X_{world}','Y_{world}','Z_{world}'}, ...
          'TextProperties', {'FontAngle','italic'})

for k = 1:7
    [R, p] = extractRT(Tlist{k});
    plotframe(R, p/a, 'MatrixIndexing','columnmajor', 'LabelBasis', true, ...
              'Labels', labels(:,k)', ...
              'TextProperties', {'FontAngle','italic'})
end
% xlim([-15,7]);
% ylim([-10,20]);
% zlim([0,20]);



