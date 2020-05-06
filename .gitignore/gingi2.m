% The r.h.s of the differential equation, for generating surface plots and 
% dose-response curves
function dydt=gingi2(t,y, c5a, pge)
%% PARAMETERS %%

gparameters;
%reset the value of C1
C1=11;
%C1=1;

EP=pge*ep/(pge+K3);
AC=ac*y(1)/(y(1)+K4);
C5aRbg=y(5)*c5ar/(y(5)+K1);
C5aRs=C5aRbg*(c5a/(c5a+K2));

dydt = [k1*EP*(y(2)/(y(2)+K5))-k2*y(1);
        -k1*EP*(y(2)/(y(2)+K5))+k3*y(7)*y(3)-k4*y(2);
        k2*y(1)-k3*y(7)*y(3)+k4*y(2);
        k5*C5aRs-k6*y(4);
        -k5*C5aRs+k7*y(7)*y(6)-k8*y(5);
        -k7*y(7)*y(6)+k6*y(4)+k8*y(5);
        -y(7)*(k7*y(6)+k3*y(3))+k1*EP*(y(2)/(y(2)+K5))+k5*C5aRs+k8*y(5)+k4*y(2);
        k9*(AC/(y(7)+K6))*(K6+C1*y(7))+k10*(ac-AC)-k11*PDE*(y(8)/(y(8)+K7))-k12*PDE3*(y(8)/(y(8)+K8))
        ];
