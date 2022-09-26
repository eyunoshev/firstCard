import Foundation
import Cocoa
import Darwin

class coffeeMachine
{
    var timeLeft = 5
    var numbersForCleaning: Int = 10
    var idCondition: Int = 10
    var numsCupsOfCoffee: String = ""
    
    let maxWater = 200
    let maxMilk = 200
    let maxCoffee = 200
    

    func needClean ()
    {
        if numbersForCleaning > 0
        {
            print("чистить не надо, кружек до чистки: \(numbersForCleaning)")
        }
        else
        {
            print("нужна очистка!")
        }
    }

    func clean ()
    {
        numbersForCleaning = 10
        idCondition = 2
        printCondition()
        myTimer()
        print ("Готово!")
        idCondition = 0
    }
    
    func makeCoffee ()
    {
        print ("""
нажмите 1 - чтобы сделать капучино
нажмите 2 - чтобы сделать эспрессо
нажмите 3 чтобы сделать свой кофе
""")
        while let chooseCoffee = readLine()
        {
            switch chooseCoffee
            {
            case "1":
                makeCapuchino()
            case "2":
                makeEspresso()
            case "3":
                makeYourRecipe()
            default:
                break
            }
            break
        }
    }
    
    func chooseNumsCups() -> Bool
    {
        print ("Введите количество кружек коффее")
        numsCupsOfCoffee = readLine() ?? ""
        if numbersForCleaning > Int(numsCupsOfCoffee) ?? 0
        {
            return true
        }
        else
        {
            print("Очистите кофемашину или укажите меньшее количество кружек кофе, кружек до чистки: \(numbersForCleaning) ")
            return false
        }
    }
    
    func makeCapuchino()
    {
        if chooseNumsCups() == true
        {
            capuchino.checkResourcecsForRecipe()
            if capuchino.checkResourcecsForRecipe() == true
            {
                proceesMakeCoffee(capuchino)
            }
        }
    }
    
    func makeEspresso()
    {
        if chooseNumsCups() == true
        {
            espresso.checkResourcecsForRecipe()
            if espresso.checkResourcecsForRecipe() == true
            {
                proceesMakeCoffee(espresso)
            }
        }
    }
    
    func makeYourRecipe()
    {
        if chooseNumsCups() == true
        {
            print("Введите сколько молока вы хотите добавить в свой рецепт")
            yourRecipe.milkForRecipe = Int(readLine() ?? "") ?? 0
            print("Введите сколько воды вы хотите добавить в свой рецепт")
            yourRecipe.waterForRecipe = Int(readLine() ?? "") ?? 0
            print("Введите сколько кофе вы хотите добавить в свой рецепт")
            yourRecipe.coffeeForRecipe = Int(readLine() ?? "") ?? 0
            yourRecipe.checkResourcecsForRecipe()
            if yourRecipe.checkResourcecsForRecipe() == true
            {
                proceesMakeCoffee(yourRecipe)
            }
        }
    }
    
    func proceesMakeCoffee(_ coffee : differentCoffes)
    {
            idCondition = 1
            printCondition()
            myTimer()
            numbersForCleaning -= Int(numsCupsOfCoffee) ?? 0
            coffeeMachineRes.Milk -= (coffee.milkForRecipe * Int(myCoffeeMachine.numsCupsOfCoffee)! ?? 0)
            coffeeMachineRes.Water -= (coffee.waterForRecipe * Int(myCoffeeMachine.numsCupsOfCoffee)! ?? 0)
            coffeeMachineRes.Coffee -= (coffee.coffeeForRecipe * Int(myCoffeeMachine.numsCupsOfCoffee)! ?? 0)
            print ("Готово!")
            idCondition = 0
    }
    
    func executeMachine ()
    {
        switch  idCondition
        {
        case 10:
            idCondition = 0
            printCondition()
        case 0:
            idCondition = 10
            printCondition()
        default:
            printCondition()
        }
    }
    
    @objc func myTimer()
    {
        timeLeft = 3
        while timeLeft > 0
            {
            sleep(1)
            timeLeft -= 1
            print  ("\(timeLeft)")
            }
    }
    
    func checkConditions ()
    {
        printCondition()
    }
    
    func printCondition()
    {
        print ("\(idProcces[idCondition]))")
    }
    
    func checkRecipes ()
    {
        print("""
 нажмите 1 - чтобы посмотреть рецепт капучино
 нажмите 2 - чтобы посмотреть рецепт еспрессо
 нажмите 3 - чтобы посмотреть ваш последний импровизированный рецепт
 """)
        while let infoRecipe = readLine()
        {
            switch infoRecipe
            {
            case "1":
                print("Капучино: Молоко -\( capuchino.milkForRecipe) Вода -\( capuchino.waterForRecipe) Кофе -\( capuchino.coffeeForRecipe)")
            case "2":
                print("Еспрессо: Молоко -\(espresso.milkForRecipe) Вода -\( espresso.waterForRecipe) Кофе -\( espresso.coffeeForRecipe)")
            case "3":
                print("Ваш последний импровизированный рецепт: Молоко -\(yourRecipe.milkForRecipe) Вода -\( yourRecipe.waterForRecipe) Кофе -\( yourRecipe.coffeeForRecipe)")
            default:
                break
            }
            break
        }
    }
    
