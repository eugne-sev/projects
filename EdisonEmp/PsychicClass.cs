using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EdisonEmp
{
    [Serializable]
    public class PsychicClass
    {
        /// <summary>
        /// Номер в списке
        /// </summary>
        public int Number { get; set; }
        /// <summary>
        /// Имя экстрасенса
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Результат догадки
        /// </summary>
        public int Value { get; set; }
        /// <summary>
        /// Сколько раз угадано значение
        /// </summary>
        public int Guessed { get; set; }

        public PsychicClass()
        {
            
        }

        public PsychicClass(int number, string name)
        {
            Number = number;
            Name = name;
        }
    }
}