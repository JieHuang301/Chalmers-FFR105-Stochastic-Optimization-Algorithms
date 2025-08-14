function chromosome = EncodeNetwork(wIH, wHO, wMax)
    wIH = (wIH + wMax)./(2 * wMax);
    wHO = (wHO + wMax)./(2 * wMax);
     
    nHidden = size(wIH,1);
    nIn = size(wIH,2)-1;    
    nOut = size(wHO,1);
    chromosome = zeros(1, (nIn+1)*nHidden+(nHidden+1)*nOut);
    for i = 1:nHidden
        for j = 1:nIn+1 
            chromosome((nIn+1)*(i-1)+j) = wIH(i,j);
        end
    end
    
    for i = 1:nOut
        for j = 1:nHidden+1 
            chromosome((nIn+1)*nHidden+(nHidden+1)*(i-1)+j) = wHO(i,j);
        end
    end
    
end