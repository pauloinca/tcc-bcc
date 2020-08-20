% Script para fazer a plotagem dos graficos entre H/Ho e n/N, e calcula 'a' e 'b'
% Os resultados de a, b e Rsq2 são salvos em um arquivo chamado 'analiseRegressao_nomedacidade.txt'

format long g

fid = fopen(['C:\Users\pauli\Documents\TCC_Matlab\Output\analiseRegressao_' nome_cidade '.txt'],'wt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cria subplots da regressão entre H/H0 e n/N para as estaçoes do ano

figure(1)
subplot(2,2,1);
x = insDiv_Outono;
y = radDiv_Outono;
X = [ones(length(x),1) x];
b = X\y;
a_Outono = round(b(1),4);
b_Outono = round(b(2),4);
yCalc2 = X*b;
plot(x,y,'o','MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',3)
hold on
plot(x,yCalc2,'-','LineWidth',1.3,'Color','r')
Rsq2_Outono = round(1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2),4);
set(gca, 'FontName', 'Times New Roman');
titulo1 = '\fontsize{12}\color{black}\bfa. \fontsize{11}\color{black}\bfOutono';
%titulo2 = ['\fontsize{11}\color{black}\rmH/H_0 = ' num2str(a_Dias) ' + ' num2str(b_Dias) ' n/N'];
%titulo3 = ['\fontsize{11}\color{black}\rmR² = ' num2str(Rsq2_diasTodos)];
%title({titulo1; titulo2; titulo3});
title({titulo1});
xlabel('n/N','FontWeight','bold')
ylabel('H/H_0','FontWeight','bold');
grid on

fprintf(fid,'a_Outono = %g\n', a_Outono);
fprintf(fid,'b_Outono = %g\n', b_Outono);
fprintf(fid,'a + b_Outono = %g\n', a_Outono + b_Outono);
fprintf(fid,'Rsq2_Outono = %g\n\n', Rsq2_Outono);

subplot(2,2,2);
x = insDiv_Primavera;
y = radDiv_Primavera;
X = [ones(length(x),1) x];
b = X\y;
a_Primavera = round(b(1),4);
b_Primavera = round(b(2),4);
yCalc2 = X*b;
plot(x,y,'o','MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',3)
hold on
plot(x,yCalc2,'-','LineWidth',1.3,'Color','r')
Rsq2_Primavera = round(1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2),4);
set(gca, 'FontName', 'Times New Roman')
titulo1 = '\fontsize{12}\color{black}\bfb. \fontsize{11}\color{black}\bfPrimavera';
%titulo2 = ['\fontsize{11}\color{black}\rmH/H_0 = ' num2str(a_Dias) ' + ' num2str(b_Dias) ' n/N'];
%titulo3 = ['\fontsize{11}\color{black}\rmR² = ' num2str(Rsq2_diasTodos)];
%title({titulo1; titulo2; titulo3});
title({titulo1});
xlabel('n/N','FontWeight','bold');
ylabel('H/H_0','FontWeight','bold');
grid on

fprintf(fid,'a_Primavera = %g\n', a_Primavera);
fprintf(fid,'b_Primavera = %g\n', b_Primavera);
fprintf(fid,'a + b_Primavera = %g\n', a_Primavera + b_Primavera);
fprintf(fid,'Rsq2_Primavera = %g\n\n', Rsq2_Primavera);

subplot(2,2,3);
x = insDiv_Verao;
y = radDiv_Verao;
X = [ones(length(x),1) x];
b = X\y;
a_Verao = round(b(1),4);
b_Verao = round(b(2),4);
yCalc2 = X*b;
plot(x,y,'o','MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',3)
hold on
plot(x,yCalc2,'-','LineWidth',1.3,'Color','r')
Rsq2_Verao = round(1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2),4);
set(gca, 'FontName', 'Times New Roman')
titulo1 = '\fontsize{12}\color{black}\bfc. \fontsize{11}\color{black}\bfVerão';
%titulo2 = ['\fontsize{11}\color{black}\rmH/H_0 = ' num2str(a_Dias) ' + ' num2str(b_Dias) ' n/N'];
%titulo3 = ['\fontsize{11}\color{black}\rmR² = ' num2str(Rsq2_diasTodos)];
%title({titulo1; titulo2; titulo3});
title({titulo1});
xlabel('n/N','FontWeight','bold');
ylabel('H/H_0','FontWeight','bold');
grid on

