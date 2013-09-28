using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CommentDAL
/// </summary>
public class CommentDAL
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["rateMyMPConnectionString"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter dap;
    string query;


	public CommentDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable getComments(Int64 issueId)
    {
        try
        {

            query = "COMMENT_FETCHING";
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            dap = new SqlDataAdapter(query, con);
            dap.SelectCommand.CommandType = CommandType.StoredProcedure;
            dap.SelectCommand.Parameters.AddWithValue("@issueId",issueId );
            DataSet ds = new DataSet();
            dap.Fill(ds, "temp");
            con.Close();
            dap.Dispose();
            return ds.Tables["temp"];
        }
        catch
        {
            throw;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
    }
    public void postComment(commentsBO commentbo)
    {
        try
        {

            query = "COMMENT_INSERTED";
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = new SqlCommand(query, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@guid", commentbo.guid);
            cmd.Parameters.AddWithValue("@issueId", commentbo.issueId);
            cmd.Parameters.AddWithValue("@comment", commentbo.comment);
            cmd.Parameters.AddWithValue("@postedOn", DateTime.Now);
            cmd.ExecuteNonQuery();

        }
        catch
        {
            throw;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

    }

}