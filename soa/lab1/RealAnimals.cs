using System;
namespace zoo
{
	public class Cat : Animal
	{
		public string color { get; set; }
		public override string Sound()
		{
			return "Meow";
		}

		public override string Trick()
		{
			return "Catch red dot";
		}

		public override int CountLegs()
		{
			return 4;
		}
	}

	public class Pony : Animal
	{
		public bool isMagic { get; set; }
		public override string Sound()
		{
			return "Rainbowwwwww";
		}
		public override string Trick()
		{
			return "make a wis, idiot";
		}
		public override int CountLegs()
		{
			return 4;
		}
	}

	public class Ant : Animal
	{
		public bool isQueen { get; set; }
		public override string Sound()
		{
			return "mumble, mumble";
		}
		public override string Trick()
		{
			return "satisfy the queen ( ͡° ͜ʖ ͡°)";
		}
	}

	public class Elephant : Animal { }
	public class Giraffe : Animal { }
}
