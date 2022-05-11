
select (
    case 
        when pais.pais_id = 1 then pais.pais_sigla
        else pais.pais_nome
    end,
    case 
        when pais.pais_id = 1 then estado.estado_sigla
        else estado.estado_nome
    end
) from pais
    inner join estado on pais.pais_id = estado.estado_pais_id


/*
Recuperar todos os nomes de todos as cidades, 
mostrando o nome da cidade e o nome do estado, 
contudo quando n˜ao for o Brasil, o relat´orio dever´a mostrar
somente o nome da cidade e a sigla do pa´ıs
*/

select 
    cidade.cidade_nome,
    case 
        when pais.pais_id = 1 then estado.estado_sigla
        else pais.pais_sigla
    end
from cidade
    inner join estado on cidade.cidade_estado_id = estado.estado_id
    inner join pais on estado.estado_pais_id = pais.pais_id