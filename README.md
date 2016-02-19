# Primer domače naloge napisane v Octave

[![Build Status](https://travis-ci.org/mrcinv/primer-octave.svg?branch=master)](https://travis-ci.org/mrcinv/primer-octave)

## Kakšna naj bo rešitev naloge

Oddana rešitev naj vsebuje več kot zgolj kodo, rezultate in nekaj besed. Rešitev naj bo samostojen dokument, ki naj bo razumljiv tudi, če nikoli nismo videli besedila naloge. Mislite si, da pišete članek za revijo, npr. Presek ali pa Frik.
Nekaj opornih točk, kaj naj vsebuje rešitev:

* Ime in priimek avtorjev, datum, predmet
* Opis problema
* opis in morebitna izpeljava matematičnega modela
* Opis programske kode, katere numerične metode uporabimo, morebitna izpeljava formul
* Rezultati in komentarji rezultatov
* Razdelitev dela v skupini (če gre za skupinsko nalogo)
*  Reference in dejanska koda

Prve tri točke so lahko bolj ali manj povzete iz besedila naloge, vendar ne dobesedno. Besedilo naj bo tekoče in naj ima rep in glavo. Nivo besedila naj bo primeren za vaše kolege. V referencah navedite vse vire, ki ste jih uporabili ali se vam zdijo relevantni (če se vam ne zdi primerno preveč razlagati o neki numerični metodi, navedite vir, kjer lahko bralec zve več o tem).

## Primer: Presečišče dveh premic

**Naloga**: Napiši program, ki poišče presečišče dve premic v ravnini.

## Rešitev

Rešitev ni zgolj koda oziroma program, ki reši problem. Poleg kode ima vsak dober projekt še vsaj dve stvari
 * dokumentacijo
 * teste

## Dokumentacija

Osnovna dokumentacija v `Octave` je komentar takoj za deklaracijo funkcije. Komentar se izpiše, če v konzoli napišemo
`help funkcija`. Komentar naj vsebuje 
* primer klica funkcije
* kratek opis, kaj funkcija dejansko dela
* opis vhodnih argumentov in vrednosti, ki jih funkcija vrne
Imejte v mislih nekoga, ki bo za vami poganjal to funkcijo. V večini primerov boste to kar vi sami čez čas, ko boste že pozabili, kaj ste napisali. Ali si želite, da bo vaša oseba v prihodnosti, preklinjala svojo preteklo različico?

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

K dokumentaciji spada tudi kratek [Opis rešitve problema](Resitev.md) in [navodila za uporabo programa](Tutorial.md).

## Testi
Teste je za matematične naloge super lahko pisati. Brez testov se bomo težko prepričali, da naš program dela pravilno. Pa še hrošče nam pomagajo poloviti, preden jih vidijo asistenti.

V `octave` lahko teste dodamo kar v datoteko s funkcijo v obliki komentarja `%!` ponavadi na koncu datoteke. Za podrobnosti glej [GNU Octave: Test Functions](https://www.gnu.org/software/octave/doc/interpreter/Test-Functions.html).

```` octave
% testi

%!assert (presecisce([0,1,1],[1,0,1]), -[1;1]) % presecisce y-1=0 in x-1=0 je točka T(1,1)
%!assert (presecisce([2,1,1],[1,2,1]), -[1;1]/3, eps) % zaradi zaokroževanja, števila tipa float niso nikoli povsem enaka
%!assert (presecisce([1,2,1],[2,1,1]), -[1;1]/3, eps)

% test na random podatkih
%!test
%! p = rand(1,3); q = rand(1,3);
%! T = presecisce(p,q);
%! assert (abs(p*[T;1]), 0, eps) % T leži na p 
%! assert (abs(q*[T;1]), 0, eps) % T leži na q
````

Teste poženemo z ukazom `test <ime_funkcije>`

````
>> test presecisce
PASSES 5 out of 5 tests
>>
````
