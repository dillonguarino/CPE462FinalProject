fileName = input('Enter file name: ');
fid = fopen(fileName,'r');
fSize = input('Enter file size: ');
Input = fread(fid,[fSize,fSize],'uchar');
fclose(fid);

%Initialize scalar quantization vector
Qf= input('Enter Quantization step size: ');
Q=zeros(1,5);
Q(4)=Qf;
Q(3)=Qf*2;
Q(2)=Qf*3;
Q(1)=Qf*4;

%begin compression transformations
pic1=HaarTrans(Input);
pic2=quant(pic1,Q,fSize);
compress(pic2, Q, fSize);

%read out and decompress file
d = decompress(Q, fSize);
Input2=quantinv(d,Q,fSize);
Output=HaarTransInv(Input2);

%output peak signal to noise ratio
disp('PSNR: ');
disp(psnr(Input,Output));

%output compression factor
orig = dir(fileName);
comp = dir('compress.bin');
fact = orig.bytes/comp.bytes;
disp('Compressed by a factor of: ');
disp(fact);

%display output image
dispImg(Output);