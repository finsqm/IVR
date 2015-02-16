function [ height_min, height_max, width_min, width_max ] = corners( image )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[H,W] = size(image);

height_min = H;
height_max = 0;
width_min = W;
width_max = 0;

for i = 1 : H
    
    for j = 1 : W
        
        v = image(i,j);
        
        if v == 1
            
            if i < height_min 
                
                height_min = i;
                
            end
            
            if i > height_max 
                
                height_max = i;
                
            end
            
            if j < width_min 
                
                width_min = j;
                
            end
            
            if j > width_max
                
                width_max = j;
                
            end
            
        end
        
    end
    
end

end

