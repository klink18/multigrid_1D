function u2h = restrict(u)
%Restriction operator to perform full-weighting restriction
%to grid function with double grid spacing
%(half number of interior points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = length(u); %Number of interior points on fine grid
n = (N+1)/2 - 1; %Number of interior points on coarse grid
u2h = zeros(n,1); %%Initialize coarse grid variable

  for i = 1:n  %Loop through entries of u2h

  I = 2*i-1;  %Compute corresponding index for 'u'

  u2h(i) = (u(I)+2*u(I+1)+u(I+2))/4; %%Fill u2h with full weighted numbers

  end
