local Blocks = {
    image = lg.newImage("platform.png"),
    blocks = {{x = - 50, y = -50}}
}

function Blocks:Draw()
    for i = 1, #self.blocks do
        lg.draw(self.image, self.blocks[i].x, self.blocks[i].y)
    end
end

function Blocks:Update(dt)
    if number_blocks > 0 then
        self.blocks[#self.blocks].x, self.blocks[#self.blocks].y = lmouse.getPosition()
        self.blocks[#self.blocks].x = self.blocks[#self.blocks].x - self.image:getWidth() / 2
        self.blocks[#self.blocks].y = self.blocks[#self.blocks].y - self.image:getHeight() / 2
    end
end

function Blocks:Click()
    if number_blocks > 0 then
        number_blocks = number_blocks - 1

        table.insert(self.blocks, ({x = -50, y = -50}))

    end
end

return Blocks