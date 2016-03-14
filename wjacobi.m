
function [unew] = wjacobi(u,f,h,iter)
%An iterative smoother to run omega Jacobi method
%'iter' number of times on initial guess 'u'
%with grid spacing h, and function f
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%Check to see that the grid spacing evenly devides the domain

     if rem(1,h) == 0  


%%Initialize our work variable%%

unew = u;

%%Define vector of indeces for vectorized Jacobi%%
N = length(u);
I = [2:N-1];

%%Run the method "iter" times%%

for k = 1:iter
%%One Jacobi iteration
  unew(I) = (u(I+1)+u(I-1)+h*h*f(I))/3 + u(I)/3;
  unew(1) = (u(2)+h*h*f(1))/3 + u(1)/3;
  unew(N) = (u(N-1)+h*h*f(N))/3 + u(N)/3;

%%Re-initialize for next iteration (or output)%%
  u = unew;

end

%%Display an error for improperly sized grids%%

else
error('Grid spacing must evenly devide domain')
end
