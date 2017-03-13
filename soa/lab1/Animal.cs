using System;
using System.Collections.Generic;

namespace zoo
{
	public class Animal
	{
		public string name { get; set; }
		public float weight { get; set; }
		public bool hasFur { get; set; }
		public Animal()
		{
			this.name = "no name";
			this.weight = (float)0.0;
			this.hasFur = false;
		}

		public Animal(string name, float weight, bool hasFur)
		{
			this.name = name;
			this.weight = weight;
			this.hasFur = hasFur;
		}

		public virtual string Sound() { return ""; }
		public virtual string Trick() { return ""; }
		public virtual int CountLegs() { return 0; }
	}

	public interface ICircus
	{
		string AnimalsIntroduction();
		string Show();
		int Patter(int howMuch);
	}

	public interface IZoo
	{
		string Sounds();
	}

	public class Circus : ICircus
	{ 
		public List<Animal> Animals { get; set; }
		public string name { get; set; }
		public Circus()
		{
			this.Animals = new List<Animal>();
			this.Animals.Add(new Cat());
			this.Animals.Add(new Pony());
		}
		public string AnimalsIntroduction()
		{
			string all = "";
			this.Animals.ForEach(delegate (Animal zwierze){
				all += zwierze.Sound() + " ";
			});
			return all;
		}
		public string Show()
		{
			string all = "";
			this.Animals.ForEach(delegate (Animal zwierze)
			{
				all += zwierze.Trick() + " ";
			});
			return all;
		}
		public int Patter(int howMuch)
		{
			int sum = 0;
			this.Animals.ForEach(delegate (Animal zwierze)
			{
				sum += zwierze.CountLegs() * howMuch;
			});
			return sum;
		}

	}

	public class Zoo : IZoo
	{ 
		public List<Animal> Animals { get; set; }
		public string name { get; set; }
		public Zoo() 
		{
			this.Animals = new List<Animal>();
			this.Animals.Add(new Ant());
			this.Animals.Add(new Pony());
			this.Animals.Add(new Cat());
		}
		public string Sounds()
		{ 
			string all = "";
			this.Animals.ForEach(delegate (Animal zwierze)
			{
				all += zwierze.Sound() + " ";
			});
			return all;
		}
	}

}