fprintf(fid,'a_Verao = %g\n', a_Verao);
fprintf(fid,'b_Verao = %g\n', b_Verao);
fprintf(fid,'a + b_Verao = %g\n', a_Verao + b_Verao);
fprintf(fid,'Rsq2_Verao = %g\n\n', Rsq2_Verao);

subplot(2,2,4);
x = insDiv_Inverno;
y = radDiv_Inverno;
X = [ones(length(x),1) x];
b = X\y;
a_Inverno = round(b(1),4);
b_Inverno = round(b(2),4);
yCalc2 = X*b;
plot(x,y,'o','MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',3)
hold on
plot(x,yCalc2,'-','LineWidth',1.3,'Color','r')
Rsq2_Inverno = round(1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2),4);
set(gca, 'FontName', 'Times New Roman')
titulo1 = '\fontsize{12}\color{black}\bfd. \fontsize{11}\color{black}\bfInverno';
%titulo2 = ['\fontsize{11}\color{black}\rmH/H_0 = ' num2str(a_Dias) ' + ' num2str(b_Dias) ' n/N'];
%titulo3 = ['\fontsize{11}\color{black}\rmR² = ' num2str(Rsq2_diasTodos)];
%title({titulo1; titulo2; titulo3});
title({titulo1});
xlabel('n/N','FontWeight','bold');
ylabel('H/H_0','FontWeight','bold');
grid on

fprintf(fid,'a_Inverno = %g\n', a_Inverno);
fprintf(fid,'b_Inverno = %g\n', b_Inverno);
fprintf(fid,'a + b_Inverno = %g\n', a_Inverno + b_Inverno);
fprintf(fid,'Rsq2_Inverno = %g\n\n', Rsq2_Inverno);

titulo1 = '\fontsize{13}\color{black}\bfD. \fontsize{11}\color{black}\bfMétodo estacional';
suptitle({titulo1});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot 'diasTodos'

figure(2)
axis tight
h1 = subplot(3,1,1);
x = insDiv_diasTodos;
y = radDiv_diasTodos;
X = [ones(length(x),1) x];
b = X\y;
a_Dias = round(b(1),4);
b_Dias = round(b(2),4);
yCalc2 = X*b;
plot(x,y,'o','MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',3)
hold on
plot(x,yCalc2,'-','LineWidth',1.3,'Color','r')
Rsq2_diasTodos = round(1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2),4);
set(gca, 'FontName', 'Times New Roman')
titulo1 = '\fontsize{13}\color{black}\bfA. \fontsize{11}\color{black}\bfMétodo diário';
%titulo2 = ['\fontsize{11}\color{black}\rmH/H_0 = ' num2str(a_Dias) ' + ' num2str(b_Dias) ' n/N'];
%titulo3 = ['\fontsize{11}\color{black}\rmR² = ' num2str(Rsq2_diasTodos)];
%title({titulo1; titulo2; titulo3});
title({titulo1});
%set(gca, 'XTickLabel',[]);
%xlabel('n/N')
xlabel('n/N','FontWeight','bold')
ylabel('H/H_0','FontWeight','bold');
grid on

fprintf(fid,'a_Diario = %g\n', a_Dias);
fprintf(fid,'b_Diario = %g\n', b_Dias);
fprintf(fid,'a + b_Diario = %g\n', a_Dias + b_Dias);
fprintf(fid,'Rsq2_Diario = %g\n\n', Rsq2_diasTodos);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot 'Mensal'

