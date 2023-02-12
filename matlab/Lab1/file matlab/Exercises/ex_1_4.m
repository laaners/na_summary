% Code A
x = 0;
while (x ~= 1)
	x = x + 1/16
end

% Code B
x = 0;
k = 1;
format long
while (x ~= 1)
    k
	x = x + 0.1
    if k==10 || k==11
        x-1
    end
    k=k+1;
    if k==15
        break
    end
end
