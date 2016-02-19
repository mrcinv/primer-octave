% Izračuna presečišče dveh premic p in q
% podanih s koeficienti a,b,c implicitne enačbe
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

%!assert (presecisce([0,1,1],[1,0,1]), -[1;1])
%!assert (presecisce([2,1,1],[1,2,1]), -[1;1]/3, eps)
%!assert (presecisce([1,2,1],[2,1,1]), -[1;1]/3, eps)
% test na random podatkih

%!test
%! p = rand(1,3); q = rand(1,3);
%! T = presecisce(p,q);
%! assert (abs(p*[T;1]), 0, eps) % T leži na p 
%! assert (abs(q*[T;1]), 0, eps) % T leži na q

% če sta premici vzporedni, pričakujemo napako
%!error presecisce([1,1,1],[1,1,2]) 

%!demo
%! disp("Presečišče premice y = x+1 in y = -x-1")
%! p = [-1 1 -1];
%! q = [1 1 1];
%! T = presecisce(p,q);
%! printf("Presečišče je točka T(%d,%d)\n", T)
%! x = T(1)+[-1,1];
%! plot(x,x+1,x,-x-1)
%! hold on
%! plot(T(1),T(2),'o')