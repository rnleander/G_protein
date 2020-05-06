% This file creates surface plots to relate 
% the total concentration of beta-gamma subunits and 
% the concentration of C5a to the activation of alpha_s subunits and
% the production of cAMP.  The concentration of PGE2 is held constant.
clear all;
close all;

runs=1;

gparameters;
bg=(1:.5:10);
% Set the concentration of PGE2
pge=.010;
%pge=.002;
% Set the factor by which beta-gamma binding increases the rate of cAMP 
%synthesis.
%C1=11;
%The above was comented out (5/1/2020), this parameter is set inside LHS2

for i=1:length(bg)
    f=@gingi2;
    y0=[0, 0, as, 0, 0, ai, bg(i), 0];
    [s,y]=ode15s(@(s,y)f(s,y,0,0),[0,100000],y0);
    y0=y(length(s),:);

c5a=(0:.00001:.0001);
%May 4 2020, try a wider range of C5a values.
%c5a=(0:.00005:.001);

 for j=1:length(c5a)

 


    %options=odeset('RelTol', 1e-3);
    f=@gingi2;
    [t,y]=ode15s(@(t,y)f(t,y,c5a(j), pge),tspan,y0); 
    A=[t y]; 
    
    
    %% Save only the outputs at the time points of interest [time_points]:
    betagamma(:,i,j)=A(:,8);
    alphas(:,i,j)=A(:,2);
    alphasbetagamma(:,j)=A(:,3);
    alphai(:,i,j)=A(:,5);
    alphaibetagamma(:,j)=A(:,6);
    cAMP(:,i,j)=A(:,9);
    
    betagammatp(i,j,:)=A(time_points+1,8);
    alphastp(i,j,:)=A(time_points+1,2);
    alphasbetagammatp(:,i,j)=A(time_points+1,3);
    alphaitp(i,j,:)=A(time_points+1,5);
    alphaibetagammatp(i,j,:)=A(time_points+1,6);
    cAMPtp(i,j,:)=A(time_points+1,9);
    


 end
end
 
%% Save the workspace
save gingi_surf_plot_c5_bg_paper.mat;

surf(10^3*c5a,bg,cAMPtp(:,:,3),'LineWidth',2);
xlabel('C5a (n{M})','FontSize', 14);
ylabel('\beta\gamma (\mu{M})','Fontsize', 14);
zlabel('cAMP (\mu{M})','FontSize',14);
saveas(gcf,sprintf('cAMP_surface_PGE=%d_paper.fig',pge));

surf(10^3*c5a,bg,alphastp(:,:,3),'LineWidth',2);
xlabel('C5a (n{M})','FontSize', 14);
ylabel('\beta\gamma (\mu{M})','Fontsize', 14);
zlabel('\alpha_s^* (\mu{M})','FontSize',14);
saveas(gcf,sprintf('alphas_surface_PGE=%d_paper.fig',pge));

