% Plota e calcula regressões entre Hm e Hc (Radiaçao medida e calculada)

% Plota o grafico da RadMedida com a RadEstimada Diaria
figure(6)
subplot(2,2,1);
plot(radMedida,'MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',1,'Marker','o','LineStyle','none')
grid on
hold on
plot(radEstimada_Dias,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',1,'Marker','o','LineStyle','none')
xlim([0 height(Tins_aux)])
set(gca, 'FontName', 'Times New Roman')
% Colocando a legend e setando o tamanho do markersize
[~, objh] = legend({'Radiação solar medida', 'Radiação solar estimada'});
objhl = findobj(objh, 'type', 'line'); 
set(objhl, 'Markersize', 5); 
objhl = findobj(objh, 'type', 'patch');
set(objhl, 'Markersize', 5);
titulo1 = '\fontsize{13}\color{black}\bfA. \fontsize{11}\color{black}\bfMétodo diário';
title({titulo1});
xlabel('Período de tempo analisado (dias)','FontWeight','bold', 'FontSize',9);
ylabel('Radiação solar (MJ m^{-2} dia^{-1})','FontWeight','bold', 'FontSize',9);
hold off

% Plota o grafico da RadMedida com a RadEstimada Mensal
subplot(2,2,2);
plot(radMedida,'MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',1,'Marker','o','LineStyle','none')
grid on
hold on
plot(radEstimada_Mensal,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',1,'Marker','o','LineStyle','none')
xlim([0 height(Tins_aux)])
set(gca, 'FontName', 'Times New Roman')
% Colocando a legend e setando o tamanho do markersize
[~, objh] = legend({'Radiação solar medida', 'Radiação solar estimada'});
objhl = findobj(objh, 'type', 'line'); 
set(objhl, 'Markersize', 5); 
objhl = findobj(objh, 'type', 'patch');
set(objhl, 'Markersize', 5);
titulo1 = '\fontsize{13}\color{black}\bfB. \fontsize{11}\color{black}\bfMétodo mensal';
title({titulo1});
xlabel('Período de tempo analisado (dias)','FontWeight','bold', 'FontSize',9);
ylabel('Radiação solar (MJ m^{-2} dia^{-1})','FontWeight','bold', 'FontSize',9);
hold off

% Plota o grafico da RadMedida com a RadEstimada Anual
subplot(2,2,3);
plot(radMedida,'MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',1,'Marker','o','LineStyle','none')
grid on
hold on
plot(radEstimada_Anual,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',1,'Marker','o','LineStyle','none')
xlim([0 height(Tins_aux)])
set(gca, 'FontName', 'Times New Roman')
% Colocando a legend e setando o tamanho do markersize
[~, objh] = legend({'Radiação solar medida', 'Radiação solar estimada'});
objhl = findobj(objh, 'type', 'line'); 
set(objhl, 'Markersize', 5); 
objhl = findobj(objh, 'type', 'patch');
set(objhl, 'Markersize', 5);
titulo1 = '\fontsize{13}\color{black}\bfC. \fontsize{11}\color{black}\bfMétodo Anual';
title({titulo1});
xlabel('Período de tempo analisado (dias)','FontWeight','bold', 'FontSize',9);
ylabel('Radiação solar (MJ m^{-2} dia^{-1})','FontWeight','bold', 'FontSize',9);
hold off

% Plota o grafico da RadMedida com a RadEstimada Estacional
subplot(2,2,4);
plot(radMedida,'MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',1,'Marker','o','LineStyle','none')
grid on
hold on
plot(radEstimada_Estacional,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],'MarkerSize',1,'Marker','o','LineStyle','none')
xlim([0 height(Tins_aux)])
set(gca, 'FontName', 'Times New Roman')
% Colocando a legend e setando o tamanho do markersize
[~, objh] = legend({'Radiação solar medida', 'Radiação solar estimada'});
objhl = findobj(objh, 'type', 'line'); 
set(objhl, 'Markersize', 5); 
objhl = findobj(objh, 'type', 'patch');
set(objhl, 'Markersize', 5);
titulo1 = '\fontsize{13}\color{black}\bfD. \fontsize{11}\color{black}\bfMétodo estacional';
title({titulo1});
xlabel('Período de tempo analisado (dias)','FontWeight','bold', 'FontSize',9);
ylabel('Radiação solar (MJ m^{-2} dia^{-1})','FontWeight','bold', 'FontSize',9);
hold off
