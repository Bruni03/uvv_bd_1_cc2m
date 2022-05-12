   -- funções do pset 2
   
   -- 1
    select avg (salario),numero_departamento
    from funcionario;
    
    -- 2
    select sexo ,avg(salario)
    from funcionario
    where (sexo = M)
    union
    select sexo,avg(salario)
    from funcionario
    where (sexo = F);
    -- 3
    
    select (funcionario.primeiro_nome||''||funcionario.nome_meio||''||funcionario.ultimo_nome)as nome, funcionario.data_nascimento, data_id(year,age(data_nascimento))as idade, funcionario.salario,departamento.nome_departamento
    from departamento
    inner join funcionario on (departamento.numero_departamento = funcionario.numero_departamento), data_id(year,age(data_nascimento))as idade
    
    -- 4
    select (funcionario.primeiro_nome||''||funcionario.nome_meio||''||funcionario.ultimo_nome)as nome, data_id(year,age(data_nascimento))as idade,salario
    case when salario < 35000 then salario *1,05 else salario*1,15;
   
    -- 5
    select (funcionario.primeiro_nome||''||funcionario.nome_meio||''||funcionario.ultimo_nome)as nome,funcionario.cpf = departamento.cpf_gerente,salario
    from departamento
    order by
    nome asc,
    salario desc;
    
    -- 7
    select(funcionario.primeiro_nome||''||funcionario.nome_meio||''||funcionario.ultimo_nome)as nome,departamento.nome_departamento as departamento,funcionario.salario
    from funcionario, departamento
    where funcionario.cpf not in (select dependente.cpf_funcionario from dependentes) and (departamento.numero_departamento = funcionario.numero_departamento);
    
    -- 8
    select departamento.nome_departamento as departamento,projeto.nome_projeto as projeto,(funcionario.primeiro_nome||''||funcionario.nome_meio||''||funcionario.ultimo_nome)as nome,trabalha_em.horas
    from funcionario
    inner join trabalha_em on (funcionario.cpf = trabalha_em.cpf_funcionario)
    inner join projeto on (trabalha.em.numero_projeto =projeto.numero_projeto)
    inner join departamento on (projeto.numero_departamento = departamento.numero_departamento)
    order by departamento.nome_departamento asc,projeto.nome_projeto asc;
    
    
    
    
    
    