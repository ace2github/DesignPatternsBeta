# DesignPatternsBeta
	设计模式的实践，语言以OBJC、SWift为主~

*	2016-06-01   
单例工厂模式：实现OC的单例工厂模式，为所有的类自动添加单例模式，并且提供清除单例的方法
		
		//Student继承与Person
		[Person singleton].name = @"Person :: hello world";
		[Student singleton].name = @"Student :: hello world";
		[Student singleton].grade = @"小一班";
		
		[Person clearSingleton];
		[Person singleton].name = @"New Person %d :: hello world";
		
		[Student clearSingleton];
		[Student singleton].name = @"New Student :: hello world";
