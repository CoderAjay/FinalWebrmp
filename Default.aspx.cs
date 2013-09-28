using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class _Default : System.Web.UI.Page
{
    IssuesBAL issuesbal = new IssuesBAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        loadDataList();
    }
    private void loadDataList()
    {   // loading issues in data list
        //DataList1.DataSource = (DataTable)issuesbal.getIssues();
        //DataList1.DataBind();
    }

  }