h2 = subplot(3,1,2);
x = insDiv_mediaMensal;
y = radDiv_mediaMensal;
X = [ones(length(x),1) x];
b = X\y;
a_Mensal = round(b(1),4);
b_Mensal = round(b(2),4);
yCalc2 = X*b;
plot(x,y,'o','MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',3)
hold on
plot(x,yCalc2,'-','LineWidth',1.3,'Color','r')
Rsq2_Mensal = round(1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2),4);
set(gca, 'FontName', 'Times New Roman')
titulo1 = '\fontsize{13}\color{black}\bfB. \fontsize{11}\color{black}\bfMétodo mensal';
%titulo2 = ['\fontsize{11}\color{black}\rmH/H_0 = ' num2str(a_Dias) ' + ' num2str(b_Dias) ' n/N'];
%titulo3 = ['\fontsize{11}\color{black}\rmR² = ' num2str(Rsq2_diasTodos)];
%title({titulo1; titulo2; titulo3});
title({titulo1});
%set(gca, 'XTickLabel',[]);
%xlabel('n/N')
xlabel('n/N','FontWeight','bold')
ylabel('H/H_0','FontWeight','bold');
grid on

fprintf(fid,'a_Mensal = %g\n', a_Mensal);
fprintf(fid,'b_Mensal = %g\n', b_Mensal);
fprintf(fid,'a + b_Mensal = %g\n', a_Mensal + b_Mensal);
fprintf(fid,'Rsq2_Mensal = %g\n\n', Rsq2_Mensal);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot 'Anual'

h3 = subplot(3,1,3);
x = insDiv_mediaAnual;
y = radDiv_mediaAnual;
X = [ones(length(x),1) x];
b = X\y;
a_Anual = round(b(1),4);
b_Anual = round(b(2),4);
yCalc2 = X*b;
plot(x,y,'o','MarkerFaceColor',[0 0.4470 0.7410],'MarkerEdgeColor',[0 0.4470 0.7410],'MarkerSize',3)
hold on
plot(x,yCalc2,'-','LineWidth',1.3,'Color','r')
Rsq2_Anual = round(1 - sum((y - yCalc2).^2)/sum((y - mean(y)).^2),4);
set(gca, 'FontName', 'Times New Roman')
titulo1 = '\fontsize{13}\color{black}\bfC. \fontsize{11}\color{black}\bfMétodo anual';
%titulo2 = '\fontsize{11}\color{black}\bfMétodo anual';
%titulo2 = ['\fontsize{10}\color{black}\rmH/H_0 = ' num2str(a_Dias) ' + ' num2str(b_Dias) ' (n/N)'];
%titulo3 = ['\fontsize{11}\color{black}\rmR² = ' num2str(Rsq2_diasTodos)];
%title({titulo1; titulo2; titulo3});
%text(0.687,0.65,titulo2);
title({titulo1});
%set(gca, 'XTickLabel',[]);
xlabel('n/N','FontWeight','bold')
ylabel('H/H_0','FontWeight','bold');
p1 = get(h1, 'Position');
p2 = get(h2, 'Position');
p3 = get(h3, 'Position');
p1(2) = p2(2)+p2(4);%change bottom starting point of h1
p2(2) = p3(2)+p3(4);%change bottom starting point of h1

%set(h1, 'pos', p1);%set h1 position
%set(h2, 'pos', p2);%set h1 position

grid on

fprintf(fid,'a_Anual = %g\n', a_Anual);
fprintf(fid,'b_Anual = %g\n', b_Anual);
fprintf(fid,'a + b_Anual = %g\n', a_Anual + b_Anual);
fprintf(fid,'Rsq2_Anual = %g\n\n', Rsq2_Anual);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fid,'Dados totais = %g\n', height(Tdata));
fprintf(fid,'Dados usados = %g\n', height(Tins_aux));

fclose(fid);