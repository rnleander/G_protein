% The r.h.s of the differential equation for sensitivity analysis
function dydt=gingi(t,y,LHSmatrix,x)
%% PARAMETERS %%



gparameters;

c5a=LHSmatrix(x,1);
pge=LHSmatrix(x,2);
bg=LHSmatrix(x,3);
C1=LHSmatrix(x,4);
k1=LHSmatrix(x,5);
k2=LHSmatrix(x,6);
k3=LHSmatrix(x,7);
k4=LHSmatrix(x,8);
k5=LHSmatrix(x,9);
k6=LHSmatrix(x,10);
k7=LHSmatrix(x,11);
k8=LHSmatrix(x,12);
K1=LHSmatrix(x,13);
K4=LHSmatrix(x,14);
K5=LHSmatrix(x,15);
K6=LHSmatrix(x,16);



EP=pge*ep/(pge+K3);
AC=ac*y(1)/(y(1)+K4);
C5aRbg=y(5)*c5ar/(y(5)+K1);
C5aRs=C5aRbg*(c5a/(c5a+K2));

%y(1)=as*, y(2)=asBg, y(3)=as, y(4)=ai*, y(5)=aiBg, y(6)=ai, y(7)=bg,
%y(8)=cAMP

dydt = [k1*EP*(y(2)/(y(2)+K5))-k2*y(1);
        -k1*EP*(y(2)/(y(2)+K5))+k3*y(7)*y(3)-k4*y(2);
        k2*y(1)-k3*y(7)*y(3)+k4*y(2);
        k5*C5aRs-k6*y(4);
        -k5*C5aRs+k7*y(7)*y(6)-k8*y(5);
        -k7*y(7)*y(6)+k6*y(4)+k8*y(5);
        -y(7)*(k7*y(6)+k3*y(3))+k1*EP*(y(2)/(y(2)+K5))+k5*C5aRs+k8*y(5)+k4*y(2);
        k9*(AC/(y(7)+K6))*(K6+C1*y(7))+k10*(ac-AC)-k11*PDE*(y(8)/(y(8)+K7))-k12*PDE3*(y(8)/(y(8)+K8))
        ];

