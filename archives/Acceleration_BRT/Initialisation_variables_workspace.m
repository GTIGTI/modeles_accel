%clear all
%close all

%% hypoth�ses :
    %le pneu est ind�formable et le coefficient d'adh�rence d�pend de la
    %   charge, 
    %Aucun glissement des pneus
    %Absence de suspensions
    %Perte dans la transmission de 5%
    %L'appui a�rodynamique est consid�r�, consid�re que la train�e
    %Passage des rapports optimis� 
    %Temps de passage des rapports constant
    %Aucun regime transitoire consid�r� (transfert de charges)
    
    % On se place � Slip Ratio (taux de glissement) constant
    % 11% pour 13 pouces
    % 12.5% pour 10 pouces
    
    %Equation m�canique obtenu avec un TEC sur le v�hicule entier
    

%% V�hicule :
%% Param�tres g�om�triques en m :

h_v = 0.3; %hauteur du centre de gravit� du v�hicule
h_p = 0.3; %hauteur du centre de gravit� du pilote
e = 1.6; %empattement
rep_masse = 0.5; % rep_masse est le pourcentage de masse � l'arri�re
b = e*(1-rep_masse); %distance selon x entre le centre de gravit� et le centre des roues arriere
v = 1.2; %voie
D_roue = 0.53; % Diametre exterieur de la roue (m)
R = D_roue/2; %Rayon de la roue

%% Param�tres inertiels :
%mveh = 220; %masse de la voiture
mpilote = 60; %Masse du pilote
maileron = 0; %masse de des dispositif aérodynamique, =0 si pas d'aileron et alors l'appui = 0
mtot =mpilote + maileron; %masse de l'ensemble
m = mtot;
g = 9.81;
h = (mpilote*h_p)/m; %hauteur du centre de gravit�

J_rot = 0.111; % Inertie d'une roue équipée (kg.m�) (estimé avec Catia)
J_trans = m*R^2; % Inertie equivalente des masses en translation (kg.m�)
J_eq = J_trans + 4*J_rot; % Inertie totale (kg.m�)

coeff_roul = 0.01; % Coefficient de resistance au roulement du pneu (delta en m)

%% Moteur :
%Courbe moteur
C_mot = [0,45.126,51.01200000000001,52.974000000000004,51.01200000000001,48.069,49.050000000000004,51.01200000000001,56.898,58.86,58.86,57.879000000000005,56.898,54.936,51.993,48.069,44.145,40.221,36.297000000000004,32.373];

%R�gime correspondant
regime = [0, 4500:500:13500];

reg_patinage = 8000; %r�gime de patinage de l'embrayage (rpm)
reg_rupteur = 14000; %regime du rupteur (rpm)


%% Boite de vitesse :
rap_pri = 36/76;
rap(1) = 12/33;
rap(2) = 16/32;
rap(3) = 18/30;
rap(4) = 18/26;
rap(5) = 23/30;
rap(6) = 24/29;
rap_couronne = 13/45;

%Donnees pour le passage des vitesses
%les vitesses sont en km/h
v1 = 62.7;
v2 = 80.5;
v3 = 95;
v4 = 107.9;
v5 = 118.3;

v_passage = [0, v1, v2, v3, v4, v5]/3.6; %vitesse en m/s
rapport = [1, 2, 3, 4, 5, 6];
rapport_max = 3; %rapport maximale autorisé

t_passage = 0.1; %temps de passage des vitesses en seconde

%% Pneumatiques
pneu = 'Pneu13poucesHoosier_SL_0.11__HB136_P10_IA0_SA0_R5.mat';
load(pneu);
ChargePneu = FzMu(1,:);
MuLong = FzMu(2,:);

charge_max = 1500; % 1500 pour pneu 13 pouces, 1100 pour pneu 10 pouces
charge_min = 450;  % 450 pour pneu 13 pouces et 10 pouces

%% A�rodynamique
%train�e
rho = 1.2; %masse volumique de l'air en kg/m3
Cx = 0.7; %coeff de train�e
S = 0.9; %surface de r�f�rence (m2)

%appui
Cl = 0;%
Sproj = 1.8 ;%0.3 est la corde de l'aileron
%pour rappel : penser � la masse de l'aileron

%% Param�tre initiaux de la simulation
vitesse_initiale = 0;
position_initale = 0;


%% Lancement de la simulation :
%sim('Accel_model');

%% Trac� des graphiques
%run('DessinCourbe.m');

%% R�sultats de la simulation :
%disp('Temps (s) :')
%disp(max(Distance.time))