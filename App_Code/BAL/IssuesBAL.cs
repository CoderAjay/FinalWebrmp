﻿using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
/// <summary>

/// </summary>
public class IssuesBAL
{
    private IssuesDAL ob = new IssuesDAL();
    public IssuesBAL()
    {
    }
    public DataTable getIssues()
    {
        try
        {
            return ob.getIssues();
        }
        catch
        {
            throw;
        }
        finally
        {
        }
    }
    public void postIssue(issuesBO issuesbo)
    {
        try
        {
           ob.postIssues(issuesbo);
        }
        catch
        {
            throw;
        }
        finally
        {
        }
    }
 
 }
