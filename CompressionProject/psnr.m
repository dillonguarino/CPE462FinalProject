function p = psnr(x,y)

d = mean(mean((x(:)-y(:)).^2));
m1 = max(abs(x(:)));
m2 = max(abs(y(:)));
m = max(m1,m2);
p = 10*log10(m^2/d);

end