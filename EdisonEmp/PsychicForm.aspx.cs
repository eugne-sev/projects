using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdisonEmp
{
    public partial class PsychicForm : System.Web.UI.Page
    {
        private const string PsychicField = "PsychicClass";
        public List<PsychicClass> PsychicList
        {
            get
            {
                if (Session[PsychicField] == null)
                    Session[PsychicField] = PsychicData.CreateList();
                return Session[PsychicField] as List<PsychicClass>;
            }
            set
            {
                Session[PsychicField] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMake_Click(object sender, EventArgs e)
        {
            PsychicData.Clear(PsychicList);
            divGuess.Visible = true;
            divHeadInp.Visible = true;
            divHeadMem.Visible = false;
        }

        protected void btnInput_Click(object sender, EventArgs e)
        {
            Session["InputValue"] = Convert.ToInt32(tbNumber.Text);
            gvPsychicStatus.DataBind();
            divHeadInp.Visible = false;
            divHeadMem.Visible = true;
            tbNumber.Text = String.Empty;
            Session["InputValue"] = 0;
        }
    }
}