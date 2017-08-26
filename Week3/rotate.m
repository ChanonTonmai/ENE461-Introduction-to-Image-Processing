img=imread('lena.jpg'); 

[rowsi,colsi,z]= size(img); 

angle=45;

rowsf=ceil(rowsi*abs(cosd(angle))+colsi*abs(sind(angle)));                      
colsf=ceil(rowsi*abs(sind(angle))+colsi*abs(cosd(angle)));                     

C=uint8(zeros([rowsf colsf 3 ]));

xo=ceil(rowsi/2);                                                            
yo=ceil(colsi/2);
midx=ceil(rowsf/2);
midy=ceil(colsf/2);

for i=1:rowsf
    for j=1:colsf
         x= (i-midx)*cosd(angle)+(j-midy)*sind(angle);                                       
         y= -(i-midx)*sind(angle)+(j-midy)*cosd(angle);                             
         x=round(x)+xo;
         y=round(y)+yo;

         if (x>=1 && y>=1 && x<=rowsi &&  y<=colsi ) 
              C(i,j,:)=img(x,y,:);  
         end

    end
end
figure,imshow(C);
