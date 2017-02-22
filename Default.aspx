<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp; <b style="align-content: center; font-family: Calibri; text-decoration: wavy; color: purple">Welcome to IT asset Management</b>
    </p>
    <center>
      <table  id="table1" style="background-color:lightgrey;border:groove;height:100px;width:500px; overflow:hidden; display:compact" runat="server">
         <tr>
             <td>
                 <asp:Button  OnClick="Tab1_Click" ID="btnAssetDstbd" Text="Distribution" runat="server" BorderStyle="None" Font-Bold="True" Font-Italic="True" />
                 <asp:Button ID="btnAssetIntry" OnClick="Tab2_Click" Text="Inventory"  runat="server" BorderStyle="None" Font-Bold="True" Font-Italic="True" />
             </td>
         </tr>
         <tr>
             <td>
                     <asp:MultiView ID="multiView1" runat="server" >
    <asp:View ID="view1" runat="server">
        <table style="background-color:lightgray;align-content:center" runat="server">
            <tr>
                <td>        <asp:Label ID="lbDist" runat="server" Text="emp ID:">
        </asp:Label>
        <asp:TextBox ID="txtDist" runat="server"></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:GridView ID="gridView1"  runat="server" AutoGenerateColumns="False">

                    </asp:GridView>
                    <br />
                </td>
            </tr>
            </table>
    </asp:View>
        <asp:View ID="view2" runat="server">
        <table style="background-color:lightgray;align-content:center" runat="server">
            <tr>
                <td>       
        <asp:Label ID="lbInven" runat="server" Text="asset Name:"></asp:Label>
        <asp:TextBox ID="Txtinven" runat="server"></asp:TextBox>
        <asp:Label ID="Ldinven1" runat="server" Text="asset Type:"> </asp:Label>
        <asp:TextBox ID="Txtinven1" runat="server"></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:GridView ID="gridView2"  runat="server" AutoGenerateColumns="False">

                    </asp:GridView>
                    <br />
                </td>
            </tr>
            </table>
    </asp:View>
        </asp:MultiView>
                 </td>
             </tr>
         </table>
       </center>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #table1 {
            height: 411px;
            width: 482px;
        }
        
    </style>
</asp:Content>
