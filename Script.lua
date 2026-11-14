if not init then
    self.listen(1) -- Enable chat listening for the robot
    init = true
end

local speaker, msg = self.listen_msg()
if msg then
    local lower = string.lower(msg)
    local target = "noslen" -- Set your target name here
    local step = 1

    for i = 1, #lower do
        local c = string.sub(lower, i, i)
        if c >= "a" and c <= "z" then
            if c == string.sub(target, step, step) then
                step = step + 1
                if step > 5 then
                    activate.up() -- Triggers the block directly above the robot
                    break
                end
            else
                if c == "n" then -- Reset point matching the first letter of your target
                    step = 2
                else
                    step = 1
                end
            end
        elseif c >= "0" and c <= "9" then
            step = 1
        end
    end
end
