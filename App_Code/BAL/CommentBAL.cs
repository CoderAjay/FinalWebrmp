using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for CommentBAL
/// </summary>
public class CommentBAL
{
    private CommentDAL commentdal = new CommentDAL();
	public CommentBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable getComments(Int64 issueId)
    {
        try
        {
            return commentdal.getComments(issueId);
        }
        catch
        {
            throw;
        }
        finally
        {

        }
    }
    public void postComment(commentsBO commentbo)
    {
        commentdal.postComment(commentbo);
    }
}