figure

plot([0, 1],[1, 0],'-r')
legend('Frente de Pareto')

hold on
plot([0,3*cos(pi/4)],[0,3*sin(pi/4)],'--b')
plot([0,3*cos(pi/8)],[0,3*sin(pi/8)],'--b')
plot([0,3*cos(3*pi/8)],[0,3*sin(3*pi/8)],'--b')




text( 3*cos(pi/8), 3*sin(pi/8)-0.1, '\lambda_1');

plot(2*cos(pi/8), 2*sin(pi/8)-0.3,  '.black', 'MarkerSize',20)
text( 2*cos(pi/8), 2*sin(pi/8)-0.4, 'X_2')
%text( cos(pi/8), sin(pi/8)-0.1, '*');

text( 3*cos(pi/4), 3*sin(pi/4)-0.1, '\lambda_2');
plot(2*cos(pi/4), 2*sin(pi/4)-0.4,  '.black', 'MarkerSize',20)
text( 2*cos(pi/4), 2*sin(pi/4)-0.5, 'X_1')


text( 3*cos(3*pi/8), 3*sin(3*pi/8)-0.1, '\lambda_3');
plot(2*cos(3*pi/8), 2*sin(3*pi/8)-0.3,  '.black', 'MarkerSize',20)
text( 2*cos(3*pi/8), 2*sin(3*pi/8)-0.4, 'X_3')

text( 1.2*cos(pi/4), 1.2*sin(pi/4)-0.3, 'X_4')
plot(1.2*cos(pi/4), 1.2*sin(pi/4)-0.2,  '.black', 'MarkerSize',20)
xlabel('f_1')
ylabel('f_2')

%plot(t,sin(t),'-.r*')

%plot(t,sin(t-pi/2),'--mo')
%plot(t,sin(t-pi),':bs')
%hold off