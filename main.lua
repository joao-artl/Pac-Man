function round(num)
    return math.floor(num + 0.5)
end

function love.load()
    anim8 = require('libraries/anim8')
    love.graphics.setDefaultFilter("nearest", "nearest")

    Player = {}
    Player.x = 400
    Player.y = 200
    Player.speed = 3.5
    Player.spriteSheet= love.graphics.newImage('/assets/pacman.png')
    Player.grid = anim8.newGrid(round((Player.spriteSheet:getWidth())/5), Player.spriteSheet:getHeight(), Player.spriteSheet:getWidth(), Player.spriteSheet:getHeight())
    
    Player.animations = {}
    Player.animations.right = anim8.newAnimation(Player.grid("1-3", 1), 0.12)

    Background= love.graphics.newImage('/assets/background.png')
    ScreenWidth = love.graphics.getWidth()
    ScreenHeight = love.graphics.getHeight()
end


function love.update(dt)
    if love.keyboard.isDown("right") then
        Player.x = Player.x + Player.speed
    end

    if love.keyboard.isDown("left") then
        Player.x = Player.x - Player.speed
    end

    if love.keyboard.isDown("up") then
        Player.y = Player.y - Player.speed
    end
    if love.keyboard.isDown("down") then
        Player.y = Player.y + Player.speed
    end

    Player.animations.right:update(dt)
end

function love.draw()
    local scaleX = ScreenWidth / Background:getWidth()
    local scaleY = ScreenHeight / Background:getHeight()

    love.graphics.draw(Background, 0, 0, 0, scaleX, scaleY)
    Player.animations.right:draw(Player.spriteSheet, Player.x, Player.y, nil, 1)
end