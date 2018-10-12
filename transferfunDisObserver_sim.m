


close all
clc

% Nominal plant
plant = tf(1,[0.01 1])

% Low pass filter for disturbance observer
w = 100; % [rad/s]
lpf = tf(1,[1/w 1])*tf(1,[1/w 1])

% Disturbance observer
do = tf(plant.den{1},plant.num{1})*lpf

% Plant with parameter variation
plantWithVar = plant*1/1.5

% Simulation for evaluation to disturbance
sim('evaluateDis')

figure
plot(t,out1,'g','LineWidth',2.5) 
grid on
hold on
plot(t,out2,'r')
plot(t,out3,'b')
xlabel('Time [s]')
set(gca,'Box','on','FontSize',15,...
        'XGrid','on','YGrid','on','FontName','Century','FontWeight','bold');
legend('Nominal', 'w/o do', 'w/ do')


% Simulation for evaluation to parameter variation
sim('evaluateParamVar')

figure
plot(t,out4,'g','LineWidth',2.5)
grid on
hold on
plot(t,out5,'r')
plot(t,out6,'b')
xlabel('Time [s]')
set(gca,'Box','on','FontSize',15,...
        'XGrid','on','YGrid','on','FontName','Century','FontWeight','bold');
legend('Nominal', 'w/o do', 'w/ do')
ylim([0 1.2])












