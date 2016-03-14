function u = linprolong(u2h)
%Prolongation operator to perform linear interpolation
%to grid function with half grid spacing
%(double number of interior points)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = length(u2h); %Number of interior points on coarse grid
N = (n+1)*2 - 1; %Number of interior points on fine grid

u = zeros(N,1);  %%Initialize fine grid variable
u(1) = u2h(1)/2;
u(2) = u2h(1);
u(N) = u2h(n)/2;

  for i = 2:n  %Loop through entries of u2h

  I = 2*i-1;  %Compute corresponding index for 'u'
  
  u(I-1) = u(I-1); %+ u2h(i)/2; %%Fill u2h with full weighted numbers
  u(I) = u(I-1)/2 + u2h(i)/2;
  u(I+1) = u2h(i);
  end
