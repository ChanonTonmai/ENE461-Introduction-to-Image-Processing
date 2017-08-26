original = imread('lena.jpg');
original = int64(original);
[i,j,k]=size(original);
a=2;
b=2;
scalepic = zeros(a*i,b*j,k);
for z=1:k
    for x=1:ceil((i-1)*a)
        for y=1:ceil((j-1)*b)
            scalepic(x,y,z)=original(ceil(x/a),ceil(y/b),z);            
            scalepic(x,y+2,z)=original(ceil(x/a),ceil((y+1)/b),z);
            scalepic(x+2,y,z)=original(ceil((x+1)/a),ceil(y/b),z);
            scalepic(x+2,y+2,z)=original(ceil((x+1)/a),ceil((y+1)/b),z);
            scalepic(x,y+1,z)=(original(ceil(x/a),ceil(y/b),z)+original(ceil(x/a),ceil((y+1)/b),z))/2;
            scalepic(x+1,y,z)=(original(ceil(x/a),ceil(y/b),z)+original(ceil((x+1)/a),ceil(y/b),z))/2;
            scalepic(x+1,y+2,z)=(original(ceil(x/a),ceil((y+1)/b),z)+original(ceil((x+1)/a),ceil((y+1)/b),z))/2;            
            scalepic(x+2,y+1,z)=(original(ceil((x+1)/a),ceil(y/b),z)+original(ceil((x+1)/a),ceil((y+1)/b),z))/2;
            scalepic(x+1,y+1,z)=(((original(ceil(x/a),ceil(y/b),z)+original(ceil(x/a),ceil((y+1)/b),z))/2)+((original(ceil((x+1)/a),ceil(y/b),z)+original(ceil((x+1)/a),ceil((y+1)/b),z))/2))/2;
        end
    end
end
scalepic=uint8(scalepic);
original=uint8(original);
figure,imshow(original)
figure,imshow(scalepic)
