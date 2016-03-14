function u = linprolong(u2h)
%Prolongation operator to perform linear interpolation
%to grid function with half grid spacing
%(double number of interior points)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = length(u2h)-2; %Number of interior points on coarse grid
N = (n+1)*2 - 1;  %Number of interior points on fine grid


u = zeros(N+2,1);  %%Initialize fine grid variable
u(1) = u2h(1);
u(2) = u2h(1)/2;
u(N+1) = u2h(n+2)/2;
u(N+2) = u2h(n+2);

  for i = 2:n+1  %Loop through entries of u2h

  I = 2*i-1;  %Compute corresponding index for 'u'

  u(I-1) = u(I-1) + u2h(i)/2; %%Fill u2h with full weighted numbers
  u(I) = u(I) + u2h(i);
  u(I+1) = u(I+1) + u2h(i)/2;

  end
