function split(H,x1,y1,x2,y2)
  global threshold;
  global maxPx;
  global segRes;
  global index;
  global MRes;
  
  kawalek = H(y1:y2,x1:x2);
  I = kawalek(:);
  
  srednia = mean(I);
  
  odchylenie = std(I);

  if (odchylenie < threshold || (x2-x1) <= maxPx || (y2-y1) <= maxPx) 
      segRes(y1:y2,x1:x2) = index;
      index = index + 1;
      MRes(y1:y2,x1:x2) = srednia;
  else
    tmpX = round((x1+x2)/2);
    tmpY = round((y1+y2)/2);
    split(H,x1,y1,tmpX,tmpY);
    split(H,tmpX,y1,x2,tmpY);
    split(H,x1,tmpY,tmpX,y2);
    split(H,tmpX,tmpY,x2,y2);
  end
end