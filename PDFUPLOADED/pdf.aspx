<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdf.aspx.cs" Inherits="PDFUPLOADED.pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        ("#file-uploader").dxFileUploader({ uploadMode: "instantly", multiple: true, invalidFileExtensionMessage: "type not allowed", })
onUploaded: function (e) {  
     var files = this.option("value");  
           for (var i = 0; i < files.length; i++)  
            {  
               if (e.file.name == files[i].name)  
               {  
                  files.splice(i,1);  
             }  
           }  
 this.option("value", files);  
}  
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">
            <asp:Label ID="Label1" runat="server" Text="Uplaod "></asp:Label>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" ToolTip="Select Only pdf File" AllowMultiple="True" />
            <br />
            <asp:Button ID="Button1" runat="server" onchange="onUploaded(this)" OnClick="Button1_Click" Text="Upload" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="View Data File" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <br />

  </div>
            <asp:GridView ID="GridView1" runat="server" Caption="Show Data " Width="100%" CaptionAlign="Top" HorizontalAlign="Justify" DataKeyNames="id" onselectedindexchanged="GridView1_SelectedIndexChanged" ToolTip="Excel FIle DownLoad Tool" CellPadding="2" ForeColor="Black" GridLines="None" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">  
            <Columns>  
                <asp:CommandField ShowSelectButton="True" SelectText="Download" ControlStyle-ForeColor="Blue" > 
<ControlStyle ForeColor="Blue"></ControlStyle>
                </asp:CommandField>
                </Columns>  
            <FooterStyle BackColor="Tan" />  
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />  
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />  
            <HeaderStyle BackColor="Tan" Font-Bold="True" />  
            <AlternatingRowStyle BackColor="PaleGoldenrod" /> 
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>  
             
        
    </form>
</body>
</html>
