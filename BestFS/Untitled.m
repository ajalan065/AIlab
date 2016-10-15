clc;
clear all;
close all;
conncomp=[1 2;1 3; 2 4; 2 5; 3 6; 3 7];
adj_mat = [0 2 1 0 0 0 0;
            0 0 0 1 1 0 0;
            0 0 0 0 0 1 1;
            0 0 0 0 0 0 0;
            0 0 0 0 0 0 0;
            0 0 0 0 0 0 0;
            0 0 0 0 0 0 0] ;
        
nodeIDs = unique(conncomp(:)); 
path = [];
nodeIDList = false(1,numel(nodeIDs));
clusterList = {};

counter = 1;

flag = 0;
list = [];

target = 6;
[path,flag] = dfs(1,nodeIDList,path,conncomp,target,flag,adj_mat);

if(flag == 1)
    path
else
    S = sprintf('Not found');
    disp(S);
end