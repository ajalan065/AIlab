function [path,flag] = dfs(v,nodeIDList,path,conncomp,target,flag,adj_mat)
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
                if adj_mat(v,connectedNodes(i)) > adj_mat(v,connectedNodes(j))
                    temp = connectedNodes(i);
                    connectedNodes(i) = connectedNodes(j);
                    connectedNodes(j) = temp;
                end
            end
         end
         for idx =1:numel(connectedNodes)
             [path,flag] = dfs(connectedNodes(idx),nodeIDList,path,conncomp,target,flag,adj_mat);
         end
     end
end
