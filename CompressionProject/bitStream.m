function b=bit(a, Q, size)

sizeMod = size/(2^4);

mask(1:sizeMod, 1:sizeMod) = Q(1);
mask(sizeMod+1:sizeMod*2, 1:sizeMod) = Q(2);
mask(sizeMod+1:sizeMod*2, sizeMod+1:sizeMod*2) = Q(2);
mask(1:sizeMod, sizeMod+1:sizeMod*2) = Q(2);
mask(sizeMod*2+1:sizeMod*2^2, 1:sizeMod*2) = Q(3);
mask(sizeMod*2+1:sizeMod*2^2, 33:sizeMod*2^2) = Q(3);
mask(1:sizeMod*2, sizeMod*2+1:sizeMod*2^2) = Q(3);
mask(sizeMod*2^2+1:sizeMod*2^3, 1:sizeMod*2^2) = Q(4);
mask(sizeMod*2^2+1:sizeMod*2^3, sizeMod*2^2+1:sizeMod*2^3) = Q(4);
mask(1:sizeMod*2^2, sizeMod*2^2+1:sizeMod*2^3) = Q(4);
mask(sizeMod*2^3+1:sizeMod*2^4, 1:sizeMod*2^3) = Q(5);
mask(sizeMod*2^3+1:sizeMod*2^4, sizeMod*2^3+1:sizeMod*2^4) = Q(5);
mask(1:sizeMod*2^3, sizeMod*2^3+1:sizeMod*2^4) = Q(5);


fid1 = fopen('bit.bin','w+');

for(i=1:length(mask)^2)
        if (mask(i) ~= 0)
                w1=strcat('ubit', int2str(mask(i)));
                fwrite(fid1, a(i), w1);
        end
end
fclose('all');

fid2 = fopen('bit.bin','r');
b=zeros(length(mask));
for (j = 1:length(mask)^2)
        if (mask(j) ~= 0)
                w2 = strcat('ubit', int2str(mask(j)));
                b(j) = fread(fid2, 1, w2);
        else
                w2 = 'ubit1';
        end
end
