function [u,it] = multigrid(guess,f,h,utrue)
%%Function to use multigrid solver to numerically
%%solve poisson equation for 'laplace u' equals f
%%on the unit grid, with mesh spacing 'h' and 
%%initial data 'guess' 

initialErr=max(abs(utrue-guess));
%%Set tolerance for stopping criteria
tol = (initialErr)/(1e5);%h^2 / 100;

%%Initialize error large to make sure loop runs
er = 1e1;

%%Initialize our iterative solution
u = guess;

it = 0;
tic

%%Run v-cycles until error is below tolerance
while er > tol

  %%Compute next iterate using a v-cycle
  unew = vcycle(u,f,h);
  
  %% Figure documents the progression of each V-cycle
  figure(99)
  plot([0:h:1],[0 unew' 0],'LineWidth',2)
  hold on
  
  
  %%Calculate estimated error as difference between
  %%successive iterates
  if size(u,1)==1
      u=u';
  end
  if size(unew,1)==1
      unew=unew';
  end
  Error = u - unew;
  
  %Error calculations
  %er = sum(abs(h*Error));  %1-norm
  er = max(abs(Error)); %max-norm

  %%Update iteration count
  it = it+1;
  
  %%Update our working variable
  u = unew;
end  
%Plot specifications for Figure(99)
plot([0:h:1],[0 guess 0],'m','LineWidth',2)
plot([0:h:1],zeros(size([0:h:1])),'--k','LineWidth',1)
hold off
xlabel('$x$','interpreter','latex','FontSize',18)
title('Test 2', 'interpreter','latex','FontSize',18);
set(gca,'Fontsize',14)
string99=strcat('figTest2Progress32');
name99=strcat('\Users\klink\Documents\GradSchool\SPRING2016\NumPDE\',string99,'.eps');
saveas(gcf,name99,'epsc');

%%Print time & iterations to convergence
toc
%it
