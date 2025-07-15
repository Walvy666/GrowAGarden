-- Basic Pet Game in Lua

-- Pet table to store its properties
local pet = {
    name = "Your Pet",
    hunger = 0,
    happiness = 100,
    is_sleeping = false
}

-- Function to feed the pet
local function feed_pet()
    if not pet.is_sleeping then
        print("You feed " .. pet.name .. ". It seems happy!")
        pet.hunger = math.max(0, pet.hunger - 20)
        pet.happiness = math.min(100, pet.happiness + 10)
    else
        print(pet.name .. " is sleeping. You can't feed it right now.")
    end
end

-- Function to play with the pet
local function play_with_pet()
    if not pet.is_sleeping then
        print("You play with " .. pet.name .. ". It's having a great time!")
        pet.hunger = math.min(100, pet.hunger + 10)
        pet.happiness = math.min(100, pet.happiness + 20)
    else
        print(pet.name .. " is sleeping. You can't play with it right now.")
    end
end

-- Function to put the pet to sleep
local function put_to_sleep()
    if not pet.is_sleeping then
        print(pet.name .. " is now sleeping.")
        pet.is_sleeping = true
    else
        print(pet.name .. " is already sleeping.")
    end
end

-- Function to wake the pet up
local function wake_up()
    if pet.is_sleeping then
        print(pet.name .. " woke up!")
        pet.is_sleeping = false
        pet.happiness = math.max(0, pet.happiness - 10) -- A bit grumpy from being woken up
    else
        print(pet.name .. " is already awake.")
    end
end

-- Function to display the pet's status
local function display_status()
    print("--------------------")
    print("Pet: " .. pet.name)
    print("Hunger: " .. pet.hunger .. "/100")
    print("Happiness: " .. pet.happiness .. "/100")
    if pet.is_sleeping then
        print("Status: Sleeping")
    else
        print("Status: Awake")
    end
    print("--------------------")
end

-- Main game loop
local function main()
    while true do
        display_status()
        print("What do you want to do?")
        print("1. Feed")
        print("2. Play")
        print("3. Put to sleep")
        print("4. Wake up")
        print("5. Quit")

        local choice = io.read()

        if choice == "1" then
            feed_pet()
        elseif choice == "2" then
            play_with_pet()
        elseif choice == "3" then
            put_to_sleep()
        elseif choice == "4" then
            wake_up()
        elseif choice == "5" then
            print("Thanks for playing!")
            break
        else
            print("Invalid choice. Please try again.")
        end

        -- Update pet's stats over time
        if not pet.is_sleeping then
            pet.hunger = math.min(100, pet.hunger + 5)
            pet.happiness = math.max(0, pet.happiness - 5)
        end
    end
end

-- Start the game
main()
