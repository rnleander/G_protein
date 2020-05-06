% PARAMETER BASELINE VALUES
%volume of membrane proximal region/volume cell
a1=.01;

k1=5;
k2=.07;
k3=.7;
k4=.0189;
k5=k1;
k6=.03;
k7=.7;
k8=.00014;
k9=10.5;
k10=.35;
k11=.72;
k12=6.85;


ac=.001;
%The value above is the value we used for modeling immune cells. It is 
%lower than that estimated in myocytes, which is given below.
%ac=.029;
c5ar=.4;
ep=.004;
ai=8;
BG=1.8;
as=2.3;
camp=.1;
atp=3000;
PDE=.115;
PDE3=.0025;

K1=.8;
K2=10^(-3);
K3=.019;
K4=.0036;
K5=.8;
K6=.09;
K7=2.6;
K8=.15;

%beta-gamma binding increases rate of cAMP production by a factor C1.
C1=11;


% Parameter Labels 
par_labels={'c5a', 'pge', 'bg', 'C1', 'k1', 'k2', 'k3', 'k4', 'k5', 'k6', 'k7', 'k8', 'K1', 'K4', 'K5', 'K6'};% 

%% TIME SPAN OF THE SIMULATION
t_end=1200; % length of the simulations. 1200=20 minutes
tspan=(0:1:t_end);   % time points where the output is calculated
time_points=[30 120 1200]; % time points of interest for the US analysis



% Variables Labels
y_var_label={'ass','asbg', 'as', 'ais', 'aibg', 'ai', 'bg', 'camp'};