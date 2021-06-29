WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

bar = VIRTUAL_WIDTH

Class = require "class"
push = require "push"

require "Ship"
require "Ball"

-- [[ Initializes the game ]]
function love.load()

    math.randomseed(os.time())
    
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setTitle("SPACE RACE")

    titleFont = love.graphics.newFont("title.ttf", 40)
    smallFont = love.graphics.newFont("title.ttf", 24)
    tinyFont = love.graphics.newFont("time.ttf", 16)
    scoreFont = love.graphics.newFont("font.TTF", 24)

    sounds = {
        ["hit"] = love.audio.newSource("hit.wav", "static"),
        ["score1"] = love.audio.newSource("score1.wav", "static"),
        ["score2"] = love.audio.newSource("score2.wav", "static")
    }

    music = love.audio.newSource("background.wav", "static")

    music:setVolume(0.25)
    music:setLooping(true)
    music:play()

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    p1score = 0
    p2score = 0

    --instantiate the 2 ships
    ship1 = Ship(5, VIRTUAL_HEIGHT / 4 + 15, 20, 5)
    ship2 = Ship(5, VIRTUAL_HEIGHT * 3 / 4 - 10, 20, 5)

    --instantiate balls--------------------------------------------------------------------------------
    --ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    ball_11 = Ball(50, -10, 4, 4)
    ball_12 = Ball(110, -10, 4, 4)
    ball_13 = Ball(140, -10, 4, 4)
    ball_14 = Ball(230, -10, 4, 4)
    ball_15 = Ball(300, -10, 4, 4)
    ball_16 = Ball(350, -10, 4, 4)

    ball_51 = Ball(50 + 10, VIRTUAL_HEIGHT + 10, 4, 4)
    ball_52 = Ball(110 + 15, VIRTUAL_HEIGHT + 10, 4, 4)
    ball_53 = Ball(140 + 20, VIRTUAL_HEIGHT + 10, 4, 4)
    ball_54 = Ball(230 + 10, VIRTUAL_HEIGHT + 10, 4, 4)
    ball_55 = Ball(300 + 15, VIRTUAL_HEIGHT + 10, 4, 4)
    ball_56 = Ball(350 + 20, VIRTUAL_HEIGHT + 10, 4, 4)

    speed = 150

    gameState = "start"
end

function love.resize(w, h)
    push:resize(w, h)
end



function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    
    elseif key == "enter" or key == "return" or key == "tab" then
        --[[puts the ball in motion]]
        if gameState == "start" then
            gameState = "play"

        elseif gameState == "victory" then
            gameState = "start"
            p1score = 0
            p2score = 0
            bar = VIRTUAL_WIDTH
            ship1:reset()
            ship2:reset()
        end
    end
end


function love.update(dt)

    ship1:update(dt)
    ship2:update(dt)

    --collision------------------------------------------------------------------------------
    if ball_11:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_11:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_12:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_12:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_13:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_13:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_14:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_14:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_15:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_15:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_16:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_16:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end

    if ball_51:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_51:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_52:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_52:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_53:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_53:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_54:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_54:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_55:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_55:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end
    if ball_56:collides(ship1) then 
        ship1:reset()
        sounds["hit"]:play()
    elseif ball_56:collides(ship2) then 
        ship2:reset()
        sounds["hit"]:play()
    end


    --if they score
    if ship1.x >= VIRTUAL_WIDTH then
        p1score = p1score + 1
        sounds["score1"]:play()
        ship1:reset()

    elseif ship2.x >= VIRTUAL_WIDTH then
        p2score = p2score + 1
        sounds["score2"]:play()
        ship2:reset()
    end

    --update p1 ship movement
    if love.keyboard.isDown("d") then
        ship1.dx = speed
    elseif love.keyboard.isDown("a") then
        ship1.dx = - speed
    else
        ship1.dx = 0
    end

    --update p2 ship movement  
    if love.keyboard.isDown("right") then
        ship2.dx = speed
    elseif love.keyboard.isDown("left") then
        ship2.dx = - speed
    else
        ship2.dx = 0
    end

    --update ball position-------------------------------------------------------------------------
    if gameState == "play" then
        ball_11:update(dt)
        ball_12:update(dt)
        ball_13:update(dt)
        ball_14:update(dt)
        ball_15:update(dt)
        ball_16:update(dt)

        ball_51:update(dt)
        ball_52:update(dt)
        ball_53:update(dt)
        ball_54:update(dt)
        ball_55:update(dt)
        ball_56:update(dt)

        bar = bar - 7 * dt
    end

    if ball_11.y < 0 or ball_11.y > VIRTUAL_HEIGHT then
        ball_11:reset()
    end
    if ball_12.y < 0 or ball_12.y > VIRTUAL_HEIGHT then
        ball_12:reset()
    end
    if ball_13.y < 0 or ball_13.y > VIRTUAL_HEIGHT then
        ball_13:reset()
    end
    if ball_14.y < 0 or ball_14.y > VIRTUAL_HEIGHT then
        ball_14:reset()
    end
    if ball_15.y < 0 or ball_15.y > VIRTUAL_HEIGHT then
        ball_15:reset()
    end
    if ball_16.y < 0 or ball_16.y > VIRTUAL_HEIGHT then
        ball_16:reset()
    end

    if ball_51.y < 0 or ball_51.y > VIRTUAL_HEIGHT then
        ball_51:reset()
    end
    if ball_52.y < 0 or ball_52.y > VIRTUAL_HEIGHT then
        ball_52:reset()
    end
    if ball_53.y < 0 or ball_53.y > VIRTUAL_HEIGHT then
        ball_53:reset()
    end
    if ball_54.y < 0 or ball_54.y > VIRTUAL_HEIGHT then
        ball_54:reset()
    end
    if ball_55.y < 0 or ball_55.y > VIRTUAL_HEIGHT then
        ball_55:reset()
    end
    if ball_56.y < 0 or ball_56.y > VIRTUAL_HEIGHT then
        ball_56:reset()
    end

    

    if gameState == "start" then
        ship1.dx = 0
        ship2.dx = 0
    end

    --when time is over
    if bar <= 0 then
        gameState = "victory"

        ship1.dx = 0
        ship2.dx = 0
        
        if p1score > p2score then
            winner = "player 1"
        elseif p2score > p1score then
            winner = "player 2"
        else
            winner = "tie"
        end
    end
