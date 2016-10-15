clc;
clear all;
close all;
conncomp=[1 2;1 3; 2 4; 2 5; 3 6; 3 7];
adj_mat = [0 1 1 0 0 0 0;
	0 0 0 2 2 0 0;
	0 0 0 0 0 2 2;
	0 0 0 0 0 0 0;
	0 0 0 0 0 0 0;
	0 0 0 0 0 0 0;
	0 0 0 0 0 0 0] ;

adj_mat1= [0 4 2 0 0 0 0;
	0 0 0 3 3 0 0;
	0 0 0 0 0 2 1;
	0 0 0 0 0 0 0;
	0 0 0 0 0 0 0;
	0 0 0 0 0 0 0;
	0 0 0 0 0 0 0] ;

nodeIDs = unique(conncomp(:));
path = [];
nodeIDList = false(1,numel(nodeIDs));
flag = 0;
target = input('Enter destination: ');
[path,flag] =
bestfirst(1,nodeIDList,path,conncomp,target,flag,adj_mat,adj_mat1);

if(flag == 1)
	path
else
	S = sprintf('Not found');
	disp(S);
end
