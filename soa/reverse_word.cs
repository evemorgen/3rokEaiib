using System;
namespace odwrocone
{
    public class MainClass
    {
        public static void Main(string[] args)
        {
            if (args.Length > 0)
            {
                char[] word = args[0].ToCharArray();
                Array.Reverse(word);
                string reversed_word = new string(word);
                Console.WriteLine(reversed_word);
            }
        }
    }
}
