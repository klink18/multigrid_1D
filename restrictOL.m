function u2h = restrict(u)
%Restriction operator to perform full-weighting restriction
%to grid function with double grid spacing
%(half number of interior points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = length(u)-2; %Number of interior points on fine grid
n = (N+1)/2 - 1;  %Number of interior points on coarse grid
u2h = zeros(n+2,1); %%Initialize coarse grid variable
u2h(1) = u(1);
u2h(n+2) = u(N+2);

  for i = 2:n+1  %Loop through entries of u2h

  I = 2*i-1;  %Compute corresponding index for 'u'

  u2h(i) = (u(I-1)+2*u(I)+u(I+1))/4; %%Fill u2h with full weighted numbers

  end
