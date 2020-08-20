% Faz as analises estatisticas comparando os valores medidos com os valores obtidos 
% através de 'a' e 'b' da equação.

% Os valores estatisticos são salvos em um arquivo chamado 'analiseEstimada_nomedacidade.txt'

format long g

fid = fopen(['C:\Users\pauli\Documents\TCC_Matlab\Output\analiseEstimada_' nome_cidade '.txt'],'wt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estacional

real = radMedida;
calc = radEstimada_Estacional;
n = size(radMedida,1);
alpha = 0.05;
tcrit = round((tinv(1-alpha/2,n-1)),4);

% Correlation coefficients 'r'
r = round(corrcoef(real,calc),4);

err = real - calc; %Calculo o erro 
%Root Mean Square Error 'RMSE'
squareError = err.^2;
meanSquareError = mean(squareError);
RMSE = round(sqrt(meanSquareError),4);

%Mean Bias Error 'MBE'
MBE = round(mean(err),4); % Calculo do MBE

% Willmott d
d = round((1 - mean((calc(:)-real(:)).^2)/max(mean((abs(calc(:)-mean(real(:)))+abs(real(:)-mean(real(:)))).^2),eps)),4);

% Indice de confiança c
c = round((r(1,2) * d),4);

% t-statistical
t = round((((n-1)*MBE^2)/(RMSE^2 - MBE^2))^(0.5),4);

fprintf(fid,'Estacional\n');
fprintf(fid,'r = %g\n', r(1,2));
fprintf(fid,'d = %g\n', d);
fprintf(fid,'c = %g\n', c);
fprintf(fid,'RMSE = %g\n', RMSE);
fprintf(fid,'MBE = %g\n', MBE);
fprintf(fid,'t-statistic = %g\n', t);
fprintf(fid,'t-critical = %g\n\n', tcrit);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diaria

real = radMedida;
calc = radEstimada_Dias;
n = size(radMedida,1);
alpha = 0.05;
tcrit = round((tinv(1-alpha/2,n-1)),4);

% Correlation coefficients 'r'
r = round(corrcoef(real,calc),4);

err = real - calc; %Calculo o erro 
%Root Mean Square Error 'RMSE'
squareError = err.^2;
meanSquareError = mean(squareError);
RMSE = round(sqrt(meanSquareError),4);

%Mean Bias Error 'MBE'
MBE = round(mean(err),4); % Calculo do MBE

% Willmott d
d = round((1 - mean((calc(:)-real(:)).^2)/max(mean((abs(calc(:)-mean(real(:)))+abs(real(:)-mean(real(:)))).^2),eps)),4);

% Indice de confiança c
c = round((r(1,2) * d),4);

% t-statistical
t = round((((n-1)*MBE^2)/(RMSE^2 - MBE^2))^(0.5),4);

fprintf(fid,'Diária\n');
fprintf(fid,'r = %g\n', r(1,2));
fprintf(fid,'d = %g\n', d);
fprintf(fid,'c = %g\n', c);
fprintf(fid,'RMSE = %g\n', RMSE);
fprintf(fid,'MBE = %g\n', MBE);
fprintf(fid,'t-statistic = %g\n', t);
fprintf(fid,'t-critical = %g\n\n', tcrit);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mensal

real = radMedida;
calc = radEstimada_Mensal;
n = size(radMedida,1);
alpha = 0.05;
tcrit = round((tinv(1-alpha/2,n-1)),4);

% Correlation coefficients 'r'
r = round(corrcoef(real,calc),4);

err = real - calc; %Calculo o erro 
%Root Mean Square Error 'RMSE'
squareError = err.^2;
meanSquareError = mean(squareError);
RMSE = round(sqrt(meanSquareError),4);

%Mean Bias Error 'MBE'
MBE = round(mean(err),4); % Calculo do MBE

% Willmott d
d = round((1 - mean((calc(:)-real(:)).^2)/max(mean((abs(calc(:)-mean(real(:)))+abs(real(:)-mean(real(:)))).^2),eps)),4);

% Indice de confiança c
c = round((r(1,2) * d),4);

% t-statistical
t = round((((n-1)*MBE^2)/(RMSE^2 - MBE^2))^(0.5),4);

fprintf(fid,'Mensal\n');
fprintf(fid,'r = %g\n', r(1,2));
fprintf(fid,'d = %g\n', d);
fprintf(fid,'c = %g\n', c);
fprintf(fid,'RMSE = %g\n', RMSE);
fprintf(fid,'MBE = %g\n', MBE);
fprintf(fid,'t-statistic = %g\n', t);
fprintf(fid,'t-critical = %g\n\n', tcrit);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Anual

real = radMedida;
calc = radEstimada_Anual;
n = size(radMedida,1);
alpha = 0.05;
tcrit = round((tinv(1-alpha/2,n-1)),4);

% Correlation coefficients 'r'
r = round(corrcoef(real,calc),4);

err = real - calc; %Calculo o erro 
%Root Mean Square Error 'RMSE'
squareError = err.^2;
meanSquareError = mean(squareError);
RMSE = round(sqrt(meanSquareError),4);

%Mean Bias Error 'MBE'
MBE = round(mean(err),4); % Calculo do MBE

% Willmott d
d = round((1 - mean((calc(:)-real(:)).^2)/max(mean((abs(calc(:)-mean(real(:)))+abs(real(:)-mean(real(:)))).^2),eps)),4);

% Indice de confiança c
c = round((r(1,2) * d),4);

% t-statistical
t = round((((n-1)*MBE^2)/(RMSE^2 - MBE^2))^(0.5),4);

fprintf(fid,'Anual\n');
fprintf(fid,'r = %g\n', r(1,2));
fprintf(fid,'d = %g\n', d);
fprintf(fid,'c = %g\n', c);
fprintf(fid,'RMSE = %g\n', RMSE);
fprintf(fid,'MBE = %g\n', MBE);
fprintf(fid,'t-statistic = %g\n', t);
fprintf(fid,'t-critical = %g\n\n', tcrit);

fclose(fid);