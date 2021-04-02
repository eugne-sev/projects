using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdisonEmp
{
    public partial class PsychicHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                lblName.Text = "Ответы от " + PsychicData.PsychicItem(Convert.ToInt32(Request["NUM"])).Name;
            }
        }
    }
}