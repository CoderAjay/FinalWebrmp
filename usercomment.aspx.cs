using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class usercomment : System.Web.UI.Page
{
    HiddenField ob;
    private mpDetailsBAL mpdetailsbal = new mpDetailsBAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PreviousPage != null)
        {
            ob = (HiddenField)PreviousPage.FindControl("HiddenFieldconstituencyId");
        }
        if (ob != null)
        {

            Int16 constituencyId = Convert.ToInt16(ob.Value);
         //   loadmpdetails(constituencyId);

        }
        loadmpdetails(1);
    }

    private void loadmpdetails(Int16 constituencyId)
    {

        DataTable dt = new DataTable();
        dt = mpdetailsbal.getData(constituencyId); /** mpid fetch throught previous page ***/
        imgMpProfile.ImageUrl = dt.Rows[0]["profilePic"].ToString();
        lblname.Text = dt.Rows[0]["firstName"].ToString() + "  " + dt.Rows[0]["middleName"].ToString() + " " + dt.Rows[0]["lastName"].ToString();
        lblconstituency.Text = dt.Rows[0]["constituency"].ToString();
        lblparty.Text = dt.Rows[0]["partyName"].ToString() + "(" + dt.Rows[0]["Abbreviation"].ToString() + ")";
        lblemail.Text = dt.Rows[0]["email"].ToString();
        lblcontact.Text = dt.Rows[0]["mobile"].ToString();
        lbleducation.Text = dt.Rows[0]["qualification"].ToString();
        lblprofession.Text = dt.Rows[0]["profession"].ToString();
        lblpaddress.Text = dt.Rows[0]["permanentAddress"].ToString() + ", " + dt.Rows[0][12].ToString() + ", " + dt.Rows[0][13].ToString();
        lblcaddress.Text = dt.Rows[0]["currentAddress"].ToString() + ", " + dt.Rows[0][15].ToString() + ", " + dt.Rows[0][16].ToString();

    }
}