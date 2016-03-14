% This code performs two different tests to ensure 
%                   'multigrid.m'
%                   'linprolong.m'
%                   'restrict.m'
%                   'vcylce.m'
%                   'wJacobi.m'
% are working properly
close all, clear all

%Set-Up of Spatial Step and 1-D Domain = [0,1]
h=(1/(2^(5)));
x=[0:h:1];
xInner=x(2:end-1);

% %Test - 1
% %A quandratic with homogeneous Dirichlet boundary conditions
% 
%True Solution
phi = @(x) -(x-.5).^2 + .25*ones(size(x));
utrue1=phi(xInner);

%Guess
guess1 = sin(2*pi*9*xInner);
%guess1 = zeros(size(xInner));
%guess1 = rand(size(xInner));

%Right Hand Side
f1=2*ones(size(guess1));

%Call Multigrid
[u1,it1] = multigrid(guess1,f1,h,utrue1);

uFinal1=[0 u1' 0];

%Plot Results
figure(1)
plot(x,[0 guess1 0],'m','LineWidth',2)
T=legend('Initial Guess');
xlim([0,1])
xlabel('$x$','interpreter','latex','FontSize',18)
set(T,'Location','Best')
%ylim([0, 3])
title('Test 2', 'interpreter','latex');
set(gca,'Fontsize',14)
hold off
string1=strcat('figTest2InitialGuess',num2str(h),num2str(it1));
name1=strcat('\Users\klink\Documents\GradSchool\SPRING2016\NumPDE\',string1,'.eps');
saveas(gcf,name1,'epsc');

figure(2)
plot(x,uFinal1,'b',x,phi(x),'--r','Linewidth',2)
T=legend('Numerical Solution','True Solution');
xlim([0,1])
xlabel('$x$','interpreter','latex','FontSize',18)
set(T,'Location','Best')
%ylim([0, 3])
title('Test 2 - Results', 'interpreter','latex');
set(gca,'Fontsize',14)
hold off
string2=strcat('figTest2Results',num2str(h),num2str(it1));
name2=strcat('\Users\klink\Documents\GradSchool\SPRING2016\NumPDE\',string2,'.eps');
saveas(gcf,name2,'epsc');

% %Test - 2
% %Zero right-hand side and homogeneous Dirichlet boundary conditions
% 
% %Set-Up of Spatial Step and 1-D Domain = [0,1]
% % h=(1/32);
% % x=[0:h:1];
% % xInner=x(2:end-1);
% 
% %True Solution = zero
% utrue=zeros(size(xInner));
% 
% %Guess
% 
% %guess2 = ()(size(xInner));
% %guess2 = (1e-10)*ones(size(xInner));
% guess2 = sin(2*pi*9*xInner);
% %guess2 = rand(size(xInner));
% 
% %Right Hand Side
% f2=zeros(size(guess2));
% 
% %Call Multigrid
% [u2,it2] = multigrid(guess2,f2,h,utrue);
% 
% uFinal2=[0 u2' 0];
% 
% %Plot Results
% 
% figure(4)
% plot(x,[0 guess2 0],'r','LineWidth',2)
% T=legend('Initial Guess');
% xlim([0,1])
% xlabel('$x$','interpreter','latex','FontSize',18)
% set(T,'Location','Best')
% %ylim([0, 3])
% title('Test 1', 'interpreter','latex');
% set(gca,'Fontsize',14)
% hold off
% string4=strcat('figTest1InitialGuess',num2str(h),num2str(it2));
% name4=strcat('\Users\klink\Documents\GradSchool\SPRING2016\NumPDE\',string4,'.eps');
% saveas(gcf,name4,'epsc');
% 
% figure(5)
% plot(x,uFinal2,'-xb',x,zeros(size(x)),'--r','Linewidth',2)
% T=legend('Numerical Solution','True Solution');
% xlim([0,1])
% xlabel('$x$','interpreter','latex','FontSize',18)
% set(T,'Location','Best')
% %ylim([0, 3])
% title('Test 1- Results', 'interpreter','latex');
% set(gca,'Fontsize',14)
% hold off
% string5=strcat('figTest1Results',num2str(h),num2str(it2));
% name5=strcat('\Users\klink\Documents\GradSchool\SPRING2016\NumPDE\',string5,'.eps');
% saveas(gcf,name5,'epsc');

ITERS=[it1]';
