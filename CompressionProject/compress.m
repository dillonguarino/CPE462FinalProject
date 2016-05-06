function c = compress(A, Q, size)

mask = genMask(size,Q);

fid1 = fopen('compress.bin', 'w+');

for(i=1:length(mask)^2)
        if (mask(i) ~= 0)
                precision=strcat('ubit', int2str(mask(i)));
                fwrite(fid1, A(i), precision);
        end
end
fclose('all');
