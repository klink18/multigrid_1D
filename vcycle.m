function u = vcycle(guess,f,h)
%Perform a V-cycle of multi-grid
%recrusively

n = length(guess);    %Number of interior grid points (nx1 column vector)

u = zeros(n,1);         %Initialized u (nx1 column vector)

if n == 1
u(1,1) =  f(1,1)*(h^2/2); %Direct solve when multigrid has made it to the coarsest grid

else
    
    %Accounts for column vs. row vectors
    if size(guess,1)==1
        guess=guess';
    end
    
    if size(f,1)==1
        f=f';
    end
    
  smoothed = wjacobi(guess,f,h,2); %(n x 1 column vector inputs; n x 1 column vector outputs)
  W = smoothed;
 
  I = [2:n-1];
  L = zeros(size(W));
  L(1) = h^(-2)*(-W(2)+2*W(1));
  L(I) = h^(-2)*(-W(I+1)-W(I-1)+2*W(I));
  L(n) = h^(-2)*(-W(n-1)+2*W(n));
  residual = f - L; % n x 1 column vector
  
  res2h = restrict(residual); %outputs (n+1)/2-1 x 1 column vector
  erguess = zeros(size(res2h));

    %Accounts for column vs. row vectors
    if size(erguess,1)==1
        erguess=erguess';
    end
    
    if size(res2h,1)==1
        res2h=res2h';
    end
    
  e2h = vcycle(erguess,res2h,h*2);
  error = linprolong(e2h);
  
  corrected = smoothed + error;
  
   if size(corrected,1)==1
        corrected=corrected';
    end
    
    if size(f,1)==1
        f=f';
    end
  u = wjacobi(corrected,f,h,1);

end

