function factor = cnnct ( a, b, C)
factor = 0
for i = 1:size(C,2)
    if C(a,i) == b;
        factor = 1;
        break
    end
end