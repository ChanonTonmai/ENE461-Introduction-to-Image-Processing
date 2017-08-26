original = imread('lena.jpg');
original = int64(original);
[i,j,k]=size(original);
a=0.9;
b=0.5;
scalepic = zeros(a*i,b*j,k);
for z=1:k
    for x=1:floor((i-1)*a)
        for y=1:floor((j-1)*b)
            scalepic(x,y,z)=(original(floor(x/a),floor(y/b),z)+original(floor(x/a),floor((y+1)/b),z)+original(floor((x+1)/a),floor(y/b),z)+original(floor((x+1)/a),floor((y+1)/b),z))/4;
        end
    end
end
scalepic=uint8(scalepic);
figure,imshow(scalepic)
