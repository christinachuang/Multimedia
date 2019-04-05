A = imread('lalaland.png');
A = im2double(A);
B=A;
C=A;
D=A;
M=8;
%DO DCT
for col=1:length(A(1,:,1))
    for i=1:M:length(A(:,1,1))-1
        B(i:i+M-1, col,1) = DCT(A(i:i+M-1, col,1), M);
        C(i:i+M-1, col,1) = DCT(A(i:i+M-1, col,2), M);
        D(i:i+M-1, col,1) = DCT(A(i:i+M-1, col,3), M);
    end
end
for row=1:length(B(:,1,1))
    for k=1:M:length(B(1,:,1))-1
        B(row,k:k+M-1,1)=DCT(B(row,k:k+M-1,1), M);
        B(row,k:k+M-1,2)=DCT(C(row,k:k+M-1,1), M);
        B(row,k:k+M-1,3)=DCT(D(row,k:k+M-1,1), M);
    end
end
%DO n=8 Inverse DCT
Z=Blocks(B,M,8);
figure();
imshow(Z);
t=PSNR(A,Z);
disp(t);
imwrite(Z, 'dct_8.png');
%DO n=4 Inverse DCT
X=Blocks(B,M,4);
figure();
imshow(X);
t=PSNR(A,X);
disp(t);
imwrite(X, 'dct_4.png');
%DO n=2 Inverse DCT
Y=Blocks(B,M,2);
figure();
imshow(Y);
t=PSNR(A,Y);
disp(t);
imwrite(Y, 'dct_2.png');