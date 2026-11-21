--Noslen's Callbot--
local TARGET_WORD = "noslen" --Name--

local function containsTargetSequence(text)
    local cleanText = text:lower():gsub("[^a-z]", "")
    local matchIndex = 1

    for i = 1, #cleanText do
        local currentLetter = cleanText:sub(i, i)
        local expectedLetter = TARGET_WORD:sub(matchIndex, matchIndex)

        if currentLetter == expectedLetter then
            matchIndex = matchIndex + 1
            if matchIndex > #TARGET_WORD then
                return true
            end
        elseif currentLetter == TARGET_WORD:sub(1, 1) then
            matchIndex = 2
        else
            matchIndex = 1
        end
    end

    return false
end

if not isInitialized then
    self.listen(1)
    isInitialized = true
end

local _, message = self.listen_msg()

if message and containsTargetSequence(message) then
    activate.up()
end
