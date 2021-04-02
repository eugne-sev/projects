using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EdisonEmp
{
    [Serializable]
    public class LogClass
    {
        public int Value { get; set; }
        public DateTime DateLog { get; set; }

        public LogClass(int value)
        {
            Value = value;
            DateLog = DateTime.Now;
        }
    }


}