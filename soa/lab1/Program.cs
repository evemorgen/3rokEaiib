using System;
using System.Linq;

namespace zoo
{
	class MainClass
	{
		public static void Main(string[] args)
		{
			Circus cyrk = new Circus();
			Zoo zoo = new Zoo();
			
			var options = String.Format(@"a ) Prezentacja Zwierząt w cyrku {0}
b ) Obejrzenie programu cyrku {1}
c ) Posłuchanie dźwięków Zoo {2}
d ) Wyświetla imię pierwszego znalezionego futrzaka w Zoo {3}
e ) wyświetla wszystkie imiona zwierząt w Cyrku {4}
", cyrk.name, cyrk.name, zoo.name, zoo.name, zoo.name);
			Console.WriteLine(options);

			switch (Console.ReadKey().Key)
			{ 
				case ConsoleKey.A:
					Console.WriteLine(cyrk.AnimalsIntroduction());
					break;
				case ConsoleKey.B:
					Console.WriteLine(cyrk.Show());
					break;
				case ConsoleKey.C:
					Console.WriteLine(zoo.Sounds());
					break;
				case ConsoleKey.D:
					Console.WriteLine(zoo.Animals.FirstOrDefault());
					break;
				case ConsoleKey.E:
					zoo.Animals.ForEach(delegate (Animal zwierze)
					{
						Console.Write(zwierze.name + " ");
					});
					break;
			}
		}
	}
}
