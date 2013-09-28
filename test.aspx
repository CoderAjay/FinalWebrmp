<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div> 
        
<asp:repeater id="Blog" Runat="server"> 
    <HeaderTemplate>
         <table width="100%" border="1" cellpadding="0" cellspacing="0">
              <tr><td> </HeaderTemplate> 
    <ItemTemplate> 
        <asp:Literal Runat="server" ID="DayBox"> </td></tr></table>
        <div align="right"><a href="#TopPage">Top </a></div><br> 
            <table width="100%" border="1" cellpadding="0" cellspacing="0"><tr><td> </asp:Literal> 
        <asp:Panel Runat="server" ID="DayTitle"> <h3></h3> </asp:Panel>
         <p align="justify"> <b><%# Container.DataItem("Title") %></b> @ <%# DataBinder.Eval(Container.DataItem, "AddedDate", "{0:hh:mm tt}") %> <br> 
             <%# Container.DataItem("Message") %> <br> -- <%# Container.DataItem("CommentsCount") %> comments:
              <asp:HyperLink ID="HyperLink1" Runat="server" Visible=' <%# Container.DataItem("CommentsCount") > 0 %>'
                   NavigateUrl='<%# "javascript:ToggleDivState(div" & Container.DataItem("MessageID") & ");" %>'>
                   View</asp:HyperLink> - <a href='<%# "javascript:ShowCommentBox(" & Container.DataItem("MessageID") & ");" %>'> 
                       Post your own comment</a> <div style="display:'none'; margin-left:2.0em; margin-top:.8em; " ID='<%# "div" & Container.DataItem("MessageID") %>'> 
                           <asp:DataList ID="DataList1" Runat="server" Width="500px" ItemStyle-BackColor="whitesmoke" AlternatingItemStyle-BackColor="white" DataSource='<%# Container.DataItem.Row.GetChildRows ("MsgComments") %>'
                                OnDeleteCommand="Comments_DeleteCommand" OnItemCreated="Comments_ItemCreated" OnEditCommand="Comments_EditCommand"> <ItemTemplate> <p align="justify"> <u>Posted by <a class="comment" href='<%# "mailto:" & Container.DataItem("Email") %>'> <%# Container.DataItem("Author") %></a></b> @ <%# CType(Container.DataItem("AddedDate"), Date).ToString("hh:mm tt, MMMM dd") %> </u> <br> <%# Container.DataItem("Comment") %> </p> </ItemTemplate> <SeparatorTemplate><br></SeparatorTemplate> </asp:DataList> </div> </p> </ItemTemplate> <FooterTemplate> </td></tr></table><div align="right"><a href="#TopPage">Top</a> </div><br> </FooterTemplate> </asp:repeater>


    </div>
    </form>
</body>
</html>
