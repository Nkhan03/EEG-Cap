clc
clear

load NoorSkola2.txt                          % laddar upp filen. Glöm inte att ta bort de 6 första raderna på txt-filen så att den börjar från 0. 
sensorFp1 = NoorSkola2(100:end-100,2);       % väljer från rad 100 till slutet minus de 100 sista raderna på kolumn 2. 
sensorO1 = NoorSkola2(100:end-100,3);        % Skriv in filnamnen (ex NoorSkola2) på båda raderna, sensorFp1 och sensorO1. 
 
%Fs = 250; % Sampling frequency
%t = 0:1/Fs:1;   %Time vector of 1 second


%% Alpha Waves 
dataAlphaFp1 = preprocessAlpha(sensorFp1);       % filtrera värderna genom funktionen preprocessAlpha bandpassfilter 7Hz-13Hz. 
avgAlphaFp1 = mean(dataAlphaFp1)                 % medelvärdet på Alpha värden.

dataAlphaO1 = preprocessAlpha(sensorO1);
avgAlphaO1 = mean(dataAlphaO1)
%plot(dataAlpha); 


%% Theta waves
dataThetaFp1 = preprocessTheta(sensorFp1);       % filtrera värderna genom funktionen preprocessTheta bandpassfilter 4Hz-7Hz. 
avgThetaFp1 = mean(dataThetaFp1)                 % medelvärdet på theta värden.

dataThetaO1 = preprocessTheta(sensorO1);
avgThetaO1 = mean(dataThetaO1)
%plot(dataTheta);


%% Plot table
figure(1)
col = {'Alpha','Theta'} 
row = {'Frontallob','Occipitallob'}
dat = {avgAlphaFp1,avgThetaFp1; avgAlphaO1,avgThetaO1}
uitable('columnname', col,'rowname',row,'data',dat); 




%% Plot figure
% plot both graphs in same Axes
%figure(1)
%plot(dataTheta,'g')
%title('Alpha (röd) och Theta (grön) vågor')
%hold on
%plot(dataAlpha,'r')
%hold off
%grid




% plot both graphs in separate axes in a figure
%figure(2)
%tiledlayout(2,1)

% Top plot
%ax1 = nexttile
%plot(dataTheta,'g')
%title('Theta')
%ax1.FontSize = 14;

% Bottom plot
%ax2 = nexttile
%plot(dataAlpha,'r')
%title('Alpha')
%ax2.FontSize = 14;






