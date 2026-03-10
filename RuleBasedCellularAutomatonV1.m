% RULE BASED CELLULAR AUTOMATON - Joseph Claro
%
% This project explores the emergent patterns and chaos that come from simple systems.
% The system starts with a row of values in a one-dimensional array, which evolves at every timestep.
% A two-dimensional array is created as a result, with the Y-axis acting as the time dimension.
%
% The value of each element in the array is either 1 (yellow) or 0 (blue).
% Rules involving 'triplets' of array values determine the next value of the element at triplet's center.
% Every possible triplet is considered - 000, 001, 010, 100, 101, etc.
% Every triplet type has a corresponding output value (1 or 0).
% Changing the output values results in varying system behaviour.
% Visually, rules in action look like "if the value above me and its neighbours look like 111, then I become 0".
% Determining the system's evolution involves looping through these rules and updating values as needed.
% Changing the output values results in different evolution patterns.
% Some interesting outcomes are listed at the bottom of this file.

clf
clc

figure(1)
subplot(1,4,[1 3])

% customisable grid size, around 200x250 recommended for speed/detail
% **ENSURE GRID DIMESIONS DIVISIBLE BY 10**
G = zeros(500,560);

% Some useful initial states to experiment with
randomState             = randi(2,1,width(G))-1;
singleLeftPoint         = [1,zeros(1,width(G)-1)];
singleOffsetLeftPoint   = [zeros(1,width(G)/10),1,zeros(1,9*width(G)/10 -1)];
singleRightPoint        = [zeros(1,width(G)-1),1];
singleOffsetRightPoint  = [zeros(1,9*width(G)/10),1,zeros(1,width(G)/10 -1)];
singleMidPoint          = [zeros(1,width(G)/2),1,zeros(1,width(G)/2 - 1)];
doubleMidPoint          = [zeros(1,width(G)/2 - 1),1,1,zeros(1,width(G)/2 - 1)];
fiftyMidPoints          = [zeros(1,width(G)/2 - 25),ones(1,50),zeros(1,width(G)/2 - 25)];

% Zeroes added to border - allows for rule checks at edges
G = [zeros(height(G),1),G,zeros(height(G),1)];

% Initial state added to grid - feel free to swap out
G(1,:) = [0,singleOffsetLeftPoint,0];

% Array of inputs that determine values in next timestep
ruleArray =    [0,0,0; % 1
                1,0,0; % 2
                0,1,0; % 3
                0,0,1; % 4
                1,1,0; % 5
                1,0,1; % 6
                0,1,1; % 7
                1,1,1];% 8

% Outputs corresponding to ruleArray - try swapping for arrays at bottom of file
          % 1 2 3 4 5 6 7 8
ruleCode = [0,1,0,0,0,0,0,0]';


% c = timestep counter
% i = column index
% j = rule index

c = 1;
while c < height(G)
      for i = 2:(width(G)-1)
          for j = 1:height(ruleArray)
              if     G(c,(i-1):(i+1)) == ruleArray(j,:)
                 G(c+1,i) = ruleCode(j);
              end
          end
      end
      c = c + 1;
end

% Display final automaton evolution
imagesc(G(:,2:(width(G)-1)));
title('Cellular Automaton - Joseph Claro')
ylabel('timestep')
set(gca,'XTick',[])

subplot(1,4,4)

% Create blank rules visual
ruleGrid = 0.3.*ones(27,7);

% Add rule inputs/outputs to visual
for i = 1:8
  ruleGrid(3*i,3:5) = ruleArray(i, 1:3);
  ruleGrid(3*i+1, 4) = ruleCode(i);
end

imagesc(ruleGrid);
set(gca,'XTick',[], 'YTick', [])
title('Rules')




shg

%% NOTABLE OUTCOMES
%% Sierpinski Triangle 45-45    [0,1,0,1,1,0,1,0]
%% Sierpinski Triangle 90-45    [0,1,1,0,0,1,1,0] (singleLeftPoint)
%% Chaotic Triangle Pattern     [0,1,1,1,1,0,0,0]
%% Double Sierpinski Thing      [0,1,1,1,0,0,0,1]
%% 3-in-1                       [1,0,1,1,0,1,0,1]
%% Chaos Striped                [1,0,1,0,0,1,1,0]
%% Refraction                   [1,0,1,1,0,1,1,0] (singleLeftPoint)
%% Chaos Split-Off              [0,1,1,0,1,1,1,0] (singleLeftPoint)
