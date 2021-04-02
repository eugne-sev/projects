using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EdisonEmp
{
    public class PsychicData : System.Web.SessionState.IRequiresSessionState
    {
        public static List<PsychicClass> CreateList()
        {
            string[] names = {"Александр", "Алексей", "Борис", "Василиса", "Георгий", "Дмитрий", "Евгений", "Егор", "Павел", "Роман"};
            List<PsychicClass> list = new List<PsychicClass>();
            for (int i = 0; i < names.Length; i++)
            {
                list.Add(new PsychicClass(i+1, names[i]));
            }
            return list;
        }

        public static void Clear(List<PsychicClass> list)
        {
            foreach (PsychicClass p in list)
            {
                p.Value = 0;
                p.Answers.Clear();
            }
        }

        public static List<PsychicClass> BuildResult(ref Object dataList)
        {
            List<PsychicClass> list = dataList as List<PsychicClass>;
            if (list == null)
                list = CreateList();
            Random rnd = new Random();
            foreach (PsychicClass p in list)
            {
                if (p.Value == 0)
                {
                    p.Value = rnd.Next(10, 99);
                    LogClass a = new LogClass(p.Value);
                    p.Answers.Add(a);
                }
            }
            HttpContext.Current.Session["PsychicClass"] = list;
            return list;
        }

        public static List<PsychicClass> BuilStatus(int value, ref Object dataList)
        {
            List<PsychicClass> list = dataList as List<PsychicClass>;
            if (value > 9)
            {
                foreach (PsychicClass p in list)
                {
                    if (p.Value == value)
                        p.Guessed++;
                    else if(p.Guessed > 0)
                        p.Guessed--;
                }
                HttpContext.Current.Session["PsychicClass"] = list;
            }
            return list;
        }

        public static PsychicClass PsychicItem(int number)
        {
            List<PsychicClass> list = HttpContext.Current.Session["PsychicClass"] as List<PsychicClass>;
            PsychicClass psychic = null;
            for (int i = 0; i < list.Count; i++)
            {
                psychic = list[i];
                if (psychic.Number == number)
                    break;
            }
            return psychic;
        }

        public static List<LogClass> PsychicAnswers(int number)
        {
            PsychicClass psychic = PsychicItem(number);
            return psychic.Answers;
        }
    }
}