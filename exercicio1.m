function t = exercicio1(func,xl,xu)

% nao alterar: inicio
es = 1;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

n_iter = 0; % contador de iteração
ea = 100; % erro relativo inicial
t = 0; % alterar -> raíz aproximada
t = xl; % estimativa inicial para a raíz (tempo)
t_old = xl; % valor inicial para o t_old (que será o valor da raíz mínima)
fl = func(xl); % função da vazão com o valor da raíz inicial

while (ea >= es) && (n_iter < imax)
    t_old = t; % guarda o ponto médio anterior 
    t = (xl+xu)/2; % calcula o ponto médio
    ft = func(t); % valor da função no ponto médio
    n_iter = n_iter + 1; %aumenta o contador da iteração para +1

    if t ~= 0
        ea = abs((t - t_old) / t) * 100;  % calcula o erro relativo aproximado da iteração
    end

    test = fl * ft; % checagem do sinal do produto da função de xl com a função de xu

    if test < 0
        xu = t; % a raíz está na região da metade inferior da função da vazão
    elseif test > 0 
        xl = t; % a raíz está na região da metade superior da função da vazão
        fl = ft; % atualiza o valor da função para o novo xl
    else
        ea = 0 % raiz exata foi encontrada
    end

    if ea < es || n_iter >= imax
        break; % interrompe o loop se o erro relativo está dentro da tolerância ou a iteração máxima foi alcançada
    end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