    func checkInfo()
    {
        print("""
 Нажмите 0 - чтобы включить или выключить коффемашину
 нажмите 1 - чтобы сделать кофе
 нажмите 2 - чтобы узнать нужна ли чистка кофемашины
 нажмите 3 - чтобы произвести очистку кофемашины
 нажмите 4 чтобы проверить состояние (чем занята) кофемашины
 нажмите 5 - чтобы проверить количество зёрен
 нажмите 6 - чтобы проверить количество молока
 нажмите 7 - чтобы проверить уровень воды
 нажмите 8 - чтобы добавить воды
 нажмите 9 - чтобы добавить молока
 введите 10 - чтобы добавить кофе
 введите 11 - чтобы посмотреть рецепты кофе
 """ )
    }
    
}

let myCoffeeMachine = coffeeMachine()

var idProcces = [Int:String] ()
idProcces[0] = "коффемонстр запущен и жаждет работы!"
idProcces[1] = "идёт приготовление кофе"
idProcces[2] = "идёт очистка кофемашины"
idProcces[3] = "добавляем указанное количество воды"
idProcces[4] = "добавляем указанное количество молока"
idProcces[5] = "добавляем указанное количество коффе"
idProcces[6] = "в резервуаре нет места для указанного количества воды "
idProcces[7] = "в резервуаре нет места для указанного количества молока"
idProcces[8] = "В резервуаре нет места для указанного количества кофе"
idProcces[10] = "коффемонстр выключен и мечтает чтобы ты включил его!"


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
        if ((milkForRecipe * Int(myCoffeeMachine.numsCupsOfCoffee)! ?? 0) < coffeeMachineRes.Milk) && ((waterForRecipe * Int(myCoffeeMachine.numsCupsOfCoffee)! ?? 0) < coffeeMachineRes.Water) && ((coffeeForRecipe * Int(myCoffeeMachine.numsCupsOfCoffee)! ?? 0) < coffeeMachineRes.Coffee)
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
        if (myCoffeeMachine.maxWater - Water >= numWaterToAdd ?? 0 )
        {
            myCoffeeMachine.idCondition = 3
            myCoffeeMachine.printCondition()
            myCoffeeMachine.myTimer()
            Water += numWaterToAdd ?? 0
            print ("Готово!")
            myCoffeeMachine.idCondition = 0
        }
        else if (myCoffeeMachine.maxWater - Water < numWaterToAdd ?? 0)
        {
            print ("\(String(describing: idProcces[6]))")
        }
    }

    mutating func addMilk ()
    {
        print ("Введите количество миллилитров молока, которое хотите добавить в кофемашину")
        var numMilkToAdd = Int(readLine() ?? "")
        if (myCoffeeMachine.maxMilk - Milk >= numMilkToAdd  ?? 0 )
        {
            myCoffeeMachine.idCondition = 4
            myCoffeeMachine.printCondition()
            myCoffeeMachine.myTimer()
            Milk += numMilkToAdd ?? 0
            print ("Готово!")
            myCoffeeMachine.idCondition = 0
        }
        else if (myCoffeeMachine.maxMilk - Milk < numMilkToAdd ?? 0)
        {
            print ("\(String(describing: idProcces[7]))")
        }
        
    }

    mutating func addCoffee ()
    {
        print ("Введите количество грамм кофе, которое хотите добавить в кофемашину")
        var numCoffeeToAdd = Int(readLine() ?? "")
        if (myCoffeeMachine.maxCoffee - Coffee >= numCoffeeToAdd ?? 0 )
        {
            myCoffeeMachine.idCondition = 5
            myCoffeeMachine.printCondition()
            myCoffeeMachine.myTimer()
            Coffee += numCoffeeToAdd ?? 0
            print ("Готово!")
            myCoffeeMachine.idCondition = 0
        }
        else if (myCoffeeMachine.maxCoffee - Coffee <  numCoffeeToAdd ?? 0)
        {
            print ("\(String(describing: idProcces[8]))")
        }
    }
    
}

var coffeeMachineRes: Resources = Resources (Milk: 0, Coffee: 0, Water: 0)

// Блок управления
print("Нажмите 0 - чтобы включить или выключить коффемашину")

while let input = readLine()
{
    switch input
    {
    case "0":
        myCoffeeMachine.executeMachine()
        myCoffeeMachine.checkInfo()
        continue
    case "1":
        myCoffeeMachine.makeCoffee()
    case "2":
        myCoffeeMachine.needClean()
    case "3":
        myCoffeeMachine.clean()
    case "4":
        myCoffeeMachine.checkConditions()
    case "5":
        coffeeMachineRes.checkCoffee()
    case "6":
        coffeeMachineRes.checkMilk()
    case "7":
        coffeeMachineRes.checkWater()
    case "8":
        coffeeMachineRes.addWater()
    case "9":
        coffeeMachineRes.addMilk()
    case "10":
        coffeeMachineRes.addCoffee()
    case "11":
        myCoffeeMachine.checkRecipes()
    case "12":
        myCoffeeMachine.checkInfo()
    default:
        continue
        
    }
}






