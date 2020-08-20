% Calcula H/Ho e n/N e remove os que forem 0, para todos os meses durante
% todo o periodo analisado

% Variaveis obtidas -> radDiv_mediaMensal, insDiv_mediaMensal

radDiv_mediaMensal = Trad.MEDIA_RAD./rad_extra_media;
insDiv_mediaMensal = Tins.MEDIA_INS./ins_max_media;

rowsToDelete = radDiv_mediaMensal == 0 | isnan(radDiv_mediaMensal);
radDiv_mediaMensal(rowsToDelete) = [];
insDiv_mediaMensal(rowsToDelete) = [];

rowsToDelete = insDiv_mediaMensal == 0 | isnan(insDiv_mediaMensal);
radDiv_mediaMensal(rowsToDelete) = [];
insDiv_mediaMensal(rowsToDelete) = [];