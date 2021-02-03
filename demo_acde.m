%% DEMO: Evaluation of clustering solutions generated by ACDE algorithm 
% ------------------------------------------------------------------------
% The Cluster Validity Index Tooolbox (CVIT) for automatic determination 
% of clusters from clustering solution contains more than 70 functions (m-files)
% This toolbox was developed with MATLAB R2014a.
%
% Developed by
%   Adan Jose-Garcia (adan.jose@cinvestav.mx)
%   Wilfrido Gomez Flores (wgomez@cinvestav.mx)
%
% Please, cite the following paper where this toolbox was introduced:
%
%   [PENDING]...
%
%
% IMPORTANT: First run "RUN_ME_FIRST.m" file to add this toolbox to search path.
% ------------------------------------------------------------------------
clc; clear all; close all;

addpath([pwd '/datasets']);
addpath([pwd '/proximity']);
addpath([pwd '/cvi']);
addpath([pwd '/clustering']);

% List of available cluster validity indices (CVIs)
CVInames = {'xb','ch','sf','pbm','cs','gd31','gd41','gd51','gd33','gd43',...
            'gd53','db2','db','cop','sil','dunn','sv','sym','sdunn','sdb',...
            'sdbw','cind'};

% List of available distances
Distnames = {'euc','neuc','cos','pcorr','scorr','lap'};
   
% List of datasets provided
DSnames = {'Data_4_3','Data_5_2','Moon', 'Iris'};

%%-------------------------------------------------------------------------
%% Parameters related to the automatic clustering problem
D = load('Data_4_3');
X = D.data(:,1:end-1);

Kmax    = 10;               % Maximum number of clusters
NP      = 10*size(X,2);     % Population size
Gmax    = 100;              % Number of generations
CVI     = 'ch';             % CVI name
Dist    = 'euc';            % Distance funtion
% ------------------------------------------------------------------------
%% Run the ACDE algorithm
[Yb,Pb,bFit] = acde(X, Kmax, NP, Gmax, CVI, Dist);

%% Exeternal evaluation of the resulting clustering solution
% plotclusters(X,T,Yb,Pb);    
% ARI = pairwiseindex(T,Yb);  % The adjusted rand index


