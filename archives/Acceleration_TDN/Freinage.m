%%% Freinage

% Le script suivant permet de simuler un freinge � partir d'une vitesse
% donn�es en entr�e et en sortie. Le mod�le est purement "�nerg�tique" i.e
% on applique le principe de conservation de l'�nergie. 

% La courbe de couple moteur doit etre la plus complete possible pour de
% meilleurs resultats

% Ce script est utile pour voir d�terminer les distance de freinage en
% fonction de vitesse objectives en entr�e et en sortie. 

%% Hypotheses

    % Le pneu est indeformable
    % Le coeff de r�sistance au roulement est constant
    % La voiture n'a pas de suspensions
    % Le transfert de charge est instantane
    % Les pertes dans la transmission sont proportionnelles au couple
    % Le temps de passage de rapport ne depend pas des rapports concernes
    % Les rapport passent sans debrayer
    % L'aerodynamique (appui et trainee) est neglige

%%
% clear all
% close all

%% Parametres

%G�n�ral
g = 9.81 ; %Acceleration (m/s2)
mu = 1 ; %Friction coefficient assume to be constant first

% v�hicle + driver
mv = 218 ; %Mass (kg)
w = 1.525 ; %wheelbase (m)
t = 1.220 ; %Track (m)
mp = 55 ; %Mass driver (kg)
mt = mv + mp ;%Mass total (kg)

%% Inputs 

v_i = input(" Vitesse d'entr�e :");
v_o = input(" Vitesse de sortie :");
v_i = v_i*0.277778 ; %Convrsion de la vitesse d'entr�e en m/s
v_o = v_o*0.277778 ; %Convrsion de la vitesse de sortie en m/s



%% Calculs
Ec = 1/2*mt*abs(v_i-v_o) ; %Kinetic Energy (J)
Ff = mu*mt*g ; %Friction force (N)
Df = Ec/Ff; % Brake distance (m)

res = Df ; %Results

rep = input(' Affichage du resultat ? o/n [o] ','s');
if isempty(rep), rep = 'o'; end
if rep == 'o' |  rep == 'y'
  disp(['Le resultat vaut ', num2str(res)])
end


%%
distance = 75 ; %Distance (m)
    abs = [] ;
    ord = [] ;
    for i = 1:100 
        abs = [abs distance/100*i];
        ord = [ord 0];
    end

    plot(abs,ord)
    
%% Function : Circuit tracer

function [abs,ord] = Virage(rc,angle,abs_i,ord_i)
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here
    abs = rc;
    ord = angle;
end


function [abs,ord] = Accel(distance)
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes heres
    abs = [] ;
    ord = [] ;
    for i = 1:100 
        abs = [abs distance/100*i];
        ord = [ord 0];
    end
end
