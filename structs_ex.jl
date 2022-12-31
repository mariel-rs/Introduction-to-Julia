#=
A short exercise on (immutable) structs
=#

struct Person
    age::Int64
    name::String

    function Person(age, name)
        new(age, name)
    end
end

println("Person record")

while true

    println("Enter age. Leave empty when you are done")
    age_input = readline()

    if isempty(age_input)
        return false
    end

    age = parse(Int64, age_input)

    println("Enter name")
    name = readline()

    println("Creating a record")
    
    pers = Person(age, name)
    println(pers)
end