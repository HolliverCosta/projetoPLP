:- include('Vacina.pl').
:- include('Paciente.pl').
:- include('Vacinacao.pl').
:- include('Persistencia.pl').
:- style_check(-singleton).
:- style_check(-discontiguous).
:- initialization(main).
:- style_check(-singleton).
:- style_check(-discontiguous).

main:-
    menuPrincipal(0),
    halt.

menuPrincipal(0):-
    tty_clear,
    write('               
                          Sistema de
                           Controle
               ___        de Vacinas
        ___    | |___________________________
        | |____| |                           |___
        | |____| |       |       |       |   |___|------------
        |_|    | |___|___|___|___|___|___|___|
               |_|'), nl, nl,
    write('Informe qual controle deseja acessar:'),nl,
    write('1. Controle de Vacinas'),nl,
    write('2. Controle de Pacientes'),nl,
    write('3. Controle de Vacinações'),nl,
    readNumber(Numero),
    menuPrincipal(Numero).

menuPrincipal(1):-
    tty_clear,
    menuVacinas(-1).

menuPrincipal(2):-
    tty_clear,
    menuPacientes(-1).

menuPrincipal(3) :-
    tty_clear,
    menuVacinacoes(-1), nl.

menuVacinas(-1):-
    tty_clear,
    write('Menu das Vacinas'), nl,
    write('1. Cadastrar Vacina'), nl,
    write('2. Listar vacinas em falta'), nl,
    write('3. Listar vacinas em estoque'), nl,
    write('4. Listar todas as vacinas do sistema'), nl,
    write('5. Listar vacinas por atributo'), nl,
    write('6. Doses disponiveis para aplicação'), nl,
    write('7. Atualizar Vacina'),nl,
    write('0. Voltar para o menu principal'), nl,
    readNumber(Numero),
    menuVacinas(Numero).

menuVacinas(0) :-
    menuPrincipal(0).

menuVacinas(1):-
    tty_clear,
    listaVacinas(ListaVacinas),
    write('Cadastrando uma vacina'),nl,
    write('Insina o nome da vacina: '),
    readString(Nome),
    write('Insira a data de fabricação da vacina: '),
    readString(DataFabricacao),
    write('Insira a data de validade da vacina: '),
    readString(Validade),
    write('Insira o laboratório que forneceu a vacina: '),
    readString(Laboratorio),
    write('Insira a quantidade de vacinas fornecidas: '),
    readNumber(Quantidade),
    write('Insira a quantidade de doses necessarias da vacina: '),
    readNumber(QuantidadeDoses),
    write('Insira a doença associada: '),
    readString(Doenca),
    write('Insira a porcentagem de eficiência da vacina: '),
    readNumber(Eficiencia),
    write('Insira o selo de aprovação da vacina: '),
    readString(Selo),
    write('Insira o país de origem da vacina: '),
    readString(Pais),
    constroiVacina(Nome,DataFabricacao,Validade,Laboratorio,Quantidade,QuantidadeDoses,Doenca,Eficiencia,Selo,Pais,Vacina),
    salvaListaVacinas([Vacina]),
    write('Vacina cadastrada!'), nl,  
    write('Pressione ENTER para continuar.'),
    readString(_),
    menuVacinas(-1).

menuVacinas(2) :-
    tty_clear,
    write('Vacinas em falta:'), nl,
    % LISTAR VACINAS EM FALTA AQUI.,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuVacinas(3) :-
    tty_clear,
    write('Vacinas em estoque:'), nl,
    % LISTAR VACINAS EM ESTOQUE AQUI.,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuVacinas(4) :-
    tty_clear,
    write('Todas as vacinas cadastradas:'), nl,
    % LISTAR TODAS AS VACINAS AQUI.
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuVacinas(5) :-
    tty_clear,
    write('Listar vacinas por:'), nl,
    write('1. Enfermidade (doença)'), nl,
    write('2. Laboratório'), nl,
    write('3. País de origem'), nl,
    readNumber(Numero),
    menuListaVacinas(Numero).

menuVacinas(6) :-
    tty_clear,
    write('Nome da vacina:'), nl,
    readString(NomeVacina),
    write('Quantidade de doses disponíveis para aplicação:'), nl,
    % EXIBIR QUANTIDADE DE DOSES DISPONÍVEIS AQUI.
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuVacinas(7) :-
    tty_clear,
    write('Atualizando vacina'), nl, nl,
    write('Insira o nome da vacina:'), nl,
    readString(Vacina),
    menuAtualizaVacina(-1).

menuAtualizaVacina(-1) :-
    tty_clear,
    write('Escolha qual atributo da vacina deseja alterar:'), nl, nl,
    write('1. Alterar a data de fabricação'),nl,
    write('2. Atualizar a data de validade'),nl,
    write('3. Atualizar o laboratório'),nl,
    write('4. Atualizar o estoque'),nl,
    write('5. Atualizar a quantidade de doses necessárias'),nl,
    write('6. Atualizar a enfermidade'),nl ,
    write('7. Atualizar a taxa de efuciência'),nl,
    write('8. Atualizar o selo de aprovação'),nl,
    write('9. Atualizar o país de origem'),nl,nl,
    readNumber(Numero),
    write('Insira o novo valor:'), nl,
    readString(NovoValor),
    % ATUALIZAR VACINA AQUI,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuListaVacinas(1) :-
    tty_clear,
    write('Insira o nome da enfermidade (doença):'), nl,
    readString(Enfermidade),
    % LISTAR VACINAS POR ENFERMIDADE AQUI.
    tty_clear,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuListaVacinas(2) :-
    tty_clear,
    write('Insira o nome do laboratório:'), nl,
    readString(Laboratorio),
    % LISTAR VACINAS POR LABORATÓRIO AQUI.
    tty_clear,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

menuListaVacinas(3) :-
    tty_clear,
    write('Insira o país de origem:'), nl,
    readString(Pais),
    % LISTAR VACINAS POR PAÍS DE ORIGEM AQUI.
    tty_clear,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinas(-1).

salvaVacina(Vacina):-
    retract(listaVacinas(Lista)),
    append(Lista,[Vacina],NovaLista),
    assert(listaVacinas(NovaLista)).

menuPacientes(-1) :-
    tty_clear,
    write('Menu dos Pacientes'), nl,nl,
    write('1. Cadastrar paciente'), nl,
    write('2. Atualizar paciente'), nl,
    write('3. Listar pacientes'), nl,
    write('4. Ver situação'), nl,
    write('0. Voltar ao menu principal'), nl,
    readNumber(Numero),
    menuPacientes(Numero).

menuPacientes(0) :-
    menuPrincipal(0).

menuPacientes(1) :-
    tty_clear,
    write('Cadastrando um paciente'), nl,
    write('Insira o nome do paciente:'), nl,
    readString(Nome),
    write('Insira o sexo:'), nl,
    readString(Sexo),
    write('Insira o CPF:'), nl,
    readString(CPF),
    write('Insira o endereço:'), nl,
    readString(Endereco),
    write('Insira a idade:'), nl,
    readNumber(Idade),
    write('Insira o telefone:'), nl,
    readNumber(Telefone),
    % CADASTRAR PACIENTE AQUI,
    write('Paciente cadastrado!'), nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuPacientes(-1).

menuPacientes(2) :-
    tty_clear,
    write('Alterando um paciente'), nl,
    write('1. Alterar o nome'), nl,
    write('2. Alterar o sexo'), nl,
    write('3. Alterar o telefone'), nl,
    write('4. Alterar o endereco'), nl,
    write('5. Alterar a idade'), nl,
    readString(Opcao),
    write('Insira o novo valor:'), nl,
    readString(Valor),
    % ATUALIZAR PACIENTE AQUI
    menuPacientes(-1).

menuPacientes(3) :-
    tty_clear,
    write('Pacientes cadastrados:'), nl,
    % LISTAR PACIENTES AQUI
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuPacientes(-1).

menuPacientes(4) :-
    tty_clear,
    write('Insira o CPF do paciente o qual deseja ver a situação:'),
    readString(CPF),
    % EXIBIR SITUAÇÃO DO PACIENTE AQUI.
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuPacientes(-1).

menuVacinacoes(-1) :-
    tty_clear,
    write('Menu de vacinações'), nl, nl,
    write('1. Agendar vacinação'), nl,
    write('2. Listar pacientes a serem vacinados por uma determinada vacina'), nl,
    write('3. Calcular projeção de conclusão de uma vacinação'), nl,
    write('0. Voltar ao menu principal'), nl,
    readNumber(Numero),
    menuVacinacoes(Numero).

menuVacinacoes(0) :-
    menuPrincipal(0).

menuVacinacoes(1) :-
    tty_clear,
    write('Insira o nome da vacina:'), nl,
    readString(NomeVacina),
    write('Insira o local:'), nl,
    readString(Local),
    write('Insira a data da primeira dose:'), nl,
    readString(DataPrimeiraDose),
    write('Insira a data da segunda dose (caso necessário):'), nl,
    readString(DataSegundaDose),
    write('Insira o horário de início:'), nl,
    readString(Horario),
    write('Insira o horário de término:'), nl,
    readString(HorarioTermino),
    write('Informe a idade mínima:'),nl,
    readNumber(IdadeMinima),
    % AGENDAR VACINAÇÃO AQUI.,
    write('Vacinação agendada!'), nl,
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinacoes(-1).

menuVacinacoes(2) :-
    tty_clear,
    write('Nome da vacina:'), nl,
    readString(NomeVacina),
    % LISTAR PACIENTES QUE VAO SER VACINADOS AQUI
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinacoes(-1).

menuVacinacoes(3) :-
    tty_clear,
    % NÃO ENTENDI MUITO BEM O QUE FAZ AQUI
    % MAS TEM A VER COM PROJEÇAO DA VACINAÇÃO
    write('Pressione ENTER para continuar.'), nl,
    readString(_),
    menuVacinacoes(-1).

carregaVacinas():-
    iniciaVacinas(ListaVacinas),
    retract(listaVacinas(Lista)),
    append(Lista,ListaVacinas,NovaLista),
    assertz(listaVacinas(NovaLista)).

readString(String):- read_line_to_codes(user_input, E), atom_string(E,String).
readNumber(Number):- read_line_to_codes(user_input, E), atom_string(E,X), atom_number(X,Number).
