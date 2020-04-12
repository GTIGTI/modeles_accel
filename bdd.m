%% MOTEUR
CBR.RPM_rupteur     =  14000; % regime du rupteur (rpm)
CBR.RPM_patinage    =  8000; % régime de patinage de l'embrayage (rpm)

% Caractéristique du moteur
CBR.couple          =  [0,45.126,51.01200000000001,52.974000000000004,51.01200000000001,48.069,49.050000000000004,51.01200000000001,56.898,58.86,58.86,57.879000000000005,56.898,54.936,51.993,48.069,44.145,40.221,36.297000000000004,32.373];
CBR.couple_RPM      =  [0, 4500:500:13500];

CBR.BV_rap_pri      = 36/76;
CBR.BV_rap_s        = [12/33 16/32 18/30 18/26 23/30 24/29];
CBR.BV_rapports     = CBR.BV_rap_pri .* CBR.BV_rap_s;


%% ROUE + PNEU 13 pouces hoosier
R13H.R              = 0.53/2; % Rayon ext. pneu
load('Pneu13poucesHoosier_SL_0.11__HB136_P10_IA0_SA0_R5.mat');
R13H.mupneu         = FzMu;
R13H.coeff_roul     = 0.01; % Coefficient de resistance au roulement du pneu (delta en m)
R13H.J_rot = 0.111; % Inertie d'une roue équipée (kg.m�) (estimé avec Catia)
