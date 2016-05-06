function mask = genMask(size, Q)

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

end