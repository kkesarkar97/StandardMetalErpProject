using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CommonUtilities
{
  public static  class UtilityClass
    {


        public static string ConcateArray(string[] arr, string delim)
        {
            string str = "";

            Object boj = new object();

            foreach (string str1 in arr)
            {
                str += str1 + delim;

            }
            return str;
        }
    }
}
