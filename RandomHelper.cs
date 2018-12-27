using System;

namespace asdf {
    public class RandomHelper {
        Random rand = new Random();
        public string GetRandomString(int length){
            const string chars = @"aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ0123456789!@#$%^&*()-_=+";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public double GetRandomDouble(){
            rand.NextDouble();
        }

        public int GetRandomInt(){
            rand.Next();
        }

        public bool GetRandomBool(){
            int rando = rand.Next(0,1);
            return rando == 1;
        }
    }
}