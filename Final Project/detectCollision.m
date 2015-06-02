function hit = detectCollision(ballX, ballY, randX, randY)

%% Authors: Michael Murphy and Nischaal Cooray

% Check to see that the ball has collided significantly with the target
if ((ballX > 100 + randX) && (ballX < 110 + randX) ) && ((ballY > 80 + randY) && (ballY < 90 + randY))
    didHit = 1;     
else
    didHit = 0;     
end

if (didHit == 1)
    hit = 1;        %return true if it has
else
    hit = 0;        %return false if it hasnt
end

end