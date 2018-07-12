%% Generalized nets and lattices

%permVec = 1:7;
permVec = [1 3 2 7 6 4 5];
n = numel(permVec) + 1;
m = log2(n);
nPerm = 2.^(0:m);
addTable = zeros(n,n);
for l = 1:m
   pim = permVec(nPerm(l) : nPerm(l+1)-1) + 1;
   [~, pimInv] = sort(pim);
   iRange = 1 : 2^(l-1);
   jRange = 2^(l-1)+1 : 2^l;
   newBlock = pim(addTable(iRange,pimInv) + 1) - 1;
   addTable(iRange,jRange) = newBlock;
   addTable(jRange,iRange) = newBlock';
   minusPimInv1 = find(addTable(pimInv(1),:) == 0,1);
   newBlock = addTable(addTable(pimInv,minusPimInv1) + 1, pimInv);
   addTable(jRange,jRange) = newBlock;
   addTable(jRange,jRange) = newBlock';
end

