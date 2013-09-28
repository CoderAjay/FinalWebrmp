using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class homepage : System.Web.UI.Page
{
    private ConstituencyBAL constituency = new ConstituencyBAL();
    private StateBAL statebal = new StateBAL();
    private IssuesBAL issuesbal = new IssuesBAL();
    private SupportDenyBAL supportdenybal = new SupportDenyBAL();
    private LikeDislikeBAL likedislikebal = new LikeDislikeBAL();
    private CommentBAL commentbal = new CommentBAL();
  
    protected void Page_Load(object sender, EventArgs e)
    {
        BtnSearch.Enabled = false;
        if (!Page.IsPostBack)
        {
            loadStates();
            loadDataList();
        }
    }
     private void loadStates()
  {
        //loading states in drop dow list 
        DropDownListState.DataSource = (DataTable)statebal.getData();
        DropDownListState.DataTextField = "state";
        DropDownListState.DataValueField = "stateId";
        DropDownListState.DataBind();
    }

    protected void DropDownListState_SelectedIndexChanged(object sender, EventArgs e)
    {
        Int16 stateId = Convert.ToInt16(DropDownListState.SelectedValue);
        //Label2.Text = "this is done " + stateId.ToString();
        DropDownListConstituency.Items.Clear();
        DropDownListConstituency.Items.Add("Constituency");
        DropDownListConstituency.DataSource = (DataTable)constituency.getData(stateId);
        DropDownListConstituency.DataTextField = "constituency";
        DropDownListConstituency.DataValueField = "constituencyId";
        DropDownListConstituency.DataBind();
    }


    private void loadDataList()
    {   // loading issues in data list
        DataListIssues.DataSource = (DataTable)issuesbal.getIssues();
        DataListIssues.DataBind();
    }

    protected void DataListIssues_ItemCommand(object source, DataListCommandEventArgs e)
    {   supportDenyBO supportdenybo = new supportDenyBO();
     
        string btncmdname;
        try
        {

             
            btncmdname = e.CommandName.ToString();
            if (btncmdname == "support")
            {
                supportdenybo.guid = 1; /** from session **/
                supportdenybo.issueId = Convert.ToInt64(e.CommandArgument);
                supportdenybo.supportDeny = true;
                supportdenybal.updateData(supportdenybo);
                loadDataList();
            }
            if (btncmdname == "deny")
            {
                supportdenybo.guid = 1; /** from session **/
                supportdenybo.issueId = Convert.ToInt64(e.CommandArgument);
                supportdenybo.supportDeny = false;
                supportdenybal.updateData(supportdenybo);
                loadDataList();

            }
            if (btncmdname == "post")
            {  
                commentsBO commentsbo = new commentsBO();
                TextBox txtcomment = e.Item.FindControl("TxtComment") as TextBox;
                commentsbo.comment = ((TextBox)(e.Item.FindControl("TxtComment"))).Text;
                HiddenField issueIdh = e.Item.FindControl("HiddenFieldissueId") as HiddenField;
                Int64 issueId = Convert.ToInt64(issueIdh.Value);
        
                commentsbo.issueId = issueId;
                txtcomment.Text = "";
                commentsbo.guid = 1; /** from session **/
                commentbal.postComment(commentsbo);
                loadDataList();

              }
        }
        catch
        {
            throw;
        }
        finally
        {
             
        }


    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        
        Int16 constituencyId = Convert.ToInt16(DropDownListConstituency.SelectedValue);
        HiddenFieldconstituencyId.Value = constituencyId.ToString();
         Server.Transfer("usercomment.aspx",true);
        
    }
    protected void DataListIssues_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataList DataListComments = e.Item.FindControl("DataListComments") as DataList;
        HiddenField issueIdstr = e.Item.FindControl("HiddenFieldissueId") as HiddenField;
        Int64 issueId = Convert.ToInt64(issueIdstr.Value);
        DataListComments.DataSource = (DataTable)commentbal.getComments(issueId);
        DataListComments.DataBind();
    }
    protected void DataListComments_ItemCommand(object source, DataListCommandEventArgs e)
    {
        likeDislikeBo likedislikebo = new likeDislikeBo();
        string btncmdname = e.CommandName.ToString();
        Int64 commentId;
        try
        {
            commentId = Convert.ToInt64(e.CommandArgument);
            if (btncmdname == "like")
            {
                likedislikebo.guId = 1; /*** from session ***/
                likedislikebo.commentId = commentId;
                likedislikebo.likeDislike = true;
                Int64 issueId = likedislikebal.updateData(likedislikebo);
//                DataListComments.DataSource = (DataTable)commentbal.getComments(issueId);
  //              DataListComments.DataBind();
                loadDataList();
            }
            if (btncmdname == "dislike")
            {
                likedislikebo.guId = 1;
                likedislikebo.commentId = commentId;
                likedislikebo.likeDislike = false;
                likedislikebal.updateData(likedislikebo);
                Int64 issueId = likedislikebal.updateData(likedislikebo);
                //DataListComments.DataSource = (DataTable)commentbal.getComments(issueId);
                //DataListComments.DataBind();
                loadDataList();
            }
        

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