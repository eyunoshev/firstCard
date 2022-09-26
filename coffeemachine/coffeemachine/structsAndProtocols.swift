protocol recipesCoffee
{
    var milkForRecipe:Int {get set}
    var waterForRecipe:Int {get set}
    var coffeeForRecipe:Int {get set}
}

struct differentCoffes: recipesCoffee
{
    var milkForRecipe: Int
    var waterForRecipe: Int
    var coffeeForRecipe: Int
    
    func checkResourcecsForRecipe () -> Bool
    {
        if ((milkForRecipe * Int(console.myCoffeeMachine.numsCupsOfCoffee)! ?? 0) < coffeeMachineRes.Milk) && ((waterForRecipe * Int(console.myCoffeeMachine.numsCupsOfCoffee)! ?? 0) < coffeeMachineRes.Water) && ((coffeeForRecipe * Int(console.myCoffeeMachine.numsCupsOfCoffee)! ?? 0) < coffeeMachineRes.Coffee)
        {
            return true
        }
        else
        {
            print("В резервуарах не хватает ингридиентов для кофе, проверьте рецепты и пополните резервуары!")
            return false
        }
        
        
    }
    
}

let capuchino = differentCoffes(milkForRecipe: 50, waterForRecipe: 60, coffeeForRecipe: 70)
let espresso = differentCoffes(milkForRecipe: 40, waterForRecipe: 30, coffeeForRecipe: 60)
var yourRecipe = differentCoffes(milkForRecipe: 0, waterForRecipe: 0, coffeeForRecipe: 0)

struct Resources
{
    var Milk: Int
    var Coffee: Int
    var Water: Int
    
    func checkCoffee ()
    {
        print ("гр коффе:", Coffee)
    }

    func checkMilk ()
    {
        print ("мл молока:", Milk)
    }

    func checkWater ()
    {
        print ("мл воды:", Water)
    }
    
    mutating func addWater ()
    {
        print ("Введите количество миллилитров воды, которое хотите добавить в кофемашину")
        var numWaterToAdd = Int(readLine() ?? "")
        if (console.myCoffeeMachine.maxWater - Water >= numWaterToAdd ?? 0 )
        {
            console.myCoffeeMachine.idCondition = 3
            console.myCoffeeMachine.printCondition()
            console.myCoffeeMachine.myTimer()
            Water += numWaterToAdd ?? 0
            print ("Готово!")
            console.myCoffeeMachine.idCondition = 0
        }
        else if (console.myCoffeeMachine.maxWater - Water < numWaterToAdd ?? 0)
        {
            print ("\(String(describing: console.idProcces[6]))")
        }
    }

    mutating func addMilk ()
    {
        print ("Введите количество миллилитров молока, которое хотите добавить в кофемашину")
        var numMilkToAdd = Int(readLine() ?? "")
        if (console.myCoffeeMachine.maxMilk - Milk >= numMilkToAdd  ?? 0 )
        {
            console.myCoffeeMachine.idCondition = 4
            console.myCoffeeMachine.printCondition()
            console.myCoffeeMachine.myTimer()
            Milk += numMilkToAdd ?? 0
            print ("Готово!")
            console.myCoffeeMachine.idCondition = 0
        }
        else if (console.myCoffeeMachine.maxMilk - Milk < numMilkToAdd ?? 0)
        {
            print ("\(String(describing: console.idProcces[7]))")
        }
        
    }

    mutating func addCoffee ()
    {
        print ("Введите количество грамм кофе, которое хотите добавить в кофемашину")
        var numCoffeeToAdd = Int(readLine() ?? "")
        if (console.myCoffeeMachine.maxCoffee - Coffee >= numCoffeeToAdd ?? 0 )
        {
            console.myCoffeeMachine.idCondition = 5
            console.myCoffeeMachine.printCondition()
            console.myCoffeeMachine.myTimer()
            Coffee += numCoffeeToAdd ?? 0
            print ("Готово!")
            console.myCoffeeMachine.idCondition = 0
        }
        else if (console.myCoffeeMachine.maxCoffee - Coffee <  numCoffeeToAdd ?? 0)
        {
            print ("\(String(describing: console.idProcces[8]))")
        }
    }
    
}

var coffeeMachineRes: Resources = Resources (Milk: 0, Coffee: 0, Water: 0)

