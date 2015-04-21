% Lucas Ferreira da Silva

% === Desvendando um mistério em Prolog ===

% === vitima ===

vitima(anita).

% === onde estavam os suspeitos ===

%segunda

segunda(pedro , santa_maria).
segunda(caren , porto_alegre).
segunda(henrique , apartamento).
segunda(bia , apartamento).
segunda(adriano , apartamento).
segunda(alice , apartamento).
segunda(bernardo , santa_maria).
segunda(maria , apartamneto).

%terca

terca(pedro , santa_maria).
terca(caren , porto_alegre).
terca(henrique , porto_alegre).
terca(bia , porto_alegre).
terca(adriano , apartamento).
terca(alice , porto_alegre).
terca(bernardo , santa_maria).
terca(maria , santa_maria).

%quarta

quarta(pedro , porto_alegre).
quarta(caren , porto_alegre).
quarta(henrique , apartamento).
quarta(bia , porto_alegre).
quarta(adriano , santa_maria).
quarta(alice , porto_alegre).
quarta(bernardo , porto_alegre).
quarta(maria , santa_maria).

%quinta

quinta(pedro , santa_maria).
quinta(caren , santa_maria).
quinta(henrique , apartamento).
quinta(bia , santa_maria).
quinta(adriano, apartamento).
quinta(alice , apartamento).
quinta(bernardo , santa_maria).
quinta(maria , santa_maria).

%sexta

sexta(pedro , apartamento).
sexta(caren , apartamento).
sexta(henrique , apartamento).
sexta(bia , apartamento).
sexta(adriano , apartamento).
sexta(alice , apartamento).
sexta(bernardo , apartamento).
sexta(maria , apartamneto).

% === Insanos ===

insano(adriano).
insano(maria).

% === Pobres ===

pobre(bia).
pobre(pedro).
pobre(maria).
pobre(bernardo).

% === Ricos ===

rico(caren).
rico(alice).
rico(henrique).
rico(adriano).

% == relacionamentos ===

relacionamento(anita , bernardo).
relacionamento(bernardo , anita).
relacionamento(bernardo , caren).
relacionamento(caren , bernardo).
relacionamento(anita , pedro).
relacionamento(pedro , anita).
relacionamento(pedro , alice).
relacionamento(alice , pedro).
relacionamento(alice , henrique).
relacionamento(henrique , alice).
relacionamento(henrique , maria).
relacionamento(maria , henrique).
relacionamento(maria , adriano).
relacionamento(adriano , maria).
relacionamento(adriano , caren).
relacionamento(caren , adriano).

% === Quem estava na cena do crime ===

cena_do_crime(X) :- quinta(X , apartamento) ; sexta(X , apartamento).

% === Roubos ===

roubou_arma(X) :- quinta(X , porto_alegre) ; quarta(X , santa_maria) ; quarta(X , apartamento) ; quinta(X , apartamento).
roubou_chave(X) :- segunda(X , santa_maria) ; terca(X , porto_alegre).

% === Acesso ===

acesso(X) :- roubou_arma(X) , roubou_chave(X) , cena_do_crime(X).

% === Motivos ===

ciumes(X,Y) :- relacionamento(X , A) , relacionamento(Y , A).

motivo(X) :- ciumes(X , anita) ; pobre(X) ; insano(X).

% === Assassino ===

assassino(X) :- motivo(X) , acesso(X).
