% Funkcija T = presecisce(p,q)
%
% Izračuna koordinate presečišča T dveh premic p in q,
% ki sta podani s koeficienti a,b,c implicitne enačbe
% 
% ax + by + c = 0
% 
% Autor: Martin Vuk <martin.vuk@fri.uni-lj.si>

function T = presecisce(p,q)
  A = [p(1:2);q(1:2)]; % matrika sistema
  b = -[p(3);q(3)]; % desne strani
  if abs(det(A)) < eps
    error("premici sta vzporedni")
  end
  T = A\b; % reši sistem
endfunction

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
