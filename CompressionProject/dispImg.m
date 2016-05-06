function dispImg(X)

axes('position', [0, 0, 1, 1]);
Y = imrotate(X, 270);
image(Y);
truesize;
colormap(gray(256));