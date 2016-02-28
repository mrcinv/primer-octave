# Primer domače naloge napisane v Octave

[![Build Status](https://travis-ci.org/mrcinv/primer-octave.svg?branch=master)](https://travis-ci.org/mrcinv/primer-octave)

## Kakšna naj bo rešitev naloge

Rešitev ni zgolj koda oziroma program, ki reši problem. Poleg kode ima vsak dober projekt še vsaj tri stvari
 * [Opis rešitve](#rešitev)
 * [dokumentacijo](#dokumentacija)
 * [teste](#testi)

# Primer: Presečišče dveh premic

**Naloga**: Napiši program, ki poišče presečišče dve premic v ravnini.

## Rešitev
Opis rešitve naj vsebuje matematične izpeljave in račune, ki so vas pripeljale do rešitve.
Poleg tega navedite, katere algoritme ste uporabili in obrazložite zakaj. Lahko
je natipkan v obliki datoteke README, ali pa čitljivo na roke napisan in
poskeniran dokument ([primer rešitve](primer_resitve.pdf)).

## Dokumentacija

Osnovna dokumentacija v `Octave` je komentar takoj pred deklaracijo funkcije. Če v konzoli napišemo `help funkcija`, se izpišejo vse zakomentirane vrstice pred vrstiso s ključno besedo `function`. Komentar naj vsebuje

* primer klica funkcije
* kratek opis, kaj funkcija dejansko dela
* opis vhodnih argumentov in vrednosti, ki jih funkcija vrne

Pri pisanju dokumentacije imejte v mislih nekoga, ki bo za vami uporabljal vašo funkcijo. V večini primerov boste to kar vi sami čez čas, ko boste že pozabili, kaj ste napisali. Ali si želite, da bo vaša oseba v prihodnosti, preklinjala svojo preteklo različico?

Primer glave z dokumentacijo za funkcijo `presecisce`

```` octave
% Funkcija presecisce(p,q) izračuna presečišče dveh premic p in q
% podanih z vektorjem koeficientov [a,b,c] implicitne enačbe
%
% ax + by + c = 0
%
% Vhodni podatki:
% p,q ... 1x3 vektor koeficientov enačbe premica
% Rezultat:
% T ... 2x1 vektor s koordinatami presečišča
%
% Autor: Martin Vuk <martin.vuk@fri.uni-lj.si>
function T=presecisce(p,q)
````

## Testi
Brez testov se bomo težko prepričali, da naš program dela pravilno. Pa še hrošče nam pomagajo poloviti, preden jih vidijo asistenti. Teste je za matematične naloge super lahko pisati.

V `octave` lahko teste dodamo kar na konec datoteke s funkcijo. K testom spadajo vse vrstice, ki se začnejo s `%!`.  Za podrobnosti glej [GNU Octave: Test Functions](https://www.gnu.org/software/octave/doc/interpreter/Test-Functions.html).

```` octave
% testi
%!test presecisce([0,1,1],[1,0,1]) == -[1;1];
% enakovredno
%!assert (presecisce([0,1,1],[1,0,1]), -[1;1])

% zaradi zaokrožitvenih napak dve števili tipa float
% skoraj nikoli nista enaki, zato moramo vrednosti primerjati z neko toleranco
%!test abs(presecisce([2,1,1],[1,2,1])-(-[1;1]/3)) < eps;
% lahko uporabimo tudi assert s tretjim argumentom
%!assert (presecisce([1,2,1],[2,1,1]), -[1;1]/3, eps)

% test na random podatkih
%!test
%! p = rand(1,3); q = rand(1,3);
%! T = presecisce(p,q);
%! assert (abs(p*[T;1]), 0, eps) % T leži na p
%! assert (abs(q*[T;1]), 0, eps) % T leži na q

% če sta premici vzporedni, pričakujemo napako
%!error presecisce([1,1,1],[1,1,2])
````

Teste poženemo z ukazom `test <ime_funkcije>`.

````
>> test presecisce
PASSES 6 out of 6 tests
>>
````
