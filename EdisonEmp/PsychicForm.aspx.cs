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
            if (!IsPostBack)
            {
                LogData.Clear();
            }
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
            int value = Convert.ToInt32(tbNumber.Text);
            Session["InputValue"] = value;
            LogData.Add(value);
            gvPsychicStatus.DataBind();
            divHeadInp.Visible = false;
            divHeadMem.Visible = true;
            tbNumber.Text = String.Empty;
            Session["InputValue"] = 0;
            gvLogValues.DataBind();
        }

        protected void gvPsychicStatus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "History")
            {
                string argument = e.CommandArgument.ToString();
                string url = "PsychicHistory.aspx?NUM=" + argument; 
                string s = "OpenCenterScreen('" + url + "', 300, 500);";
                const String csname = "PsychicHistory";
                Type cstype = this.GetType();
                ClientScriptManager cs = Page.ClientScript;
                if (!cs.IsStartupScriptRegistered(cstype, csname))
                    ClientScript.RegisterStartupScript(this.GetType(), csname, s, true);

            }
        }
    }
}