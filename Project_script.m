
clc; clear;% close all;
ts=0.1e-6; fs=100e3; Tend=50e-3;

L=90e-6; C1=100e-6; C2=100e-6;

Vi=24; voref = 96; 

kp1=0.01; kp2=0.01; ki=2000;

R1=18.432; %Calculated from Vout 96V and nominal power 500W

sim('model');
%plot(1e3*t,iL,'b'); hold on;
%plot(1e3*t,io,'b'); hold on;

n=100000; %with ts=0.1e-6 and n=100.000 will use this variable to analyze steady state from 10ms

ilmax=max(il(n+1:end));

ilmin=min(il(n+1:end));
ilmean=mean(il(n+1:end));
ilripple=((ilmax-ilmean)/ilmean)*100;

vomax=max(vo(n+1:end));
vomin=min(vo(n+1:end));
vomean=mean(vo(n+1:end));
voripple=((vomax-vomin)/vomean)*100;

str={"il ripple: " + ilripple + "%","vo ripple: " + voripple + "%"};

plot(1e3*t,vo); grid on; hold on;
plot(1e3*t,il); grid on; hold on; 
plot(1e3*t,d);
legend('vo - output voltage', 'il - inductor current');
xlabel('time (ms)'); ylabel('vo(V), DC  il(A)');
hold on;
text(10,60,str)