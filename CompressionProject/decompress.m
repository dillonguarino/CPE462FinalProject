function d = decompress(Q, size)

mask = genMask(size,Q);

fid2 = fopen('compress.bin','r');
d=zeros(length(mask));
for (i = 1:length(mask)^2)
        if (mask(i) ~= 0)
                precision = strcat('ubit', int2str(mask(i)));
                d(i) = fread(fid2, 1, precision);
        end
end
