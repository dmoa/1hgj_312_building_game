local Player = {
    x = 50,
    y = 50,
    image = lg.newImage("player.png"),
    yv = 0,
    xv = 500,
    wall_jump = 0,
    jump_before = false,
    jump_now = false
}

function Player:Draw()
    lg.draw(self.image, self.x, self.y)
end

function Player:Update(dt)

    self.jump_before = self.jump_now
    self.jump_now = input.up() or lk.isDown("space")

    self.yv = self.yv + 3000 * dt
    self.y = self.y + self.yv * dt


    if input.left() then
        self.x = self.x - self.xv * dt
    end
    if input.right() then
        self.x = self.x + self.xv * dt
    end

    if self.x < buffer then
        self.x = buffer
    end

    if self.x + self.image:getWidth() > game_width - buffer then
        self.x = game_width - buffer - self.image:getWidth()
    end


    if self.y + self.image:getHeight() > game_height - buffer then
        self.yv = 0
        self.y = game_height - buffer - self.image:getHeight()
        self.wall_jump = 0
    end


    -- I know unecessarry nested if statement but this is hard to think about ok? Don't bully me :|
    if self.jump_now and not self.jump_before then

        if (self.yv == 0 or (self.wall_jump < 1 and (  self.x < buffer*2 or self.x > game_width + (- buffer - self.image:getWidth())*2  ) ) ) then
            self.yv = -1000


            if self.x < buffer*2 or self.x > game_width + (- buffer - self.image:getWidth())*2 then
                self.wall_jump = self.wall_jump + 1
            end

        end
    end

end

return Player