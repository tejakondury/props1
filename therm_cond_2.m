clear
% Properties variation with temperature
% Material:-Glass fiber and epoxy
%##################################
Ea=240;
J_0=3.6e5;
gamma=0.7;
rho1=2.5e3;    %kg/m3
rho2=1.2e3;
rho3=2e3;
R=8.314;
p_0=0.1;
psi1=0.25;
k_0=0.4;
kb=0.35;
kp=0.6;
psi4_0=0.06;

psi2_0=0.69;
n=0.1;
ear=7.8e3;
c1=0.89;
c2=1;
c3=1;
thetadot=0.1;
theta_0=293;
%##################################
% Thermal conductivity
%pkg load symbolic
psi2=psi2_0;
syms tau temp
a=0;
b=(temp-theta_0)/thetadot;

theta=theta_0+(thetadot*tau);

expr=exp(-ear/(theta));
dumm=int(expr,tau,a,b);

gg=((-J_0)/(rho2))*((dumm));

psi2=psi2_0*exp(gg);

psi3=(psi2_0-psi2)*(1-gamma)*(rho2/rho3);

psi4=1-(psi1+psi2+psi3);




%k=(k_0/psi2_0)*(temp/theta_0)^(1/2)*(psi2+n*psi3);


mk=kp/kb;

sb=psi4^(1/3);
sp=(1-psi3)^(1/3);
b1=(sb/((sp^2-sb^2)+mk*(1-sp^2))+(sp-sb)/(sp^2+mk*(1-sp^2))+(1-sp)/mk)^(-1);
b0=(temp/theta_0)^(1/2);

km=kb*b1*b0;
figure
ezplot(km,[theta_0 1073])
title('Variation of Km with temp')
xlabel('temp in Kelvin')
ylabel('Km W/mK')


figure
exp=kb*b0;
ezplot(exp, [theta_0 1073])
title('variation of Kb with temp')
xlabel('Temp in Kelvin')
ylabel('Kb W/mK')
%zz=int(km,a,b);
%an=zz;
%ezplot(an, [theta_0 1073])

%ezplot(k,[theta_0 600]);
%  figure
%  hold on
%  ezplot(psi2,[theta_0 1073])
%  ezplot(psi3,[theta_0 1073])
%  ezplot(psi4,[theta_0 1073])
%  ylim auto
%  title('Variation of volume fractions with temp for epoxy matrix')
%  legend('matrix','char','gas')
%  xlabel('Temperature in K')
%  ylabel('Volume fractions')

%figure
%ezplot(k,[theta_0 1073]);
% % Specific heat

% for theta=273:1073
%    c=((rho1*c1*psi1)+(rho2*c2*psi2)+(rho3*c3*psi3))/((rho1*psi1)+(rho2*psi2)+(rho3*psi3));
%    i=i+1;
% end
 %figure
% ezplot(c,[theta_0 1073]);
% figure
% hold on
% plot(psi2)
% plot(psi3)
% plot(psi4)