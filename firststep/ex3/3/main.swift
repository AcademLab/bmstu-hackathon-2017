//
//  main.swift
//  3
//
//
//  Copyright © 2017 Amin Benarieb. All rights reserved.
//

import Foundation
import Dispatch

struct Glass {
	var index : Int
	var isPoisoned : Bool
}

var isDead = false
let kPoisonAffectInterval = 5 // Интервал воздействия отрпавления
let kGlassDrinkInterval = 2 // Промежуток между питием из стаканов

func drinkFromGlass(glass : Glass, inQueue drinkQueue : DispatchQueue, competition : @escaping (_ glass : Glass) -> Void )
{
	print("-> Пьем стакан под номером \(glass.index + 1).")
	let additionalTime = DispatchTimeInterval.seconds(kPoisonAffectInterval)
	drinkQueue.asyncAfter(deadline: .now() + additionalTime) {
		competition(glass)
	}
}

func main() {
	guard #available(OSX 10.10, *)
		else {
			return
	}
	
	// Пытаемся перевести, что говорят иноплянетяне
	guard let rawInput = readLine(),
		   let poisonedGlassNumber = Int(rawInput),
		poisonedGlassNumber > 1 && poisonedGlassNumber < 11
		else
	{
			print("Invalid number.")
			abort()
	}

	// Наливаем жидкость в стаканы
	var glasses = [Glass]()
	for glassIdx in 0..<10 {
		glasses.append(Glass(index: glassIdx, isPoisoned: false))
	}

	// Отправляем нужный стакан
	glasses[poisonedGlassNumber - 1].isPoisoned = true

	// Пьем стаканы каждый час/10 мин/... и засекаем время
	let drinkAffectQueue = DispatchQueue(label: "com.aminbenarieb.drinkAffectQueue",
										 qos: .default)
	for glassIdx in 0..<10
	{
		let firstDrink = glassIdx == 0 ? 0 : 1
		sleep(UInt32(kGlassDrinkInterval * firstDrink))
		if (isDead)
		{
			break
		}
		
		drinkFromGlass(glass: glasses[glassIdx], inQueue: drinkAffectQueue, competition:
			{
				(glass) in
				
				let logPrefix = "[Прошло 10 часов с момента пития из стакана под номером \(glassIdx+1)]. "
				
				if (glass.isPoisoned)
				{
					isDead = true
					drinkAffectQueue.suspend()
					print(logPrefix+"Ооо нет, кажется отра.... x_X")
				}
				else {
					print(logPrefix + "Фух, стакан под номером \(glassIdx+1) не содержит яда!")
				}
		})
	}

	_ = readLine()

}

main();
