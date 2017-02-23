<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
       <b style="align-content: center; font-family: Calibri; text-decoration: wavy; color: purple">Welcome to IT asset Management</b>
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
                    <asp:Button ID="btnenter" runat="server" Text="search" OnClick="TxtDstn_Click" />
                    </td>
                </tr>

            <tr>
                <td>
                    <asp:GridView ID="gridView1"  runat="server" AutoGenerateColumns="False" Visible="false" DataSourceID="SqlDataSource2">
                         <Columns>
                             <asp:BoundField DataField="emp_id" HeaderText="Emp ID" ItemStyle-Width="150" />
                             <asp:BoundField DataField="emp_name" HeaderText="name" ItemStyle-Width="150" />
                              <asp:BoundField DataField="asset" HeaderText="Asset ID" ItemStyle-Width="150" />
                              <asp:BoundField DataField="dop" HeaderText="distributed date" ItemStyle-Width="150" />
                             <asp:BoundField DataField="status" HeaderText="status" ItemStyle-Width="150" />
                               </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                         SelectCommand="select * from employee " FilterExpression="emp_id ='{0}'">
                        <FilterParameters>
                            <asp:ControlParameter ControlID="txtDist" PropertyName="text" />
                        </FilterParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
            </tr>
            </table>
    </asp:View>
        <asp:View ID="view2" runat="server">
        <table style="background-color:lightgray;align-content:center" runat="server">
            <tr>
                <td>       
        <asp:Label ID="Ldinven1" runat="server" Text="asset ID:"> </asp:Label>
        <asp:TextBox ID="Txtinven1" runat="server"></asp:TextBox>
                    <asp:Button ID="btnEnter1" runat="server" Text="search"  />
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:GridView ID="gridView2" Visible="true"  runat="server" >
                        

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
