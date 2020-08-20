format long g

% Le os dados diarios da tabela (de ins e de rad), divide pela rad_extra e
% pela ins_max e gera dados H/Ho e n/N diarios

% Variaveis obtidas -> radDiv_diasTodos, insDiv_diasTodos

% Trad_aux é a tabela com header RADIACAO que contém média da radiaçao
% medida no dia
strrad1 = 'R11:R';
strrad2 = num2str(linhas);
Trad_aux = readtable(nome_arquivo,'Range',strcat(strrad1,strrad2));

for i=1:linhas-11
    Trad_aux.RADIACAO(i,1) = Trad_aux.RADIACAO(i,1)/1000;
end

% Tins_aux é a tabela com header INSOLACAO que contém a insolaão diaria
% medida
strrad1 = 'T11:T';
strrad2 = num2str(linhas);
Tins_aux = readtable(nome_arquivo,'Range',strcat(strrad1,strrad2));

vetData = zeros(1,1);
vetData = Tdata.DATA;

for i=12:linhas
    rad_extra_aux(i-11,1) = rad_extra(i,1);
    ins_max_aux(i-11,1) = insolacao_max(i,1);
end


rowsToDelete = Trad_aux.RADIACAO == 0 | isnan(Trad_aux.RADIACAO) ;
Trad_aux(rowsToDelete,:) = [];
Tins_aux(rowsToDelete,:) = [];
rad_extra_aux(rowsToDelete) = [];
ins_max_aux(rowsToDelete) = [];
vetData(rowsToDelete) = [];


rowsToDelete = Tins_aux.INSOLACAO == 0 | isnan(Tins_aux.INSOLACAO);
rad_extra_aux(rowsToDelete) = [];
ins_max_aux(rowsToDelete) = [];
Trad_aux(rowsToDelete,:) = [];
Tins_aux(rowsToDelete,:) = [];
vetData(rowsToDelete) = [];

radDiv_diasTodos = round(Trad_aux.RADIACAO./rad_extra_aux,2);
insDiv_diasTodos = round(Tins_aux.INSOLACAO./ins_max_aux,2);

radMedida = zeros(1,1);
radMedida = table2array(Trad_aux);

rowsToDelete = radDiv_diasTodos == 0 | isnan(radDiv_diasTodos) | f_isneg(radDiv_diasTodos);
radMedida(rowsToDelete) = [];
rad_extra_aux(rowsToDelete) = [];
radDiv_diasTodos(rowsToDelete) = [];
insDiv_diasTodos(rowsToDelete) = [];
vetData(rowsToDelete) = [];
rowsToDelete = insDiv_diasTodos == 0 | isnan(insDiv_diasTodos) | f_isneg(insDiv_diasTodos);
radMedida(rowsToDelete) = [];
rad_extra_aux(rowsToDelete) = [];
radDiv_diasTodos(rowsToDelete) = [];
insDiv_diasTodos(rowsToDelete) = [];
vetData(rowsToDelete) = [];