end



function love.draw()

    push:apply("start")

    love.graphics.clear(0,0, 35/255, 1)

    --draw both spaceships
    love.graphics.setColor(0, 1, 1, 1)
    ship1:render()
    love.graphics.setColor(1, 112/255, 71/255, 0.9)
    ship2:render()
    love.graphics.setColor(1, 1, 1, 1)

    --draw welcome message
    if gameState == "start" then
        love.graphics.setFont(titleFont)
        love.graphics.printf("WELCOME TO", 0, VIRTUAL_HEIGHT/4 - 25, VIRTUAL_WIDTH, "center")
        love.graphics.printf("SPACE RACE!", 0, VIRTUAL_HEIGHT/3 - 6, VIRTUAL_WIDTH, "center")
        love.graphics.setFont(smallFont)
        love.graphics.printf("Press ENTER to start!", 0, VIRTUAL_HEIGHT/2 - 6, VIRTUAL_WIDTH, "center")
    end 
    
    --draw score and time bar
    if gameState == "play" then

        love.graphics.setFont(scoreFont)
        love.graphics.print(p1score, 10, 10)
        love.graphics.print(p2score, 10, VIRTUAL_HEIGHT - 40)

        --draw time bar
        love.graphics.setFont(tinyFont)
        love.graphics.print("Time left:", 3, VIRTUAL_HEIGHT / 2 - 18)
        love.graphics.rectangle("fill", 0, VIRTUAL_HEIGHT / 2 - 1, bar, 2)

        --draw ball-----------------------------------------------------------------------------------
        ball_11:render( )
        ball_12:render( )
        ball_13:render( )
        ball_14:render( )
        ball_15:render( )
        ball_16:render( )

        ball_51:render( )
        ball_52:render( )
        ball_53:render( )
        ball_54:render( )
        ball_55:render( )
        ball_56:render( )

    end

    if gameState == "victory" then
        love.graphics.setFont(titleFont)
        if winner == "tie" then
            love.graphics.printf("TIE!", 0, VIRTUAL_HEIGHT/3 - 1, VIRTUAL_WIDTH, "center")
        else
            love.graphics.printf("Winner is ".. winner, 0, VIRTUAL_HEIGHT/3 - 1, VIRTUAL_WIDTH, "center")
        end

        love.graphics.setFont(smallFont)
        love.graphics.printf("Press ENTER to play again!", 0, VIRTUAL_HEIGHT/2 - 1, VIRTUAL_WIDTH, "center")
    end

    push:apply("end")
end



--draw the countdown
--local start = os.time()
--while os.time() - start < 2 do
--    love.graphics.printf("READY?", 0, VIRTUAL_HEIGHT / 2 - 30, VIRTUAL_WIDTH, "center")
--end 
--start = os.time()
--while os.time() - start < 2 do
--    love.graphics.printf("SET...", 0, VIRTUAL_HEIGHT / 2 - 30, VIRTUAL_WIDTH, "center")
--end 
--start = os.time()
--while os.time() - start < 2 do
--    love.graphics.printf("GO!", 0, VIRTUAL_HEIGHT / 2 - 30, VIRTUAL_WIDTH, "center")
--end "