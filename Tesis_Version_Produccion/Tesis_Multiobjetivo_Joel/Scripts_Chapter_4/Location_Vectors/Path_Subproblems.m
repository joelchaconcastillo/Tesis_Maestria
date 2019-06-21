fileID = dlmread('POF_MOEAD_UF5_RUN1_seed_200.tmp_boltzman_5_DE_Dynamic_Rate_CR_D025____','');
figure

hold on
%plot([0, 1],[1, 0],'-r')
for i = 1:9
k = (i-1)*100
k2 = (i+1)*100
plot(fileID(k+1,1),fileID(k+1,2), '.black', 'MarkerSize',20)


%plot( [  fileID(k,1), fileID(k2,1) ], [fileID(k,2), fileID(k2,2)], '--b')

%plot( fileID(k,1), fileID(k,2), '--b')


plot(fileID(k+3,1),fileID(k+3,2), '.b', 'MarkerSize',20)
plot(fileID(k+99,1),fileID( k+99,2), '.r', 'MarkerSize',20)
end