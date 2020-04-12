g = 9.81;
addpath('donnees')  

%% VÉHICULE
VEH.m_v = 218; % Masse du vehicule (kg)
VEH.m_p = 55; % Masse du pilote (kg)
VEH.m = VEH.m_p + VEH.m_v; % Masse totale (kg)
VEH.h_v = 0.3; %hauteur du centre de gravité du véhicule
VEH.h_p = 0.3; %hauteur du centre de gravité du pilote
VEH.e = 1.6; %empattement
VEH.rep_masse = 0.5; % rep_masse est le pourcentage de masse � l'arri�re
VEH.b = VEH.e*(1-VEH.rep_masse); %distance selon x entre le centre de gravit� et le centre des roues arriere
VEH.h = (VEH.m_v*VEH.h_v+VEH.m_p*VEH.h_p)/VEH.m; % Hauteur du centre de gravite (m)


%% TRANSMISSION SECONDAIRE
TRANS.rend      = .95; % Rendement de la transmission sec
TRANS.rapport   = 13/45; % Rapport multiplicatif de la transmission secondaire


%% AÉRODYNAMISME
AERO.rho        = 1.2; % Masse volumique de l'air en kg/m3
AERO.Cx         = 0.7; % Coeff de trainée
AERO.S          = 0.9; % Surface de référence (m2)


%% AUTRE
v_passage = [0 62.7 80.5 95 107.9 118.3]/3.6; % vitesse en m/s
passage_rapport = [1 2 3 4 5 6];
rapport_max = 3; %rapport maximal autorisé
t_passage = 0.1; %temps de passage des vitesses en seconde




%% DONNEES BIZARRES BRICE
% VEH.h_v = 0.3; %hauteur du centre de gravit� du v�hicule
% VEH.h_p = 0.3; %hauteur du centre de gravit� du pilote
% VEH.e = 1.6; %empattement
% VEH.rep_masse = 0.5; % rep_masse est le pourcentage de masse � l'arri�re
% VEH.b = e*(1-rep_masse); %distance selon x entre le centre de gravit� et le centre des roues arriere
% VEH.v = 1.2; %voie
% 
% %mveh = 220; %masse de la voiture
% VEH.mpilote = 60; %Masse du pilote
% VEH.maileron = 0; %masse de des dispositif aérodynamique, =0 si pas d'aileron et alors l'appui = 0
% VEH.mtot =mpilote + maileron; %masse de l'ensemble
% VEH.m = mtot;
% g = 9.81;
% VEH.h = (mpilote*h_p)/m; %hauteur du centre de gravit�
% 
% VEH.J_rot = 0.111; % Inertie d'une roue équipée (kg.m�) (estimé avec Catia)
% VEH.J_trans = m*R^2; % Inertie equivalente des masses en translation (kg.m�)
% VEH.J_eq = J_trans + 4*J_rot; % Inertie totale (kg.m�)


%% EXEC FINALE
run('bdd.m');

MOT = CBR; % Moteur
ROUE = R13H; % Roue + pneu


VEH.J_trans = VEH.m*ROUE.R^2; % Inertie equivalente des masses en translation (kg.m�)
VEH.J_eq = VEH.J_trans + 4*ROUE.J_rot; % Inertie totale (kg.m�)

