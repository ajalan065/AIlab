function [path,flag] = bestfirst(v,nodeIDList,path,conncomp,target,flag,adj_mat,adj_mat1)
if(flag == 1)
	return
end
if (~nodeIDList(v))
	nodeIDList(v) = true;
	path = [path,v];
	if(v == target)
	flag = 1;
	return;
end
connectedNodes = conncomp(conncomp(:,1) == v, 2);
for i =1:numel(connectedNodes)
	for j =i+1:numel(connectedNodes)
		c = adj_mat(v,connectedNodes(i))+adj_mat1(v,connectedNodes(i));
		d = adj_mat(v,connectedNodes(j))+adj_mat1(v,connectedNodes(j));
		if ( c > d)
			temp = connectedNodes(i);
			connectedNodes(i) = connectedNodes(j);
			connectedNodes(j) = temp;
		end
	end
end
for idx =1:numel(connectedNodes)
	[path,flag] = bestfirst(connectedNodes(idx),nodeIDList,path,conncomp,target,flag,adj_mat,adj_mat1);
end
end
end
