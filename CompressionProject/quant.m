function z = quant(A,Q,size)

k=5;
n = size;
while (n >= size/(2^4))
        z(1:n,1:n) = round(A(1:n,1:n).*2.^Q(k)./256);
        n=n/2;
        k=k-1;
end