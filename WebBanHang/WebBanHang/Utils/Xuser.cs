using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class Xuser
    {
        public static bool IsAuthenticate
        {
        get
            {
            var user = HttpContext.Current.Session["user"];
            return user != null;
        }
        }
    }
