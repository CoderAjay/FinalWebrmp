<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usercomment.aspx.cs" Inherits="usercomment" %>

<!DOCTYPE html>

<html lang="en">
  
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Limelight|Flamenco|Federo|Yesteryear|Josefin Sans|Spinnaker|Sansita One|Handlee|Droid Sans|Oswald:400,300,700" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascadingusercomment/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascadingusercomment/bootstrap-responsive.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascadingusercomment/common.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascadingusercomment/fontawesome.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascadingusercomment/project.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="cascadingusercomment/main.css" media="screen" rel="stylesheet" type="text/css" />
    <!-- Typekit fonts require an account and a kit containing the fonts used. see https://typekit.com/plans for details. <script type="text/javascript" src="//use.typekit.net/YOUR_KIT_ID.js"></script>
  <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
-->
    <title>main</title>
  </head>
  
  <body>
   <%--  --%>
      <form id="frmusercomment" runat="server">
    <div id="absolute-wrapper">
    </div>
    <div class="container-fluid">
      <div class="row-fluid" id="header">
        <span class="span12">
          <div class="well well-1">
            <button class="btn pull-right btn-1">Logout</button>
            <button class="btn pull-right btn-2">Home</button>
            <div>
              <h1 class="heading">Rate My MP</h1>
              <p>Engage Your Representatives</p>
            </div>
          </div>
        </span>
      </div>
      <div class="row-fluid row-fluid-1" id="middle">
        <span class="span4 usercomment">
          <div class="div-3">
            <div class="well div-1 div-2 div-4">
              <div>
                <h3 class="heading">Member of Parliament </h3>
              </div>
              <div>
                <div class="row-fluid row-fluid-1">
                  <span class="span4 ">
                    <div class="well div-1">
                        <asp:Image ID="imgMpProfile" runat="server" />
                    </div>
                  </span>
                  <span class="span8">
                    <div class="well div-1 div-2">
                      <div class="div-5">
                        <label class="control-label control-label-1 name1">Name</label> <asp:Label ID="lblname" CssClass="nameinput" runat="server" Text=""></asp:Label>
                      </div>
                      <div>
                        <div class="row-fluid">
                          <span class="span12">
                            <label class="control-label name1">Constituency:</label> <asp:Label ID="lblconstituency" CssClass="nameinput" runat="server" Text=""></asp:Label>
                          </span>
                        </div>
                      </div>
                      <div>
                        <label class="control-label control-label-1 name1">Party:</label> <asp:Label ID="lblparty" CssClass="nameinput" runat="server" Text=""></asp:Label>
                      </div>
                    </div>
                  </span>
                </div>
              </div>
              <div class="innermail">
                <label class="control-label control-label-2 mail1">E-mail:</label> <asp:Label ID="lblemail" CssClass="mailinput" runat="server" Text=""></asp:Label>
              </div >
              <div  class="innermail">
                <label class="control-label control-label-2 contact1">Contact:</label> <asp:Label ID="lblcontact" CssClass="contactinput" runat="server" Text=""></asp:Label>
              </div>
              <div  class="innermail">
                <label class="control-label control-label-2 edu1">Educational Qualifications:</label> <asp:Label ID="lbleducation" CssClass="eduinput" runat="server" Text=""></asp:Label>
              </div>
              <div  class="innermail">
                <label class="control-label control-label-2 prof1">Profession:</label> <asp:Label ID="lblprofession" CssClass="profinput" runat="server" Text=""></asp:Label>
              </div>
              <div  class="innermail">
                <label class="control-label control-label-2 peradd1">Permanent Address:</label> <asp:Label ID="lblcaddress" CssClass="peraddinput" runat="server" Text=""></asp:Label>
              </div>
              <div class="innermail">
                <label class="control-label control-label-2 preadd1">Present Address:</label> <asp:Label ID="lblpaddress" CssClass="preaddinput" runat="server" Text=""></asp:Label>
              </div>
            </div>
          </div>
        </span>
        <span class="span8">
          <div class="div-7">
            <div class="well issue_cont well-2">
                 <div class="logo">
                     <asp:Image ID="Image2" runat="server" ImageUrl="~/image/images (1).png" />
                     </div>
              <div class="div-8">
                <div class="div-9"> <i class="icon icon-bold"></i>  <i class="icon icon-italic"></i>  <i class="icon icon-underline"></i>  <i class="icon icon-cut"></i>  <i class="icon icon-align-justify"></i>  <i class="icon icon-align-left"></i>  <i class="icon icon-align-center"></i>  <i class="icon icon-align-right"></i> 
                </div>
                 
                <div>
                  <textarea placeholder="Post Issue" name=""></textarea>
                </div>
                <div class="div-10">
                  <button class="btn">Attach file</button>
                  <button class="btn btn-3">post</button>
             
                </div>
              </div>
              <div>
                  <asp:DataList ID="DataList1" runat="server">
                      <ItemTemplate>
                          <div class="row-fluid">
                  <span class="span2">
                    <div class="well"></div>
                  </span>
                  <span class="span10">
                    <label class="control-label">
                        <asp:Label ID="name" runat="server" Text=""></asp:Label> ,<asp:Label ID="date" runat="server" Text=""></asp:Label> </label>
                    <label class="control-label">Votes by Rahul ,Asha and 75 more</label> <pre class="dom-pre"><asp:Label ID="issue_posted" runat="server" Text=""><br></br>
                        <asp:Image ID="evidence" runat="server"></asp:Image> </asp:Label>
</pre> 
                    <div>
                        <i class="icon icon-thumbs-up"></i><asp:LinkButton ID="LinkButton1" runat="server">Support</asp:LinkButton>  
                       <i class="icon icon-thumbs-down"></i>  <asp:LinkButton ID="LinkButton2" runat="server">Deny</asp:LinkButton> 
                        <i class="icon icon-comments"></i> <asp:LinkButton ID="LinkButton3" runat="server">Comment</asp:LinkButton> 
                    </div>
                  </span>
                </div>
                      </ItemTemplate>
                  </asp:DataList>
                
              </div>
            </div>
          </div>
        </span>
      </div>
      <div class="row-fluid" id="bottom">
          <span class="span12">
            <div class="well">
              <a class="dom-link" href="#">About Us &nbsp;|
              <a class="dom-link" href="#">Our Mission &nbsp;|</a>
              <a class="dom-link" href="#">Contact Us</a> <i class="icon icon-twitter-sign pull-right"></i>  <i class="icon icon-facebook-sign pull-right"></i>  <i class="icon icon-google-plus-sign pull-right"></i> 
            </div>
          </span>
        </div>

    </div>
          </form>
  </body>

</html>