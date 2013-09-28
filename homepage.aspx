<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="homepage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html lang="en">
  
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Limelight|Flamenco|Federo|Yesteryear|Josefin Sans|Spinnaker|Sansita One|Handlee|Droid Sans|Oswald:400,300,700" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascading/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascading/bootstrap-responsive.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascading/common.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascading/fontawesome.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascading/project.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascading/homepage.css" media="screen" rel="stylesheet" type="text/css" />
    <!-- Typekit fonts require an account and a kit containing the fonts used. see https://typekit.com/plans for details. <script type="text/javascript" src="//use.typekit.net/YOUR_KIT_ID.js"></script>
  <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
-->
    <title>Homepage</title>
  </head>
  
  <body>
      <form id="form1" runat="server">
          
          <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <div class="container-fluid maincontent">
      <div class="row-fluid" id="header">
        <span class="span12">
          <div class="well well-1">
            <div class="pull-right">
              <button class="btn pull-left">Home</button>
              <button class="btn pull-center">Logout</button>
            </div>
            <div>
              <h1 class="heading">Rate My MP</h1>
              <p>Engage Your Representatives</p>
            </div>
          </div>
        </span>
      </div>
      <div class="row-fluid row-fluid-1" id="middle">
        <span class="span4">
          <div class="well">
            <div>
              <h2 class="heading">Select a Member</h2>
            </div>
              <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                  <ContentTemplate>
            <div class="div-1">
              <asp:DropDownList ID="DropDownListState" runat="server" AutoPostBack="true" AppendDataBoundItems="True"   OnSelectedIndexChanged="DropDownListState_SelectedIndexChanged"  ><Items> <asp:listitem>State</asp:listitem></Items></asp:DropDownList>
            </div>
            <div class="div-1">
             <asp:DropDownList ID="DropDownListConstituency" runat="server" AppendDataBoundItems="true"> <Items><asp:ListItem>Constituency</asp:ListItem></Items></asp:DropDownList>
           
            </div>
                      </ContentTemplate>
              </asp:UpdatePanel>
                 <div class="pull-left">
               <asp:Button ID="BtnSearch" class="btn" runat="server" Text="Search" OnClick="BtnSearch_Click" />
                     <asp:HiddenField ID="HiddenFieldconstituencyId" runat="server"  /> 
             <!--- <Button class="btn">Search</Button>  -->
            </div>
                      

            
          </div>
        </span>
        <span class="span8">
          <span></span>
          <div class="well issue_cont">
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>
                <asp:DataList ID="DataListIssues" runat="server" OnItemCommand="DataListIssues_ItemCommand" OnItemDataBound="DataListIssues_ItemDataBound">
                    <ItemTemplate>
           <div class="well well-4 well-5 well-8">
            <div class="row-fluid">
              <span class="span12">
                <div class="div-3">
                  <div class="row-fluid">
                    <span class="span2">
                      <div class="well well-2 well-6 imageleft ">
                          <asp:Image ID="Image1" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"profilePic") %>' />
                      </div>
                    </span>
                    <span class="span10">
                      <div class="well well-2 well-5 contentright">
                        <label class="control-label"></label>
                        <label class="control-label editing-element cke_editable cke_editable_inline cke_contents_ltr"> <asp:Label ID="postedBy" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "firstName") %>'></asp:Label>  <asp:Label ID="lastName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lastName") %>'> </asp:Label> <span>on</span> <asp:Label ID="PostedOn" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "postedOn") %>'></asp:Label> </label>
                        <label class="control-label"></label>
                        <label class="control-label editing-element cke_editable cke_editable_inline cke_contents_ltr" ><asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"voteCount") %>'></asp:Label>  People posted about it.</label></label>
                      </div>
                    </span>
                  </div>
                </div>
              </span>
            </div> <pre class="dom-pre"> <asp:Label ID="issueText" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"issueText") %>'></asp:Label></pre> 
            <div class="div-4">
              <label class="control-label"></label>
            </div>
            <div>
              <label class="control-label control-label-2">
                  <asp:Label ID="number_of_people_posted" runat="server" Text=""></asp:Label> People posted</label>
            </div>
               <asp:Panel ID="Panel2" runat="server">
            <div class="div-5"> 
                <i class="icon icon-thumbs-up"></i> <asp:LinkButton ID="LinkButtonSupport" CommandName="support" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"issueId") %>' runat="server" ><%# DataBinder.Eval(Container.DataItem, "supportCount") %> Support </asp:LinkButton> 
                <i class="icon icon-thumbs-down"></i>  <asp:LinkButton ID="LinkButtonDeny" CommandName="deny" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"issueId") %>' runat="server"><%# DataBinder.Eval(Container.DataItem, "denyCount") %> Deny</asp:LinkButton>
                 <i class="icon icon-comments"></i>  <asp:LinkButton ID="LinkButtonComment" CommandName="comment" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"issueId") %>' runat="server"  ><%# DataBinder.Eval(Container.DataItem, "commentCount") %>Comment</asp:LinkButton>
                <asp:HiddenField ID="HiddenFieldissueId" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"issueId") %>' />
            </div>
               </asp:Panel>

          </div>     
                   <asp:UpdatePanel ID="UpdatePanel3" runat="server" >
                      <ContentTemplate>
                         <asp:Panel ID="Panel1" runat="server" EnableViewState="true" ViewStateMode="Enabled" >
                           <asp:DataList ID="DataListComments" runat="server" OnItemCommand="DataListComments_ItemCommand" >
                            <ItemTemplate>
                              
                            <asp:Image ID="imgposter" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"profilePic") %>' Height="40" Width="40" />
                            <asp:Label ID="LabelCommnets" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"comment") %>'> </asp:Label><label style="background-color:aliceblue"> Dated: <%# DataBinder.Eval(Container.DataItem,"postedOn") %> </label>
                            <div class="div-5"> 
                                   
                                    <i class="icon icon-thumbs-up"></i> <asp:LinkButton ID="LinkButtonLike" CommandName="like" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"commentId") %>' runat="server"  ><%# DataBinder.Eval(Container.DataItem,"likeCount") %> Like </asp:LinkButton> 
                                    <i class="icon icon-thumbs-down"></i>  <asp:LinkButton ID="LinkButtonDislike" CommandName="dislike" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"commentId") %>' runat="server"><%# DataBinder.Eval(Container.DataItem,"dislikeCount") %> Dislike</asp:LinkButton>
                             </div>

                                    
                              </ItemTemplate>
                         </asp:DataList>
                             <asp:TextBox ID="TxtComment" runat="server" TextMode="MultiLine" ></asp:TextBox>
                             <asp:UpdatePanel runat="server">
                                 <ContentTemplate>
                                     
                                   <asp:LinkButton ID="btnpost" runat="server" Text="Post" CommandName="post"  />
                                 </ContentTemplate>
                                 <Triggers>
                                     <asp:AsyncPostBackTrigger ControlID="btnpost" EventName="Click" />
                                 </Triggers>
                             </asp:UpdatePanel>
                                 
                             
                                    
                         </asp:Panel>
                                
                                     
                         <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
                         TargetControlID="Panel1"
                         ExpandControlID="LinkButtonComment"
                         CollapseControlID="LinkButtonComment" 
                         Collapsed="True"
                         SuppressPostBack="true"
                         
                            />                        
                      </ContentTemplate>
                                 
                         </asp:UpdatePanel>
                     </ItemTemplate>
                     
                    </asp:DataList>
                    </ContentTemplate>
                  </asp:UpdatePanel>
            </div>
          </div>
        </span>
      </div>
      <div class="row-fluid" id="footer">
        <span class="span12">
          <div class="well well-2">
            <a class="dom-link" href="#">About Us &nbsp;|</a>
            <a class="dom-link" href="#">Our Mission &nbsp;|</a>
            <a class="dom-link" href="#">Contact Us</a> <i class="icon icon-twitter-sign pull-right"></i>  <i class="icon icon-facebook-sign pull-right"></i>  <i class="icon icon-google-plus-sign pull-right"></i> 
          </div>
        </span>
      </div>
    </div>
              
      </form>   
  </body>

</html>