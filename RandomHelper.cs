using System;

namespace MagicStringToBeReplaced {
    public class RandomHelper {
        private Random rand = new Random();
        public static string GetRandomString(int length){
            const string chars = @"aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ0123456789!@#$%^&*()-_=+";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public static double GetRandomDouble(){
            rand.NextDouble();
        }

        public static int GetRandomInt(){
            rand.Next();
        }

        public static bool GetRandomBool(){
            int rando = rand.Next(0,1);
            return rando == 1;
        }
    }
}