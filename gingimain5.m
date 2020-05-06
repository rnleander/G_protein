% This file creates surface plots to relate 
% the concentration of PGE2 and 
% the concentration of C5a to the activation of alpha_s subunits and
% the production of cAMP.  
% The total concentration of beta-gamma is held constant.
clear all;
close all;

runs=1;

gparameters;
% Set the concentration of beta-gamma subunits.
bg=1.8;
%bg=10.3;

% Set C1, the factor by which beta-gamma binding increases the rate of cAMP
% production for the purpose of labeling plots within gingiLHS2 for simulations.




    f=@gingi2;
    y0=[0, 0, as, 0, 0, ai, bg, 0];
    [s,y]=ode15s(@(s,y)f(s,y,0,0),[0,100000],y0);
    y0=y(length(s),:);

pge=(0:.0005:.010);    
c5a=(0:.00001:.0001);
%May 4, 2020: Try a wider range of c5a values
%c5a=(0:.00005:.001);

 for j=1:length(c5a)
     for k=1:length(pge)

    f=@gingi2;
    [t,y]=ode15s(@(t,y)f(t,y,c5a(j), pge(k)),tspan,y0); 
    A=[t y]; 
    
    
    %% Save only the outputs at the time points of interest [time_points]:
    betagamma(:,j,k)=A(:,8);
    alphas(:,j,k)=A(:,2);
    alphasbetagamma(:,j)=A(:,3);
    alphai(:,j,k)=A(:,5);
    alphaibetagamma(:,j)=A(:,6);
    cAMP(:,j,k)=A(:,9);
    
    betagammatp(j,k,:)=A(time_points+1,8);
    alphastp(j,k,:)=A(time_points+1,2);
    alphasbetagammatp(:,j)=A(time_points+1,3);
    alphaitp(j,k,:)=A(time_points+1,5);
    alphaibetagammatp(j,:)=A(time_points+1,6);
    cAMPtp(j,k,:)=A(time_points+1,9);
    


 end
 end
 
 %get the value of C1 used in these simulations for labeling plots
[~,C1]=gingi2(1,y0,1,1);

 
%% Save the workspace
%May 4, 2020: Added bg values to figure file names
surf(10^3*pge,10^3*c5a,cAMPtp(:,:,3),'LineWidth',2);
ylabel('C5a (n{M})','FontSize', 14);
xlabel('PGE_2 (n{M})','Fontsize', 14);
zlabel('cAMP (\mu{M})','FontSize',14);
saveas(gcf,sprintf('cAMP_surface_bg=%d_C1=%d_paper.fig',bg,C1));

surf(10^3*pge,10^3*c5a,alphastp(:,:,3),'LineWidth',2);
ylabel('C5a (n{M})','FontSize', 14);
xlabel('PGE_2 (n{M})','Fontsize', 14);
zlabel('\alpha_s^* (\mu{M})','FontSize',14);
saveas(gcf,sprintf('alphas_surface_bg=%d_C1=%d_paper.fig',bg,C1));

