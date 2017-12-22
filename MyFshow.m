function MyFshow(im, type)
    n = nargin;
    switch n
        case 1
            a = abs(im)/max(max(abs(im)));
            figure
            imshow(a)
        case 2
            if(type=='abs')
                a = abs(im)/max(max(abs(im)));
                figure
                imshow(a)
            else if(type=='log')
                l = mat2gray(1+log(abs(im)));
                figure
                imshow(l)
                end
            end
    end

end