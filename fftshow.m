function fftshow(F,TYPE)
if (nargin==1)
    TYPE='log';
end
    if(strcmp(TYPE,'log'))
        imshow(mat2gray(log(eps+abs(F))))
    else
        if(strcmp(TYPE,'abs'))
            imshow(mat2gray(abs(F)))
        else
            error('MATLAB:fftshow:invalidSyntax','MATLAB:fftshow:invalidSyntax');
        end
    end
end