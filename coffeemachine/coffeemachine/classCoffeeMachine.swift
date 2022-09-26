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
            coffeeMachineRes.Milk -= (coffee.milkForRecipe * Int(console.myCoffeeMachine.numsCupsOfCoffee)! ?? 0)
            coffeeMachineRes.Water -= (coffee.waterForRecipe * Int(console.myCoffeeMachine.numsCupsOfCoffee)! ?? 0)
            coffeeMachineRes.Coffee -= (coffee.coffeeForRecipe * Int(console.myCoffeeMachine.numsCupsOfCoffee)! ?? 0)
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
        print ("\(console.idProcces[idCondition]))")
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
}

