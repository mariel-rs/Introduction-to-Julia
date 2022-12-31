#=
A short exercise on (immutable) structs for a veterinary clinic
=#

mutable struct Pet
    age::Int64
    name::String
    has_vaccines::Bool

    function Pet(age, name)
        new(age, name, false)
    end
end

pet_db = Dict{String, Pet}()

function create_record()

    while true

        println("Enter pet name. Leave empty when you are done")
        name = readline()

        if isempty(name)
            return false
        end

        println("Enter pet age")
        age = tryparse(Int64, readline())
        
        try 
            pet = Pet(age, name)
            pet_db[lowercase(pet.name)] = pet
            println("Created a record for $(pet.name)")
        catch ex
            if isa(ex, MethodError)
                println("The age is not numeric. Try again")
            end
        end

    end
end

function update_vaccinations(pet_key::String)
    
    if (haskey(pet_db, pet_key))
        pet = pet_db[pet_key]
        pet.has_vaccines = true

        println("Updated vaccination record for $(pet.name)")
        println("$(pet.name) has_vaccines: $(pet.has_vaccines)")
    else
        println("Pet is not in the db")
    end

end

function cli_menu()

    while true

        println("Pet database")
        println("Select the task you want to perform")    
        println("1 - Create records")
        println("2 - Update vaccination record")
        println("3 - Display all pets in database")
        println("x - Exit")

        selection = readline()

        if lowercase(selection) == "x"
            return false
        end

        if (selection == "1")
            create_record()
        elseif (selection == "2")
            println("Enter pet name")
            pet_name = lowercase(readline())
            update_vaccinations(pet_name)
        elseif (selection == "3")
            for pet in pet_db
                println(pet)
            end
        else
            println("Unknown selection. Try again.")
        end
    end
end

cli_menu()