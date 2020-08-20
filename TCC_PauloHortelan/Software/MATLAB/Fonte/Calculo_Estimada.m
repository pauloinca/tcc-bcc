% H/Ho = a + b * (n/N)
% y = a + b * x
%
% H = Ho * (a + b * (n/N))

% Ou seja, calcula a radiação solar (H) estimada, com base nos valores de a e b encontrados

format long g

radEstimada_Primavera = zeros(1,1);
radEstimada_Verao = zeros(length(insDiv_Verao),1);
radEstimada_Outono = zeros(1,1);
radEstimada_Inverno = zeros(1,1);
radEstimada_Dias = zeros(1,1);
radEstimada_Estacional = zeros(1,1);
radEstimada_Mensal = zeros(1,1);
radEstimada_Anual = zeros(1,1);


for i=1:length(insDiv_diasTodos)
    
    % se tiver entre setembro e novembro é PRIMAVERA
    if contains(datestr(vetData(i),'dd-mm-yyyy'),'-09-') || contains(datestr(vetData(i),'dd-mm-yyyy'),'-10-') || contains(datestr(vetData(i),'dd-mm-yyyy'),'-11-') 
        radEstimada_Estacional(i,1) = rad_extra_aux(i,1) * (a_Primavera + b_Primavera * insDiv_diasTodos(i,1));
    end
    % se tiver entre dezembro e fevereiro é VERÃO
    if contains(datestr(vetData(i),'dd-mm-yyyy'),'-12-') || contains(datestr(vetData(i),'dd-mm-yyyy'),'-01-') || contains(datestr(vetData(i),'dd-mm-yyyy'),'-02-') 
        radEstimada_Estacional(i,1) = rad_extra_aux(i,1) * (a_Verao + b_Verao * insDiv_diasTodos(i,1));
    end
    % se tiver entre março e maio é OUTONO
    if contains(datestr(vetData(i),'dd-mm-yyyy'),'-03-') || contains(datestr(vetData(i),'dd-mm-yyyy'),'-04-') || contains(datestr(vetData(i),'dd-mm-yyyy'),'-05-') 
        radEstimada_Estacional(i,1) = rad_extra_aux(i,1) * (a_Outono + b_Outono * insDiv_diasTodos(i,1));
    end 
    % se tiver entre junho e agosto é INVERNO
    if contains(datestr(vetData(i),'dd-mm-yyyy'),'-06-') || contains(datestr(vetData(i),'dd-mm-yyyy'),'-07-') || contains(datestr(vetData(i),'dd-mm-yyyy'),'-08-') 
        radEstimada_Estacional(i,1) = rad_extra_aux(i,1) * (a_Inverno + b_Inverno * insDiv_diasTodos(i,1));
    end           

end


for i=1:length(insDiv_diasTodos)
    radEstimada_Dias(i,1) = rad_extra_aux(i,1) * (a_Dias + b_Dias * insDiv_diasTodos(i,1));    
    radEstimada_Mensal(i,1) = rad_extra_aux(i,1) * (a_Mensal + b_Mensal * insDiv_diasTodos(i,1));    
    radEstimada_Anual(i,1) = rad_extra_aux(i,1) * (a_Anual + b_Anual * insDiv_diasTodos(i,1));
end