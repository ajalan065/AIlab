conncomp = [1 2; 1 3; 2 4; 2 5; 3 6; 3 7];
%view (biograph(conncomp))
nodeIDs = unique(conncomp(:));
nodeIDList = false(1,numel(nodeIDs));
stack = [];
% taking source node 1
currentnode = 1
stack = currentnode
%making target node 5
findnode = 3
flag = 0;
path = [];
while(~isempty(stack))
	stack(1) = [];
	if(nodeIDList(currentnode))
	continue;
end
if(currentnode==findnode)
	flag = 1;
	path = [path,currentnode];
	break;
end;
nodeIDList(currentnode) = true;
path = [path, currentnode];
connectedNodes = conncomp(conncomp(:,1)==currentnode,2);
stack = [ connectedNodes.', stack];
if(numel(stack)~=0)
	currentnode = stack(1);
end
end
if(flag==0)
	s = sprintf('Not Found');
else
	disp(path);
end
