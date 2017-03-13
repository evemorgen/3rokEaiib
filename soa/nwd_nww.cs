using System;

namespace nww
{
    class MainClass
    {

        public static int NWD(int first, int second)
        {
            int divisor = 1;
            int nwd = 1;
            while (divisor < first && divisor < second)
            {
                if (first % divisor == 0 && second % divisor == 0)
                {
                    nwd = divisor;
                }
                divisor += 1;
            }
            return nwd;
        }

        public static int NWW(int first, int second)
        {
            return first * second / NWD(first, second);
        }

        public static void Main(string[] args)
        {
            if (args.Length == 2)
            {
                int first = Int32.Parse(args[0]);
                int second = Int32.Parse(args[1]);
                Console.WriteLine(String.Format("NWD liczb {0} i {1} to {2}", first, second, NWD(first, second)));
                Console.WriteLine(String.Format("NWW liczb {0} i {1} to {2}", first, second, NWW(first, second)));
            }
        }
    }
}

