using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EdisonEmp
{
    public class LogData : System.Web.SessionState.IRequiresSessionState
    {
        private const string LogName = "UserLog";

        private static List<LogClass> UserLog()
        {
            if (HttpContext.Current.Session[LogName] == null)
                HttpContext.Current.Session[LogName] = new List<LogClass>();
            return HttpContext.Current.Session[LogName] as List<LogClass>;
        }

        public static void Add(int value)
        {
            LogClass log = new LogClass(value);
            List<LogClass> list = UserLog();
            list.Add(log);
        }

        public static List<LogClass> UserLogItems()
        {
            return UserLog();
        }

        public static void Clear()
        {
            List<LogClass> log = UserLog();
            log.Clear();
        }
    }
}