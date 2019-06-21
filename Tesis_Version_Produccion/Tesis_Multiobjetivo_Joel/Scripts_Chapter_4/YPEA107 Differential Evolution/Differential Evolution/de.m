%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA107
% Project Title: Implementation of Differential Evolution (DE) in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

clc;
clear;
close all;
rng(20)

%% Problem Definition

CostFunction=@(x) Sphere(x);    % Cost Function

nVar=2;            % Number of Decision Variables

VarSize=[1 nVar];   % Decision Variables Matrix Size

VarMin=-10;          % Lower Bound of Decision Variables
VarMax= 10;          % Upper Bound of Decision Variables

%% DE Parameters

MaxIt=200;      % Maximum Number of Iterations

nPop=10;        % Population Size

beta_min=0.2;   % Lower Bound of Scaling Factor
beta_max=0.8;   % Upper Bound of Scaling Factor

pCR=1.0;        % Crossover Probability

%%Load grid
x = linspace(VarMin,VarMax); 
y = linspace(VarMin,VarMax);

[X,Y] = meshgrid(x,y);
Z = -X.^2 - Y.^2;

figure
s = contour(X,Y,Z,'ShowText','on');
%% Initialization

empty_individual.Position=[];
empty_individual.Cost=[];

BestSol.Cost=inf;

pop=repmat(empty_individual,nPop,1);
 [X Y] = meshgrid(-10:2 :10, -10:5:10);
 V = [X(:), Y(:)];
for i=1:nPop

    pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
      % pop(i).Position=[V(i,1), V(i,2)]%unifrnd(VarMin,VarMax,VarSize);
     % pop(i).Position=unifrnd(-3,3,VarSize);

     pop(i).Cost=CostFunction(pop(i).Position);
    
    if pop(i).Cost<BestSol.Cost
        BestSol=pop(i);
    end
    
end

BestCost=zeros(MaxIt,1);

%% DE Main Loop

for it=1:MaxIt
    
    for i=1:nPop
       
        x=pop(i).Position;
         
        hold on
        A=randperm(nPop);
        
        A(A==i)=[];
        
        a=A(1);
        b=A(2);
        c=A(3);
        
             % Mutation
        %beta=unifrnd(beta_min,beta_max);
        beta=unifrnd(beta_min, beta_max,VarSize);
        beta= 0.5;
         
        y=pop(a).Position+beta*(pop(b).Position-pop(c).Position);
         for j=1:numel(x)
             rand = unifrnd(0, 1);
            if y(j) <  VarMin
                y(j)=VarMin + rand*(pop(a).Position(j) - VarMin);
            elseif y(j) >  VarMax
                                y(j)=VarMax- rand*(VarMax - pop(a).Position(j));
            end
         end
%                y=pop(a).Position;
%         y = max(y, VarMin);
% 		y = min(y, VarMax);
		
        % Crossover
        z=zeros(size(x));
        j0=randi(2);
        
        for j=1:2
             rand = unifrnd(0, 1);
            if j==j0 || rand<=pCR
                z(j)=y(j);
            else
                z(j)=x(j);
            end
        end
      % z=y;
       plot(z(1), z(2),'.black', 'MarkerSize',5);
        
        NewSol.Position=z;
        NewSol.Cost=CostFunction(NewSol.Position);
        
        %if NewSol.Cost<pop(i).Cost
           % pop(i)=NewSol;
            
            if pop(i).Cost<BestSol.Cost
               BestSol=pop(i);
            end
       % end
    end
    
    % Update Best Cost
    BestCost(it)=BestSol.Cost;
    
    % Show Iteration Information
   % disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
end
xlabel('(c)')
%% Show Results

%figure;
%for i=1:nPop

%end

%plot(BestCost);
%semilogy(BestCost, 'LineWidth', 2);
%xlabel('Iteration');
%ylabel('Best Cost');
%grid on;
