function p = psnr(x,y)

err = immse(x,y);

m1 = max(abs(x(:)));
m2 = max(abs(y(:)));
m = max(m1,m2); % max fluctuation in input image data type

p = 10*log10(m^2/err);

end