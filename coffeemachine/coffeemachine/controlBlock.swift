
public class ConsoleI
{
    // Методы класса
    public func Start()
    {
        print("Нажмите 0 - чтобы включить или выключить коффемашину")
        
        while let input = readLine()
        {
            switch input
            {
            case "0":
                myCoffeeMachine.executeMachine()
                checkInfo()
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
                checkInfo()
            default:
                continue
            }
        }
    }
    
    // Пременные класса
    
    let myCoffeeMachine = coffeeMachine()
    
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
        """)
    }
    
    var idProcces = [
    0: "коффемонстр запущен и жаждет работы!",
    1: "идёт приготовление кофе",
    2: "идёт очистка кофемашины",
    3: "добавляем указанное количество воды",
    4: "добавляем указанное количество молока",
    5: "добавляем указанное количество коффе",
    6: "в резервуаре нет места для указанного количества воды ",
    7: "в резервуаре нет места для указанного количества молока",
    8: "В резервуаре нет места для указанного количества кофе",
    10: "коффемонстр выключен и мечтает чтобы ты включил его!" ]
}
